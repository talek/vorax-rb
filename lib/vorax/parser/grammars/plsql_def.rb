
# line 1 "/home/talek/Dropbox/ruby-vorax/lib/vorax/parser/grammars/plsql_def.rl"

# line 33 "/home/talek/Dropbox/ruby-vorax/lib/vorax/parser/grammars/plsql_def.rl"


module Vorax

  module Parser

    # Check if the provided fragment could be a PLSQL spec or body (package or type).
    #
    # @param data [String] the PLSQL spec fragment (e.g. "PACKAGE muci as")
    # @return [Hash] a hash with the following keys: :name => is the name
    #   of the PLSQL spec module, :end_def => the position where the spec
    #   fragment ends (immediatelly after "AS|IS"), :type => 'SPEC' or 'BODY'.
    def self.plsql_def(data)
      @end_pos = -1
      if data
        eof = data.length
        
# line 23 "/home/talek/Dropbox/ruby-vorax/lib/vorax/parser/grammars/plsql_def.rb"
class << self
	attr_accessor :_plsql_def_actions
	private :_plsql_def_actions, :_plsql_def_actions=
end
self._plsql_def_actions = [
	0, 1, 0, 1, 1, 1, 2, 1, 
	3, 1, 4, 2, 3, 0
]

class << self
	attr_accessor :_plsql_def_key_offsets
	private :_plsql_def_key_offsets, :_plsql_def_key_offsets=
end
self._plsql_def_key_offsets = [
	0, 0, 6, 8, 10, 16, 34, 35, 
	41, 42, 43, 44, 45, 47, 62, 63, 
	64, 65, 66, 68, 85, 94, 111, 128, 
	145, 147, 149, 151, 153, 155, 157, 162, 
	177, 178, 184, 193, 194, 195, 196, 197, 
	199, 201, 206, 207, 208, 209, 210, 212, 
	220, 221, 226, 240, 255, 256, 257, 258, 
	259, 261, 278, 295, 312, 327, 344, 345, 
	351, 360, 361, 362, 363, 364, 366, 368, 
	373, 374, 375, 376, 377, 379, 387, 388, 
	393, 407, 422, 423, 424, 425, 426, 428, 
	445, 460, 461, 462, 463, 464, 466, 468, 
	470, 470, 475, 480
]

class << self
	attr_accessor :_plsql_def_trans_keys
	private :_plsql_def_trans_keys, :_plsql_def_trans_keys=
