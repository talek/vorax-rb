
# line 1 "lib/vorax/parser/grammars/for_block.rl"

# line 50 "lib/vorax/parser/grammars/for_block.rl"



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
	103, 104, 106, 116, 117, 123, 133, 134, 
	139, 153, 169, 185, 201, 217, 233, 249, 
	258, 273, 290, 307, 324, 341, 358, 375, 
	385, 400, 401, 402, 403, 404, 406, 414, 
	420, 421, 422, 423, 430, 431, 432, 433, 
	434, 436, 443, 444, 445, 447, 464, 481, 
	498, 515, 532, 549, 564, 571, 572, 573, 
	574, 575, 577, 591, 592, 593, 594, 595, 
	597
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
	42, 47, 34, 82, 95, 114, 35, 36, 
	65, 90, 97, 122, 34, 32, 45, 46, 
	47, 9, 13, 34, 82, 95, 114, 35, 
	36, 65, 90, 97, 122, 34, 32, 45, 
	47, 9, 13, 32, 45, 47, 95, 9, 
	13, 35, 36, 48, 57, 65, 90, 97, 
	122, 32, 45, 47, 69, 95, 101, 9, 
	13, 35, 36, 48, 57, 65, 90, 97, 
	122, 32, 45, 47, 86, 95, 118, 9, 
	13, 35, 36, 48, 57, 65, 90, 97, 
	122, 32, 45, 47, 69, 95, 101, 9, 
	13, 35, 36, 48, 57, 65, 90, 97, 
	122, 32, 45, 47, 82, 95, 114, 9, 
	13, 35, 36, 48, 57, 65, 90, 97, 
	122, 32, 45, 47, 83, 95, 115, 9, 
	13, 35, 36, 48, 57, 65, 90, 97, 
	122, 32, 45, 47, 69, 95, 101, 9, 
	13, 35, 36, 48, 57, 65, 90, 97, 
	122, 95, 35, 36, 48, 57, 65, 90, 
	97, 122, 32, 45, 46, 47, 95, 9, 
	13, 35, 36, 48, 57, 65, 90, 97, 
	122, 32, 45, 46, 47, 69, 95, 101, 
	9, 13, 35, 36, 48, 57, 65, 90, 
	97, 122, 32, 45, 46, 47, 86, 95, 
	118, 9, 13, 35, 36, 48, 57, 65, 
	90, 97, 122, 32, 45, 46, 47, 69, 
	95, 101, 9, 13, 35, 36, 48, 57, 
	65, 90, 97, 122, 32, 45, 46, 47, 
	82, 95, 114, 9, 13, 35, 36, 48, 
	57, 65, 90, 97, 122, 32, 45, 46, 
	47, 83, 95, 115, 9, 13, 35, 36, 
	48, 57, 65, 90, 97, 122, 32, 45, 
	46, 47, 69, 95, 101, 9, 13, 35, 
	36, 48, 57, 65, 90, 97, 122, 46, 
	95, 35, 36, 48, 57, 65, 90, 97, 
	122, 32, 45, 46, 47, 95, 9, 13, 
	35, 36, 48, 57, 65, 90, 97, 122, 
	45, 10, 42, 42, 42, 47, 32, 45, 
	46, 47, 9, 13, 48, 57, 32, 45, 
	46, 47, 9, 13, 45, 10, 46, 32, 
	45, 47, 9, 13, 48, 57, 45, 10, 
	42, 42, 42, 47, 32, 45, 47, 9, 
	13, 48, 57, 42, 42, 42, 47, 32, 
	45, 46, 47, 69, 95, 101, 9, 13, 
	35, 36, 48, 57, 65, 90, 97, 122, 
	32, 45, 46, 47, 86, 95, 118, 9, 
	13, 35, 36, 48, 57, 65, 90, 97, 
	122, 32, 45, 46, 47, 69, 95, 101, 
	9, 13, 35, 36, 48, 57, 65, 90, 
	97, 122, 32, 45, 46, 47, 82, 95, 
	114, 9, 13, 35, 36, 48, 57, 65, 
	90, 97, 122, 32, 45, 46, 47, 83, 
	95, 115, 9, 13, 35, 36, 48, 57, 
	65, 90, 97, 122, 32, 45, 46, 47, 
	69, 95, 101, 9, 13, 35, 36, 48, 
	57, 65, 90, 97, 122, 32, 45, 46, 
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
	8, 1, 4, 5, 1, 1, 1, 1, 
	2, 2, 2, 2, 3, 1, 1, 1, 
	1, 2, 4, 1, 4, 4, 1, 3, 
	4, 6, 6, 6, 6, 6, 6, 1, 
	5, 7, 7, 7, 7, 7, 7, 2, 
	5, 1, 1, 1, 1, 2, 4, 4, 
	1, 1, 1, 3, 1, 1, 1, 1, 
	2, 3, 1, 1, 2, 7, 7, 7, 
	7, 7, 7, 5, 3, 1, 1, 1, 
	1, 2, 4, 1, 1, 1, 1, 2, 
	3
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
	5, 5, 5, 5, 5, 5, 5, 4, 
	5, 5, 5, 5, 5, 5, 5, 4, 
	5, 0, 0, 0, 0, 0, 2, 1, 
	0, 0, 0, 2, 0, 0, 0, 0, 
	0, 2, 0, 0, 0, 5, 5, 5, 
	5, 5, 5, 5, 2, 0, 0, 0, 
	0, 0, 5, 0, 0, 0, 0, 0, 
	1
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
	118, 120, 123, 131, 133, 139, 147, 149, 
	154, 164, 176, 188, 200, 212, 224, 236, 
	242, 253, 266, 279, 292, 305, 318, 331, 
	338, 349, 351, 353, 355, 357, 360, 367, 
	373, 375, 377, 379, 385, 387, 389, 391, 
	393, 396, 402, 404, 406, 409, 422, 435, 
	448, 461, 474, 487, 498, 504, 506, 508, 
	510, 512, 515, 525, 527, 529, 531, 533, 
	536
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
	51, 46, 50, 52, 54, 53, 54, 53, 
	53, 53, 1, 55, 52, 32, 33, 56, 
	35, 32, 1, 57, 59, 58, 59, 58, 
	58, 58, 1, 60, 57, 32, 33, 35, 
	32, 1, 32, 33, 35, 58, 32, 58, 
	58, 58, 58, 1, 32, 33, 35, 61, 
	58, 61, 32, 58, 58, 58, 58, 1, 
	32, 33, 35, 62, 58, 62, 32, 58, 
	58, 58, 58, 1, 32, 33, 35, 63, 
	58, 63, 32, 58, 58, 58, 58, 1, 
	32, 33, 35, 64, 58, 64, 32, 58, 
	58, 58, 58, 1, 32, 33, 35, 65, 
	58, 65, 32, 58, 58, 58, 58, 1, 
	32, 33, 35, 66, 58, 66, 32, 58, 
	58, 58, 58, 1, 58, 58, 58, 58, 
	58, 1, 32, 33, 56, 35, 53, 32, 
	53, 53, 53, 53, 1, 32, 33, 56, 
	35, 67, 53, 67, 32, 53, 53, 53, 
	53, 1, 32, 33, 56, 35, 68, 53, 
	68, 32, 53, 53, 53, 53, 1, 32, 
	33, 56, 35, 69, 53, 69, 32, 53, 
	53, 53, 53, 1, 32, 33, 56, 35, 
	70, 53, 70, 32, 53, 53, 53, 53, 
	1, 32, 33, 56, 35, 71, 53, 71, 
	32, 53, 53, 53, 53, 1, 32, 33, 
	56, 35, 72, 53, 72, 32, 53, 53, 
	53, 53, 1, 56, 53, 53, 53, 53, 
	53, 1, 32, 33, 34, 35, 73, 32, 
	73, 73, 73, 73, 1, 74, 1, 22, 
	74, 75, 1, 76, 75, 76, 22, 75, 
	77, 78, 79, 80, 77, 28, 1, 77, 
	78, 79, 80, 77, 1, 81, 1, 77, 
	81, 82, 1, 82, 83, 84, 82, 85, 
	1, 86, 1, 82, 86, 87, 1, 88, 
	87, 88, 82, 87, 36, 37, 38, 36, 
	85, 1, 89, 1, 90, 89, 90, 77, 
	89, 32, 33, 34, 35, 91, 73, 91, 
	32, 73, 73, 73, 73, 1, 32, 33, 
	34, 35, 92, 73, 92, 32, 73, 73, 
	73, 73, 1, 32, 33, 34, 35, 93, 
	73, 93, 32, 73, 73, 73, 73, 1, 
	32, 33, 34, 35, 94, 73, 94, 32, 
	73, 73, 73, 73, 1, 32, 33, 34, 
	35, 95, 73, 95, 32, 73, 73, 73, 
	73, 1, 32, 33, 34, 35, 96, 73, 
	96, 32, 73, 73, 73, 73, 1, 97, 
	98, 34, 99, 73, 97, 73, 73, 73, 
	73, 1, 97, 98, 99, 97, 28, 1, 
	100, 1, 97, 100, 101, 1, 102, 101, 
	102, 97, 101, 11, 12, 13, 103, 11, 
	103, 103, 103, 103, 1, 104, 1, 4, 
	104, 105, 1, 106, 105, 106, 4, 105, 
	46, 47, 48, 46, 1, 0
]

