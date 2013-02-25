
# line 1 "lib/vorax/parser/grammars/for_block.rl"

# line 47 "lib/vorax/parser/grammars/for_block.rl"



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
	0, 1, 0, 1, 1, 1, 3, 1, 
	4, 1, 5, 2, 6, 2
]

class << self
	attr_accessor :_for_block_key_offsets
	private :_for_block_key_offsets, :_for_block_key_offsets=
end
self._for_block_key_offsets = [
	0, 0, 2, 4, 6, 11, 24, 25, 
	30, 37, 38, 39, 40, 41, 43, 45, 
	51, 69, 70, 76, 83, 84, 85, 86, 
	87, 89, 91, 93, 95, 100, 101, 102, 
	103, 104, 106, 114, 115, 121, 129, 130, 
	135, 149, 164, 179, 180, 181, 182, 183, 
	185, 193, 199, 200, 201, 202, 209, 210, 
	211, 212, 213, 215, 222, 223, 224, 226, 
	243, 260, 277, 294, 311, 328, 343, 350, 
	351, 352, 353, 354, 356, 370, 371, 372, 
	373, 374, 376
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
	46, 47, 9, 13, 32, 45, 47, 76, 
	108, 9, 13, 45, 10, 42, 42, 42, 
	47, 79, 111, 79, 111, 80, 112, 32, 
	45, 47, 9, 13, 45, 10, 42, 42, 
	42, 47, 34, 95, 35, 36, 65, 90, 
	97, 122, 34, 32, 45, 46, 47, 9, 
	13, 34, 95, 35, 36, 65, 90, 97, 
	122, 34, 32, 45, 47, 9, 13, 32, 
	45, 47, 95, 9, 13, 35, 36, 48, 
	57, 65, 90, 97, 122, 32, 45, 46, 
	47, 95, 9, 13, 35, 36, 48, 57, 
	65, 90, 97, 122, 32, 45, 46, 47, 
	95, 9, 13, 35, 36, 48, 57, 65, 
	90, 97, 122, 45, 10, 42, 42, 42, 
	47, 32, 45, 46, 47, 9, 13, 48, 
	57, 32, 45, 46, 47, 9, 13, 45, 
	10, 46, 32, 45, 47, 9, 13, 48, 
	57, 45, 10, 42, 42, 42, 47, 32, 
	45, 47, 9, 13, 48, 57, 42, 42, 
	42, 47, 32, 45, 46, 47, 69, 95, 
	101, 9, 13, 35, 36, 48, 57, 65, 
	90, 97, 122, 32, 45, 46, 47, 86, 
	95, 118, 9, 13, 35, 36, 48, 57, 
	65, 90, 97, 122, 32, 45, 46, 47, 
	69, 95, 101, 9, 13, 35, 36, 48, 
	57, 65, 90, 97, 122, 32, 45, 46, 
	47, 82, 95, 114, 9, 13, 35, 36, 
	48, 57, 65, 90, 97, 122, 32, 45, 
	46, 47, 83, 95, 115, 9, 13, 35, 
	36, 48, 57, 65, 90, 97, 122, 32, 
	45, 46, 47, 69, 95, 101, 9, 13, 
	35, 36, 48, 57, 65, 90, 97, 122, 
	32, 45, 46, 47, 95, 9, 13, 35, 
	36, 48, 57, 65, 90, 97, 122, 32, 
	45, 47, 9, 13, 48, 57, 45, 10, 
	42, 42, 42, 47, 32, 45, 47, 95, 
	9, 13, 35, 36, 48, 57, 65, 90, 
	97, 122, 45, 10, 42, 42, 42, 47, 
	32, 45, 47, 9, 13, 0
]

class << self
	attr_accessor :_for_block_single_lengths
	private :_for_block_single_lengths, :_for_block_single_lengths=