end
self._plsql_def_trans_keys = [
	69, 80, 84, 101, 112, 116, 78, 110, 
	68, 100, 32, 45, 47, 59, 9, 13, 
	32, 34, 45, 47, 59, 73, 76, 95, 
	105, 108, 9, 13, 35, 36, 65, 90, 
	97, 122, 34, 32, 45, 47, 59, 9, 
	13, 45, 10, 42, 42, 42, 47, 32, 
	45, 47, 59, 95, 9, 13, 35, 36, 
	48, 57, 65, 90, 97, 122, 45, 10, 
	42, 42, 42, 47, 32, 45, 47, 59, 
	70, 95, 102, 9, 13, 35, 36, 48, 
	57, 65, 90, 97, 122, 95, 35, 36, 
	48, 57, 65, 90, 97, 122, 32, 45, 
	47, 59, 79, 95, 111, 9, 13, 35, 
	36, 48, 57, 65, 90, 97, 122, 32, 
	45, 47, 59, 79, 95, 111, 9, 13, 
	35, 36, 48, 57, 65, 90, 97, 122, 
	32, 45, 47, 59, 80, 95, 112, 9, 
	13, 35, 36, 48, 57, 65, 90, 97, 
	122, 65, 97, 67, 99, 75, 107, 65, 
	97, 71, 103, 69, 101, 32, 45, 47, 
	9, 13, 32, 34, 45, 47, 66, 95, 
	98, 9, 13, 35, 36, 65, 90, 97, 
	122, 34, 32, 45, 46, 47, 9, 13, 
	32, 45, 47, 65, 73, 97, 105, 9, 
	13, 45, 10, 42, 42, 42, 47, 83, 
	115, 32, 45, 47, 9, 13, 45, 10, 
	42, 42, 42, 47, 34, 95, 35, 36, 
	65, 90, 97, 122, 34, 32, 45, 47, 
	9, 13, 32, 45, 47, 95, 9, 13, 
	35, 36, 48, 57, 65, 90, 97, 122, 
	32, 45, 46, 47, 95, 9, 13, 35, 
	36, 48, 57, 65, 90, 97, 122, 45, 
	10, 42, 42, 42, 47, 32, 45, 46, 
	47, 79, 95, 111, 9, 13, 35, 36, 
	48, 57, 65, 90, 97, 122, 32, 45, 
	46, 47, 68, 95, 100, 9, 13, 35, 
	36, 48, 57, 65, 90, 97, 122, 32, 
	45, 46, 47, 89, 95, 121, 9, 13, 
	35, 36, 48, 57, 65, 90, 97, 122, 
	32, 45, 46, 47, 95, 9, 13, 35, 
	36, 48, 57, 65, 90, 97, 122, 32, 
	34, 45, 47, 65, 73, 95, 97, 105, 
	9, 13, 35, 36, 66, 90, 98, 122, 
	34, 32, 45, 46, 47, 9, 13, 32, 
	45, 47, 65, 73, 97, 105, 9, 13, 
	45, 10, 42, 42, 42, 47, 83, 115, 
	32, 45, 47, 9, 13, 45, 10, 42, 
	42, 42, 47, 34, 95, 35, 36, 65, 
	90, 97, 122, 34, 32, 45, 47, 9, 
	13, 32, 45, 47, 95, 9, 13, 35, 
	36, 48, 57, 65, 90, 97, 122, 32, 
	45, 46, 47, 95, 9, 13, 35, 36, 
	48, 57, 65, 90, 97, 122, 45, 10, 
	42, 42, 42, 47, 32, 45, 46, 47, 
	83, 95, 115, 9, 13, 35, 36, 48, 
	57, 65, 90, 97, 122, 32, 45, 46, 
	47, 95, 9, 13, 35, 36, 48, 57, 
	65, 90, 97, 122, 45, 10, 42, 42, 
	42, 47, 89, 121, 80, 112, 32, 45, 
	47, 9, 13, 32, 45, 47, 9, 13, 
	32, 45, 47, 65, 73, 97, 105, 9, 
	13, 0
]

class << self
	attr_accessor :_plsql_def_single_lengths
	private :_plsql_def_single_lengths, :_plsql_def_single_lengths=
end
self._plsql_def_single_lengths = [
	0, 6, 2, 2, 4, 10, 1, 4, 
	1, 1, 1, 1, 2, 5, 1, 1, 
	1, 1, 2, 7, 1, 7, 7, 7, 
	2, 2, 2, 2, 2, 2, 3, 7, 
	1, 4, 7, 1, 1, 1, 1, 2, 
	2, 3, 1, 1, 1, 1, 2, 2, 
	1, 3, 4, 5, 1, 1, 1, 1, 
	2, 7, 7, 7, 5, 9, 1, 4, 
	7, 1, 1, 1, 1, 2, 2, 3, 
	1, 1, 1, 1, 2, 2, 1, 3, 
	4, 5, 1, 1, 1, 1, 2, 7, 
	5, 1, 1, 1, 1, 2, 2, 2, 
	0, 3, 3, 7
]

class << self
	attr_accessor :_plsql_def_range_lengths
	private :_plsql_def_range_lengths, :_plsql_def_range_lengths=
end
self._plsql_def_range_lengths = [
	0, 0, 0, 0, 1, 4, 0, 1, 
	0, 0, 0, 0, 0, 5, 0, 0, 
	0, 0, 0, 5, 4, 5, 5, 5, 
	0, 0, 0, 0, 0, 0, 1, 4, 
	0, 1, 1, 0, 0, 0, 0, 0, 
	0, 1, 0, 0, 0, 0, 0, 3, 
	0, 1, 5, 5, 0, 0, 0, 0, 
	0, 5, 5, 5, 5, 4, 0, 1, 
	1, 0, 0, 0, 0, 0, 0, 1, 
	0, 0, 0, 0, 0, 3, 0, 1, 
	5, 5, 0, 0, 0, 0, 0, 5, 
	5, 0, 0, 0, 0, 0, 0, 0, 
	0, 1, 1, 1
]

