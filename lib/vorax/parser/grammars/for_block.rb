
# line 1 "lib/vorax/parser/grammars/for_block.rl"

# line 41 "lib/vorax/parser/grammars/for_block.rl"



module Vorax

  module Parser

    def self.describe_for(data)
      @cursor_var = nil
      @for_var = nil
      @expr = nil
      @end_pos = -1
      if data
        eof = data.length
        
# line 21 "lib/vorax/parser/grammars/for_block.rb"
class << self
	attr_accessor :_for_block_actions
	private :_for_block_actions, :_for_block_actions=
end
self._for_block_actions = [
	0, 1, 0, 1, 1, 1, 4, 2, 
	5, 2, 2, 5, 3
]

class << self
	attr_accessor :_for_block_key_offsets
	private :_for_block_key_offsets, :_for_block_key_offsets=
end
self._for_block_key_offsets = [
	0, 0, 2, 4, 6, 11, 24, 25, 
	30, 37, 38, 39, 40, 41, 43, 45, 
	51, 69, 70, 75, 82, 83, 84, 85, 
	86, 88, 90, 92, 94, 99, 100, 101, 
	102, 103, 105, 119, 120, 121, 122, 123, 
	125, 133, 139, 140, 141, 142, 149, 150, 
	151, 152, 153, 155, 162, 163, 164, 166, 
	182, 198, 214, 230, 246, 262, 276, 283, 
	284, 285, 286, 287, 289, 303, 304, 305, 
	306, 307, 309
]

class << self
	attr_accessor :_for_block_trans_keys
	private :_for_block_trans_keys, :_for_block_trans_keys=
end
self._for_block_trans_keys = [
	70, 102, 79, 111, 82, 114, 32, 45, 
	47, 9, 13, 32, 34, 45, 47, 95, 
	9, 13, 35, 36, 65, 90, 97, 122, 
	34, 32, 45, 47, 9, 13, 32, 45, 
	47, 73, 105, 9, 13, 45, 10, 42, 
	42, 42, 47, 78, 110, 32, 40, 45, 
	47, 9, 13, 32, 34, 40, 45, 47, 
	82, 95, 114, 9, 13, 35, 36, 48, 
	57, 65, 90, 97, 122, 34, 32, 45, 
	47, 9, 13, 32, 45, 47, 76, 108, 
	9, 13, 45, 10, 42, 42, 42, 47, 
	79, 111, 79, 111, 80, 112, 32, 45, 
	47, 9, 13, 45, 10, 42, 42, 42, 
	47, 32, 45, 47, 95, 9, 13, 35, 
	36, 48, 57, 65, 90, 97, 122, 45, 
	10, 42, 42, 42, 47, 32, 45, 46, 
	47, 9, 13, 48, 57, 32, 45, 46, 
	47, 9, 13, 45, 10, 46, 32, 45, 
	47, 9, 13, 48, 57, 45, 10, 42, 
	42, 42, 47, 32, 45, 47, 9, 13, 
	48, 57, 42, 42, 42, 47, 32, 45, 
	47, 69, 95, 101, 9, 13, 35, 36, 
	48, 57, 65, 90, 97, 122, 32, 45, 
	47, 86, 95, 118, 9, 13, 35, 36, 
	48, 57, 65, 90, 97, 122, 32, 45, 
	47, 69, 95, 101, 9, 13, 35, 36, 
	48, 57, 65, 90, 97, 122, 32, 45, 
	47, 82, 95, 114, 9, 13, 35, 36, 
	48, 57, 65, 90, 97, 122, 32, 45, 
	47, 83, 95, 115, 9, 13, 35, 36, 
	48, 57, 65, 90, 97, 122, 32, 45, 
	47, 69, 95, 101, 9, 13, 35, 36, 
	48, 57, 65, 90, 97, 122, 32, 45, 
	47, 95, 9, 13, 35, 36, 48, 57, 
	65, 90, 97, 122, 32, 45, 47, 9, 
	13, 48, 57, 45, 10, 42, 42, 42, 
	47, 32, 45, 47, 95, 9, 13, 35, 
	36, 48, 57, 65, 90, 97, 122, 45, 
	10, 42, 42, 42, 47, 32, 45, 47, 
	9, 13, 0
]

class << self
	attr_accessor :_for_block_single_lengths
	private :_for_block_single_lengths, :_for_block_single_lengths=