end
self._for_block_single_lengths = [
	0, 2, 2, 2, 3, 5, 1, 3, 
	5, 1, 1, 1, 1, 2, 2, 4, 
	8, 1, 4, 5, 1, 1, 1, 1, 
	2, 2, 2, 2, 3, 1, 1, 1, 
	1, 2, 2, 1, 4, 2, 1, 3, 
	4, 5, 5, 1, 1, 1, 1, 2, 
	4, 4, 1, 1, 1, 3, 1, 1, 
	1, 1, 2, 3, 1, 1, 2, 7, 
	7, 7, 7, 7, 7, 5, 3, 1, 
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
	0, 0, 3, 0, 1, 3, 0, 1, 
	5, 5, 5, 0, 0, 0, 0, 0, 
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
	58, 72, 74, 80, 87, 89, 91, 93, 
	95, 98, 101, 104, 107, 112, 114, 116, 
	118, 120, 123, 129, 131, 137, 143, 145, 
	150, 160, 171, 182, 184, 186, 188, 190, 
	193, 200, 206, 208, 210, 212, 218, 220, 
	222, 224, 226, 229, 235, 237, 239, 242, 
	255, 268, 281, 294, 307, 320, 331, 337, 
	339, 341, 343, 345, 348, 358, 360, 362, 
	364, 366, 369
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
	31, 30, 32, 33, 34, 35, 32, 1, 
	36, 37, 38, 39, 39, 36, 1, 40, 
	1, 36, 40, 41, 1, 42, 41, 42, 
	36, 41, 43, 43, 1, 44, 44, 1, 
	45, 45, 1, 46, 47, 48, 46, 1, 
	49, 1, 46, 49, 50, 1, 51, 50, 
	51, 46, 50, 52, 53, 53, 53, 53, 
	1, 54, 52, 32, 33, 55, 35, 32, 
	1, 56, 57, 57, 57, 57, 1, 58, 
	56, 32, 33, 35, 32, 1, 32, 33, 
	35, 57, 32, 57, 57, 57, 57, 1, 
	32, 33, 55, 35, 53, 32, 53, 53, 
	53, 53, 1, 32, 33, 34, 35, 59, 
	32, 59, 59, 59, 59, 1, 60, 1, 
	22, 60, 61, 1, 62, 61, 62, 22, 
	61, 63, 64, 65, 66, 63, 28, 1, 
	63, 64, 65, 66, 63, 1, 67, 1, 
	63, 67, 68, 1, 68, 69, 70, 68, 
	71, 1, 72, 1, 68, 72, 73, 1, 
	74, 73, 74, 68, 73, 36, 37, 38, 
	36, 71, 1, 75, 1, 76, 75, 76, 
	63, 75, 32, 33, 34, 35, 77, 59, 
	77, 32, 59, 59, 59, 59, 1, 32, 
	33, 34, 35, 78, 59, 78, 32, 59, 
	59, 59, 59, 1, 32, 33, 34, 35, 
	79, 59, 79, 32, 59, 59, 59, 59, 
	1, 32, 33, 34, 35, 80, 59, 80, 
	32, 59, 59, 59, 59, 1, 32, 33, 
	34, 35, 81, 59, 81, 32, 59, 59, 
	59, 59, 1, 32, 33, 34, 35, 82, 
	59, 82, 32, 59, 59, 59, 59, 1, 
	83, 84, 34, 85, 59, 83, 59, 59, 
	59, 59, 1, 83, 84, 85, 83, 28, 
	1, 86, 1, 83, 86, 87, 1, 88, 
	87, 88, 83, 87, 11, 12, 13, 89, 
	11, 89, 89, 89, 89, 1, 90, 1, 
	4, 90, 91, 1, 92, 91, 92, 4, 
	91, 46, 47, 48, 46, 1, 0
]

class << self
	attr_accessor :_for_block_trans_targs
	private :_for_block_trans_targs, :_for_block_trans_targs=
end
self._for_block_trans_targs = [
	2, 0, 3, 4, 5, 77, 79, 6, 
	76, 6, 7, 8, 9, 11, 8, 9, 
	11, 14, 10, 12, 13, 15, 16, 19, 
	43, 45, 17, 42, 48, 63, 17, 18, 
	19, 20, 34, 22, 19, 20, 22, 25, 
	21, 23, 24, 26, 27, 28, 82, 29, 
	31, 30, 32, 33, 35, 41, 36, 37, 
	38, 40, 39, 42, 44, 46, 47, 49, 
	50, 52, 60, 51, 53, 54, 56, 59, 
	55, 57, 58, 61, 62, 64, 65, 66, 
	67, 68, 69, 70, 71, 73, 72, 74, 
	75, 76, 78, 80, 81
]

class << self
	attr_accessor :_for_block_trans_actions
	private :_for_block_trans_actions, :_for_block_trans_actions=
end
self._for_block_trans_actions = [
	0, 0, 0, 0, 0, 0, 0, 9, 
	9, 0, 0, 11, 11, 11, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 1, 
	0, 0, 5, 5, 0, 5, 0, 0, 
	7, 7, 0, 7, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 3, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
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
self.for_block_first_final = 82;
class << self
	attr_accessor :for_block_error
end
self.for_block_error = 0;

class << self
	attr_accessor :for_block_en_for_stmt
end
self.for_block_en_for_stmt = 1;


# line 62 "lib/vorax/parser/grammars/for_block.rl"
        
# line 271 "lib/vorax/parser/grammars/for_block.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = for_block_start
end

# line 63 "lib/vorax/parser/grammars/for_block.rl"
        
# line 280 "lib/vorax/parser/grammars/for_block.rb"
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

	@cursor_var_start = p
		end
when 4 then
# line 24 "lib/vorax/parser/grammars/for_block.rl"
		begin

	@cursor_var = data[(@cursor_var_start..p-1)]
		end
when 5 then
# line 28 "lib/vorax/parser/grammars/for_block.rl"
		begin

  @start = p
		end
when 6 then
# line 32 "lib/vorax/parser/grammars/for_block.rl"
		begin

  @end = p - 1
		end
# line 404 "lib/vorax/parser/grammars/for_block.rb"
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

# line 64 "lib/vorax/parser/grammars/for_block.rl"
      end
      return {:cursor_var => @cursor_var,
						  :for_var => @for_var,
						  :expr => @expr,
						  :end_pos => @end_pos}
    end

  end

end