class << self
	attr_accessor :_plsql_def_index_offsets
	private :_plsql_def_index_offsets, :_plsql_def_index_offsets=
end
self._plsql_def_index_offsets = [
	0, 0, 7, 10, 13, 19, 34, 36, 
	42, 44, 46, 48, 50, 53, 64, 66, 
	68, 70, 72, 75, 88, 94, 107, 120, 
	133, 136, 139, 142, 145, 148, 151, 156, 
	168, 170, 176, 185, 187, 189, 191, 193, 
	196, 199, 204, 206, 208, 210, 212, 215, 
	221, 223, 228, 238, 249, 251, 253, 255, 
	257, 260, 273, 286, 299, 310, 324, 326, 
	332, 341, 343, 345, 347, 349, 352, 355, 
	360, 362, 364, 366, 368, 371, 377, 379, 
	384, 394, 405, 407, 409, 411, 413, 416, 
	429, 440, 442, 444, 446, 448, 451, 454, 
	457, 458, 463, 468
]

class << self
	attr_accessor :_plsql_def_indicies
	private :_plsql_def_indicies, :_plsql_def_indicies=
end
self._plsql_def_indicies = [
	0, 2, 3, 0, 2, 3, 1, 4, 
	4, 1, 5, 5, 1, 6, 7, 8, 
	9, 6, 1, 6, 10, 7, 8, 9, 
	12, 13, 11, 12, 13, 6, 11, 11, 
	11, 1, 14, 10, 14, 15, 16, 9, 
	14, 1, 17, 1, 14, 17, 18, 1, 
	19, 18, 19, 14, 18, 14, 15, 16, 
	9, 11, 14, 11, 11, 11, 11, 1, 
	20, 1, 6, 20, 21, 1, 22, 21, 
	22, 6, 21, 14, 15, 16, 9, 23, 
	11, 23, 14, 11, 11, 11, 11, 1, 
	11, 11, 11, 11, 11, 1, 14, 15, 
	16, 9, 24, 11, 24, 14, 11, 11, 
	11, 11, 1, 14, 15, 16, 9, 25, 
	11, 25, 14, 11, 11, 11, 11, 1, 
	14, 15, 16, 9, 23, 11, 23, 14, 
	11, 11, 11, 11, 1, 26, 26, 1, 
	27, 27, 1, 28, 28, 1, 29, 29, 
	1, 30, 30, 1, 31, 31, 1, 32, 
	33, 34, 32, 1, 32, 35, 33, 34, 
	37, 36, 37, 32, 36, 36, 36, 1, 
	39, 38, 40, 41, 42, 43, 40, 1, 
	44, 45, 46, 47, 47, 47, 47, 44, 
	1, 48, 1, 44, 48, 49, 1, 50, 
	49, 50, 44, 49, 51, 51, 1, 52, 
	53, 54, 52, 1, 55, 1, 52, 55, 
	56, 1, 57, 56, 57, 52, 56, 58, 
	59, 59, 59, 59, 1, 60, 58, 40, 
	41, 43, 40, 1, 40, 41, 43, 59, 
	40, 59, 59, 59, 59, 1, 40, 41, 
	42, 43, 61, 40, 61, 61, 61, 61, 
	1, 62, 1, 32, 62, 63, 1, 64, 
	63, 64, 32, 63, 40, 41, 42, 43, 
	65, 61, 65, 40, 61, 61, 61, 61, 
	1, 40, 41, 42, 43, 66, 61, 66, 
	40, 61, 61, 61, 61, 1, 40, 41, 
	42, 43, 67, 61, 67, 40, 61, 61, 
	61, 61, 1, 68, 69, 42, 70, 61, 
	68, 61, 61, 61, 61, 1, 71, 72, 
	74, 75, 76, 76, 73, 76, 76, 71, 
	73, 73, 73, 1, 78, 77, 79, 80, 
	81, 82, 79, 1, 83, 84, 85, 86, 
	86, 86, 86, 83, 1, 87, 1, 83, 
	87, 88, 1, 89, 88, 89, 83, 88, 
	90, 90, 1, 91, 92, 93, 91, 1, 
	94, 1, 91, 94, 95, 1, 96, 95, 
	96, 91, 95, 97, 98, 98, 98, 98, 
	1, 99, 97, 79, 80, 82, 79, 1, 
	79, 80, 82, 98, 79, 98, 98, 98, 
	98, 1, 79, 80, 81, 82, 100, 79, 
	100, 100, 100, 100, 1, 101, 1, 71, 
	101, 102, 1, 103, 102, 103, 71, 102, 
	79, 80, 81, 82, 104, 100, 104, 79, 
	100, 100, 100, 100, 1, 105, 106, 81, 
	107, 100, 105, 100, 100, 100, 100, 1, 
	108, 1, 109, 108, 110, 1, 111, 110, 
	111, 109, 110, 112, 112, 1, 30, 30, 
	1, 1, 52, 53, 54, 52, 1, 91, 
	92, 93, 91, 1, 109, 113, 114, 86, 
	86, 86, 86, 109, 1, 0
]

