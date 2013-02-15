# encoding: utf-8
require 'strscan'

module Vorax

  module Parser

    class SubProgram

      attr_accessor :start_pos, :declare_pos, :end_pos, :text, :level
      attr_reader :name, :type
      
      def initialize(name, type, start_pos)
        @name = name
        @type = type
        @start_pos = start_pos
        @declare_pos = nil
        @end_pos = nil
        @text = ''
        @level = 0
      end

    end

    class BodySplit

      PLSQL_SPEC = '(?:\bpackage\b|\btype\b)'
      SUBPROG = '(?:\bfunction\b|\bprocedure\b)'
      BEGIN_MODULE = '(?:\bbegin\b)'
      END_MODULE = '(?:\bend\b)'

      def initialize
        spots = [BEGIN_ML_COMMENT, BEGIN_SL_COMMENT,
                BEGIN_PLSQL_SPECIAL_QUOTING, BEGIN_QUOTING,
                PLSQL_SPEC, SUBPROG, BEGIN_MODULE, END_MODULE]
        @marks = Regexp.new(spots.join('|'), Regexp::IGNORECASE)
        @level = 0
      end

      def split(text)
        @blocks = []
        @ss = StringScanner.new(text)
        @level = 0
        @crr_block = nil
        while !@ss.eos?
          Parser::consume(@ss, :scan_until, @marks)
          process_ml_comment
          process_sl_comment
          process_double_quotes
          process_plsql_quoting
          process_single_quotes
          process_plsql_spec
          process_subprog
          process_begin
          process_end
        end
        return @blocks
      end

      private

      def process_ml_comment
        scan_until(/\*\/\s*/) if @ss.matched =~ /#{BEGIN_ML_COMMENT}/
      end

      def process_sl_comment
        scan_until(/\n/) if @ss.matched =~ /#{BEGIN_SL_COMMENT}/
      end

      def process_double_quotes
        scan_until(/"/) if @ss.matched == '"'
      end

      def process_plsql_quoting
        if @ss.matched =~ /q'\[/
          scan_until(/\]'/) 
        elsif @ss.matched =~ /q'[{]/
          scan_until(/[}]'/) 
        elsif @ss.matched =~ /q'[(]/
          scan_until(/[)]'/) 
        elsif @ss.matched =~ /q'[<]/
          scan_until(/[>]'/) 
        end
      end

      def process_single_quotes
        if @ss.matched == "'" 
          begin
            scan_until(/\'+/) 
          end while (@ss.matched != "'" && !@ss.eos?)
        end
      end

      def process_plsql_spec
        if @ss.matched =~ /#{PLSQL_SPEC}/i
          meta_data = Parser.plsql_spec("#{@ss.matched}#{@ss.rest}")
          if meta_data[:end_def] > 0
            spec = SubProgram.new(meta_data[:name], 'spec', @ss.pos)
            spec.declare_pos = @ss.pos + meta_data[:end_def]
            scan_until(/#{SLASH_TERMINATOR}/)
            spec.end_pos = @ss.pos
            spec.text = @ss.string[(spec.start_pos..spec.end_pos)]
            @blocks << spec
          end
        end
      end

      def process_subprog
        if @ss.matched =~ /#{SUBPROG}/i
          subprog_name = @ss.peek(32)[/(?:"[^"]+")|(?:[A-Z0-9$_#]+)/i]
          if @ss.matched =~ /function/i
            subprog_type = 'function'
          elsif @ss.matched =~ /procedure/i
            subprog_type = 'procedure'
          end
          start_pos = @ss.pos - @ss.matched.length
          @crr_block = SubProgram.new(subprog_name, subprog_type, start_pos)
        end
      end

      def process_begin
        if @ss.matched =~ /#{BEGIN_MODULE}/i && @crr_block
          @level += 1
          @crr_block.declare_pos = @ss.pos 
          @crr_block.level = @level
        end
      end

      def process_end
        if @ss.matched =~ /#{END_MODULE}/i
          # we have an "end" match. first of all check if it's not part
          # of an conditional compiling "$end" definition
          char_behind = @ss.string[@ss.pos - @ss.matched.length - 1, 1]
          if char_behind != '$'
            finish = Parser.end_subprog("#{@ss.matched}#{@ss.rest}")
            if finish > 0
              if @level == 1
                if @crr_block
                  @crr_block.end_pos = (@ss.pos - 1) + (finish - 1)
                  @crr_block.text = @ss.string[(@crr_block.start_pos..@crr_block.end_pos)]
                  @blocks << @crr_block.clone
                  @crr_block = nil
                end
              end
              @level -= 1
            end
          end
        end
      end

      def scan_until(regexp, skip = false)
        if skip
          @ss.skip_until(regexp)
        else
          segment = @ss.scan_until(regexp)
          if !segment
            @ss.terminate
          end
        end
      end

    end

  end

end