end
self._for_block_single_lengths = [
	0, 2, 2, 2, 3, 5, 1, 3, 
	5, 1, 1, 1, 1, 2, 2, 4, 
	8, 1, 3, 5, 1, 1, 1, 1, 
	2, 2, 2, 2, 3, 1, 1, 1, 
	1, 2, 4, 1, 1, 1, 1, 2, 
	4, 4, 1, 1, 1, 3, 1, 1, 
	1, 1, 2, 3, 1, 1, 2, 6, 
	6, 6, 6, 6, 6, 4, 3, 1, 
	1, 1, 1, 2, 4, 1, 1, 1, 
	1, 2, 3
]

class << self
	attr_accessor :_for_block_range_lengths
	private :_for_block_range_lengths, :_for_block_range_lengths=
end
self._for_block_range_lengths = [
	0, 0, 0, 0, 1, 4, 0, 1, 
	1, 0, 0, 0, 0, 0, 0, 1, 
	5, 0, 1, 1, 0, 0, 0, 0, 
	0, 0, 0, 0, 1, 0, 0, 0, 
	0, 0, 5, 0, 0, 0, 0, 0, 
	2, 1, 0, 0, 0, 2, 0, 0, 
	0, 0, 0, 2, 0, 0, 0, 5, 
	5, 5, 5, 5, 5, 5, 2, 0, 
	0, 0, 0, 0, 5, 0, 0, 0, 
	0, 0, 1
]

class << self
	attr_accessor :_for_block_index_offsets
	private :_for_block_index_offsets, :_for_block_index_offsets=
end
self._for_block_index_offsets = [
	0, 0, 3, 6, 9, 14, 24, 26, 
	31, 38, 40, 42, 44, 46, 49, 52, 
	58, 72, 74, 79, 86, 88, 90, 92, 
	94, 97, 100, 103, 106, 111, 113, 115, 
	117, 119, 122, 132, 134, 136, 138, 140, 
	143, 150, 156, 158, 160, 162, 168, 170, 
	172, 174, 176, 179, 185, 187, 189, 192, 
	204, 216, 228, 240, 252, 264, 274, 280, 
	282, 284, 286, 288, 291, 301, 303, 305, 
	307, 309, 312
]

class << self
	attr_accessor :_for_block_indicies
	private :_for_block_indicies, :_for_block_indicies=
end
self._for_block_indicies = [
	0, 0, 1, 2, 2, 1, 3, 3, 
	1, 4, 5, 6, 4, 1, 4, 7, 
	5, 6, 8, 4, 8, 8, 8, 1, 
	10, 9, 11, 12, 13, 11, 1, 14, 
	15, 16, 17, 17, 14, 1, 18, 1, 
	14, 18, 19, 1, 20, 19, 20, 14, 
	19, 21, 21, 1, 22, 23, 24, 25, 
	22, 1, 22, 26, 23, 24, 25, 29, 
	27, 29, 22, 27, 28, 27, 27, 1, 
	31, 30, 32, 33, 34, 32, 1, 35, 
	36, 37, 38, 38, 35, 1, 39, 1, 
	35, 39, 40, 1, 41, 40, 41, 35, 
	40, 42, 42, 1, 43, 43, 1, 44, 
	44, 1, 45, 46, 47, 45, 1, 48, 
	1, 45, 48, 49, 1, 50, 49, 50, 
	45, 49, 32, 33, 34, 51, 32, 51, 
	51, 51, 51, 1, 52, 1, 22, 52, 
	53, 1, 54, 53, 54, 22, 53, 55, 
	56, 57, 58, 55, 28, 1, 55, 56, 
	57, 58, 55, 1, 59, 1, 55, 59, 
	60, 1, 60, 61, 62, 60, 63, 1, 
	64, 1, 60, 64, 65, 1, 66, 65, 
	66, 60, 65, 35, 36, 37, 35, 63, 
	1, 67, 1, 68, 67, 68, 55, 67, 
	32, 33, 34, 69, 51, 69, 32, 51, 
	51, 51, 51, 1, 32, 33, 34, 70, 
	51, 70, 32, 51, 51, 51, 51, 1, 
	32, 33, 34, 71, 51, 71, 32, 51, 
	51, 51, 51, 1, 32, 33, 34, 72, 
	51, 72, 32, 51, 51, 51, 51, 1, 
	32, 33, 34, 73, 51, 73, 32, 51, 
	51, 51, 51, 1, 32, 33, 34, 74, 
	51, 74, 32, 51, 51, 51, 51, 1, 
	75, 76, 77, 51, 75, 51, 51, 51, 
	51, 1, 75, 76, 77, 75, 28, 1, 
	78, 1, 75, 78, 79, 1, 80, 79, 
	80, 75, 79, 11, 12, 13, 81, 11, 
	81, 81, 81, 81, 1, 82, 1, 4, 
	82, 83, 1, 84, 83, 84, 4, 83, 
	45, 46, 47, 45, 1, 0
]