class << self
	attr_accessor :_plsql_def_trans_targs
	private :_plsql_def_trans_targs, :_plsql_def_trans_targs=
end
self._plsql_def_trans_targs = [
	2, 0, 24, 94, 3, 4, 5, 14, 
	16, 96, 6, 13, 19, 21, 7, 8, 
	10, 9, 11, 12, 15, 17, 18, 20, 
	22, 23, 25, 26, 27, 28, 29, 30, 
	31, 52, 54, 32, 51, 57, 32, 33, 
	34, 35, 47, 37, 34, 35, 37, 40, 
	36, 38, 39, 41, 97, 42, 44, 43, 
	45, 46, 48, 50, 49, 51, 53, 55, 
	56, 58, 59, 60, 61, 82, 84, 61, 
	62, 81, 82, 84, 87, 62, 63, 64, 
	65, 77, 67, 64, 65, 67, 70, 66, 
	68, 69, 71, 98, 72, 74, 73, 75, 
	76, 78, 80, 79, 81, 83, 85, 86, 
	88, 99, 89, 91, 90, 99, 92, 93, 
	95, 89, 91
]

class << self
	attr_accessor :_plsql_def_trans_actions
	private :_plsql_def_trans_actions, :_plsql_def_trans_actions=
end
self._plsql_def_trans_actions = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 5, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 9, 9, 9, 0, 0, 
	7, 7, 0, 7, 0, 0, 0, 0, 
	0, 0, 0, 0, 1, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 7, 7, 7, 0, 
	9, 9, 0, 0, 9, 0, 0, 7, 
	7, 0, 7, 0, 0, 0, 0, 0, 
	0, 0, 0, 3, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 11, 7, 7, 0, 1, 0, 0, 
	0, 0, 0
]

class << self
	attr_accessor :plsql_def_start
end
self.plsql_def_start = 1;
class << self
	attr_accessor :plsql_def_first_final
end
self.plsql_def_first_final = 96;
class << self
	attr_accessor :plsql_def_error
end
self.plsql_def_error = 0;

class << self
	attr_accessor :plsql_def_en_main
end
self.plsql_def_en_main = 1;


# line 50 "/home/talek/Dropbox/ruby-vorax/lib/vorax/parser/grammars/plsql_def.rl"
        
# line 314 "/home/talek/Dropbox/ruby-vorax/lib/vorax/parser/grammars/plsql_def.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = plsql_def_start
end

# line 51 "/home/talek/Dropbox/ruby-vorax/lib/vorax/parser/grammars/plsql_def.rl"
        