class << self
	attr_accessor :_for_block_trans_targs
	private :_for_block_trans_targs, :_for_block_trans_targs=
end
self._for_block_trans_targs = [
	2, 0, 3, 4, 5, 91, 93, 6, 
	90, 6, 7, 8, 9, 11, 8, 9, 
	11, 14, 10, 12, 13, 15, 16, 19, 
	57, 59, 17, 56, 62, 77, 17, 18, 
	19, 20, 34, 22, 19, 20, 22, 25, 
	21, 23, 24, 26, 27, 28, 96, 29, 
	31, 30, 32, 33, 35, 48, 49, 36, 
	37, 38, 40, 41, 39, 42, 43, 44, 
	45, 46, 47, 50, 51, 52, 53, 54, 
	55, 56, 58, 60, 61, 63, 64, 66, 
	74, 65, 67, 68, 70, 73, 69, 71, 
	72, 75, 76, 78, 79, 80, 81, 82, 
	83, 84, 85, 87, 86, 88, 89, 90, 
	92, 94, 95
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
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0
]

class << self
	attr_accessor :for_block_start
end
self.for_block_start = 1;
class << self
	attr_accessor :for_block_first_final
end
self.for_block_first_final = 96;
class << self
	attr_accessor :for_block_error
end
self.for_block_error = 0;

class << self
	attr_accessor :for_block_en_for_stmt
end
self.for_block_en_for_stmt = 1;


# line 65 "lib/vorax/parser/grammars/for_block.rl"
        
# line 332 "lib/vorax/parser/grammars/for_block.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = for_block_start
end

# line 66 "lib/vorax/parser/grammars/for_block.rl"
        
# line 341 "lib/vorax/parser/grammars/for_block.rb"
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
# line 465 "lib/vorax/parser/grammars/for_block.rb"
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

# line 67 "lib/vorax/parser/grammars/for_block.rl"
      end
      return {:cursor_var => @cursor_var,
						  :for_var => @for_var,
						  :expr => @expr,
						  :end_pos => @end_pos}
    end

  end

end