class << self
	attr_accessor :_for_block_trans_targs
	private :_for_block_trans_targs, :_for_block_trans_targs=
end
self._for_block_trans_targs = [
	2, 0, 3, 4, 5, 69, 71, 6, 
	68, 6, 7, 8, 9, 11, 8, 9, 
	11, 14, 10, 12, 13, 15, 16, 19, 
	35, 37, 17, 34, 40, 55, 17, 18, 
	19, 20, 22, 19, 20, 22, 25, 21, 
	23, 24, 26, 27, 28, 74, 29, 31, 
	30, 32, 33, 34, 36, 38, 39, 41, 
	42, 44, 52, 43, 45, 46, 48, 51, 
	47, 49, 50, 53, 54, 56, 57, 58, 
	59, 60, 61, 62, 63, 65, 64, 66, 
	67, 68, 70, 72, 73
]

class << self
	attr_accessor :_for_block_trans_actions
	private :_for_block_trans_actions, :_for_block_trans_actions=
end
self._for_block_trans_actions = [
	0, 0, 0, 0, 0, 0, 0, 5, 
	5, 0, 0, 7, 7, 7, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 1, 
	0, 0, 5, 5, 0, 5, 0, 0, 
	10, 10, 10, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 3, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0
]

class << self
	attr_accessor :for_block_start
end
self.for_block_start = 1;
class << self
	attr_accessor :for_block_first_final
end
self.for_block_first_final = 74;
class << self
	attr_accessor :for_block_error
end
self.for_block_error = 0;

class << self
	attr_accessor :for_block_en_for_stmt
end
self.for_block_en_for_stmt = 1;


# line 56 "lib/vorax/parser/grammars/for_block.rl"
        
# line 250 "lib/vorax/parser/grammars/for_block.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = for_block_start
end

# line 57 "lib/vorax/parser/grammars/for_block.rl"
        
# line 259 "lib/vorax/parser/grammars/for_block.rb"
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
	_keys = _for_block_key_offsets[cs]
	_trans = _for_block_index_offsets[cs]
	_klen = _for_block_single_lengths[cs]
	_break_match = false
	
	begin
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + _klen - 1

	     loop do
	        break if _upper < _lower
	        _mid = _lower + ( (_upper - _lower) >> 1 )

	        if data[p].ord < _for_block_trans_keys[_mid]
	           _upper = _mid - 1
	        elsif data[p].ord > _for_block_trans_keys[_mid]
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
	  _klen = _for_block_range_lengths[cs]
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + (_klen << 1) - 2
	     loop do
	        break if _upper < _lower
	        _mid = _lower + (((_upper-_lower) >> 1) & ~1)
	        if data[p].ord < _for_block_trans_keys[_mid]
	          _upper = _mid - 2
	        elsif data[p].ord > _for_block_trans_keys[_mid+1]
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
	_trans = _for_block_indicies[_trans]
	cs = _for_block_trans_targs[_trans]
	if _for_block_trans_actions[_trans] != 0
		_acts = _for_block_trans_actions[_trans]
		_nacts = _for_block_actions[_acts]
		_acts += 1
		while _nacts > 0
			_nacts -= 1
			_acts += 1
			case _for_block_actions[_acts - 1]
when 0 then
# line 7 "lib/vorax/parser/grammars/for_block.rl"
		begin

  @expr = Parser.walk_balanced_paren(data[(p..-1)])
  p += @expr.length - 1
		end
when 1 then
# line 12 "lib/vorax/parser/grammars/for_block.rl"
		begin

	@end_pos = p
		end
when 2 then
# line 16 "lib/vorax/parser/grammars/for_block.rl"
		begin

	@for_var = data[(@start..@end)]
		end
when 3 then
# line 20 "lib/vorax/parser/grammars/for_block.rl"
		begin

	@cursor_var = data[(@start..@end)]
		end
when 4 then
# line 24 "lib/vorax/parser/grammars/for_block.rl"
		begin

  @start = p
		end
when 5 then
# line 28 "lib/vorax/parser/grammars/for_block.rl"
		begin

  @end = p - 1
		end
# line 377 "lib/vorax/parser/grammars/for_block.rb"
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

# line 58 "lib/vorax/parser/grammars/for_block.rl"
      end
      return {:cursor_var => @cursor_var,
						  :for_var => @for_var,
						  :expr => @expr,
						  :end_pos => @end_pos}
    end

  end

end