# line 323 "/home/talek/Dropbox/ruby-vorax/lib/vorax/parser/grammars/plsql_def.rb"
begin
	_klen, _trans, _keys, _acts, _nacts = nil
	_goto_level = 0
	_resume = 10
	_eof_trans = 15
	_again = 20
	_test_eof = 30
	_out = 40
	while true
	_trigger_goto = false
	if _goto_level <= 0
	if p == pe
		_goto_level = _test_eof
		next
	end
	if cs == 0
		_goto_level = _out
		next
	end
	end
	if _goto_level <= _resume
	_keys = _plsql_def_key_offsets[cs]
	_trans = _plsql_def_index_offsets[cs]
	_klen = _plsql_def_single_lengths[cs]
	_break_match = false
	
	begin
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + _klen - 1

	     loop do
	        break if _upper < _lower
	        _mid = _lower + ( (_upper - _lower) >> 1 )

	        if data[p].ord < _plsql_def_trans_keys[_mid]
	           _upper = _mid - 1
	        elsif data[p].ord > _plsql_def_trans_keys[_mid]
	           _lower = _mid + 1
	        else
	           _trans += (_mid - _keys)
	           _break_match = true
	           break
	        end
	     end # loop
	     break if _break_match
	     _keys += _klen
	     _trans += _klen
	  end
	  _klen = _plsql_def_range_lengths[cs]
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + (_klen << 1) - 2
	     loop do
	        break if _upper < _lower
	        _mid = _lower + (((_upper-_lower) >> 1) & ~1)
	        if data[p].ord < _plsql_def_trans_keys[_mid]
	          _upper = _mid - 2
	        elsif data[p].ord > _plsql_def_trans_keys[_mid+1]
	          _lower = _mid + 2
	        else
	          _trans += ((_mid - _keys) >> 1)
	          _break_match = true
	          break
	        end
	     end # loop
	     break if _break_match
	     _trans += _klen
	  end
	end while false
	_trans = _plsql_def_indicies[_trans]
	cs = _plsql_def_trans_targs[_trans]
	if _plsql_def_trans_actions[_trans] != 0
		_acts = _plsql_def_trans_actions[_trans]
		_nacts = _plsql_def_actions[_acts]
		_acts += 1
		while _nacts > 0
			_nacts -= 1
			_acts += 1
			case _plsql_def_actions[_acts - 1]
when 0 then
# line 7 "/home/talek/Dropbox/ruby-vorax/lib/vorax/parser/grammars/plsql_def.rl"
		begin

  @end_pos = p - 1;
  @type = 'SPEC';
		end
when 1 then
# line 12 "/home/talek/Dropbox/ruby-vorax/lib/vorax/parser/grammars/plsql_def.rl"
		begin

  @end_pos = p - 1;
  @type = 'BODY';
		end
when 2 then
# line 17 "/home/talek/Dropbox/ruby-vorax/lib/vorax/parser/grammars/plsql_def.rl"
		begin

  @end_pos = p - 1;
  @type = 'END';
		end
when 3 then
# line 22 "/home/talek/Dropbox/ruby-vorax/lib/vorax/parser/grammars/plsql_def.rl"
		begin

  @name = data[(@start..p-1)]
		end
when 4 then
# line 28 "/home/talek/Dropbox/ruby-vorax/lib/vorax/parser/grammars/plsql_def.rl"
		begin
@start = p		end
# line 435 "/home/talek/Dropbox/ruby-vorax/lib/vorax/parser/grammars/plsql_def.rb"
			end # action switch
		end
	end
	if _trigger_goto
		next
	end
	end
	if _goto_level <= _again
	if cs == 0
		_goto_level = _out
		next
	end
	p += 1
	if p != pe
		_goto_level = _resume
		next
	end
	end
	if _goto_level <= _test_eof
	end
	if _goto_level <= _out
		break
	end
	end
	end

# line 52 "/home/talek/Dropbox/ruby-vorax/lib/vorax/parser/grammars/plsql_def.rl"
      end
      return {:name => @name, :end_def => @end_pos, :type => @type}
    end

  end

end

