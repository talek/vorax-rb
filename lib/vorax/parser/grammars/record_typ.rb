
# line 1 "/home/talek/gitrepos/vorax-rb/lib/vorax/parser/grammars/record_typ.rl"

# line 28 "/home/talek/gitrepos/vorax-rb/lib/vorax/parser/grammars/record_typ.rl"


module Vorax

	module Parser

		def Parser.describe_record(data)
		  @attributes = []
		  if data
			  eof = data.length
        
# line 17 "/home/talek/gitrepos/vorax-rb/lib/vorax/parser/grammars/record_typ.rb"
class << self
	attr_accessor :_record_typ_actions
	private :_record_typ_actions, :_record_typ_actions=
end
self._record_typ_actions = [
	0, 1, 1, 1, 2, 1, 3, 1, 
	5, 1, 6, 1, 7, 1, 12, 1, 
	14, 1, 15, 1, 17, 1, 18, 1, 
	19, 2, 0, 13, 2, 2, 3, 2, 
	4, 16, 2, 7, 8, 2, 7, 9, 
	2, 7, 10, 2, 7, 11, 4, 7, 
	2, 3, 10
]

class << self
	attr_accessor :_record_typ_key_offsets
	private :_record_typ_key_offsets, :_record_typ_key_offsets=
end
self._record_typ_key_offsets = [
	0, 7, 8, 9, 10, 11, 13, 15, 
	20, 26, 28, 30, 32, 34, 36, 44, 
	50, 63, 64, 77, 90, 91, 92, 93, 
	94, 95, 97, 112, 113, 114, 115, 116, 
	118, 119, 120, 121, 122, 124, 125, 126, 
	127, 128, 130, 131, 132, 145, 146, 147, 
	148, 149, 151, 152, 153, 155, 164, 171, 
	171, 180, 195, 196, 197, 198, 211, 212
]

class << self
	attr_accessor :_record_typ_trans_keys
	private :_record_typ_trans_keys, :_record_typ_trans_keys=
end
self._record_typ_trans_keys = [
	32, 45, 47, 73, 105, 9, 13, 45, 
	10, 42, 42, 42, 47, 83, 115, 32, 
	45, 47, 9, 13, 32, 37, 45, 47, 
	9, 13, 82, 114, 69, 101, 67, 99, 
	79, 111, 82, 114, 32, 40, 45, 47, 
	68, 100, 9, 13, 32, 40, 45, 47, 
	9, 13, 32, 34, 45, 47, 95, 9, 
	13, 35, 36, 65, 90, 97, 122, 34, 
	32, 34, 45, 47, 95, 9, 13, 35, 
	36, 65, 90, 97, 122, 32, 34, 45, 
	47, 95, 9, 13, 35, 36, 65, 90, 
	97, 122, 34, 45, 10, 42, 42, 42, 
	47, 32, 34, 45, 47, 95, 9, 13, 
	35, 36, 48, 57, 65, 90, 97, 122, 
	45, 10, 42, 42, 42, 47, 45, 10, 
	42, 42, 42, 47, 45, 10, 42, 42, 
	42, 47, 34, 39, 32, 34, 45, 47, 
	95, 9, 13, 35, 36, 65, 90, 97, 
	122, 45, 10, 42, 42, 42, 47, 10, 
	42, 42, 47, 32, 34, 39, 40, 44, 
	45, 47, 9, 13, 32, 45, 47, 73, 
	105, 9, 13, 95, 35, 36, 48, 57, 
	65, 90, 97, 122, 32, 34, 45, 47, 
	95, 9, 13, 35, 36, 48, 57, 65, 
	90, 97, 122, 34, 39, 39, 32, 34, 
	45, 47, 95, 9, 13, 35, 36, 65, 
	90, 97, 122, 45, 42, 0
]

class << self
	attr_accessor :_record_typ_single_lengths
	private :_record_typ_single_lengths, :_record_typ_single_lengths=
end
self._record_typ_single_lengths = [
	5, 1, 1, 1, 1, 2, 2, 3, 
	4, 2, 2, 2, 2, 2, 6, 4, 
	5, 1, 5, 5, 1, 1, 1, 1, 
	1, 2, 5, 1, 1, 1, 1, 2, 
	1, 1, 1, 1, 2, 1, 1, 1, 
	1, 2, 1, 1, 5, 1, 1, 1, 
	1, 2, 1, 1, 2, 7, 5, 0, 
	1, 5, 1, 1, 1, 5, 1, 1
]

class << self
	attr_accessor :_record_typ_range_lengths
	private :_record_typ_range_lengths, :_record_typ_range_lengths=
end
self._record_typ_range_lengths = [
	1, 0, 0, 0, 0, 0, 0, 1, 
	1, 0, 0, 0, 0, 0, 1, 1, 
	4, 0, 4, 4, 0, 0, 0, 0, 
	0, 0, 5, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 4, 0, 0, 0, 
	0, 0, 0, 0, 0, 1, 1, 0, 
	4, 5, 0, 0, 0, 4, 0, 0
]

class << self
	attr_accessor :_record_typ_index_offsets
	private :_record_typ_index_offsets, :_record_typ_index_offsets=
end
self._record_typ_index_offsets = [
	0, 7, 9, 11, 13, 15, 18, 21, 
	26, 32, 35, 38, 41, 44, 47, 55, 
	61, 71, 73, 83, 93, 95, 97, 99, 
	101, 103, 106, 117, 119, 121, 123, 125, 
	128, 130, 132, 134, 136, 139, 141, 143, 
	145, 147, 150, 152, 154, 164, 166, 168, 
	170, 172, 175, 177, 179, 182, 191, 198, 
	199, 205, 216, 218, 220, 222, 232, 234
]

class << self
	attr_accessor :_record_typ_indicies
	private :_record_typ_indicies, :_record_typ_indicies=
end
self._record_typ_indicies = [
	1, 2, 3, 4, 4, 1, 0, 5, 
	0, 1, 5, 6, 0, 7, 6, 7, 
	1, 6, 8, 8, 0, 9, 10, 11, 
	9, 0, 9, 12, 10, 11, 9, 0, 
	13, 13, 0, 14, 14, 0, 15, 15, 
	0, 16, 16, 0, 17, 17, 0, 18, 
	19, 20, 21, 17, 17, 18, 0, 18, 
	19, 20, 21, 18, 0, 19, 22, 24, 
	25, 23, 19, 23, 23, 23, 0, 27, 
	26, 28, 29, 31, 32, 30, 28, 30, 
	30, 30, 0, 33, 34, 36, 37, 35, 
	33, 35, 35, 35, 0, 39, 38, 40, 
	0, 33, 40, 41, 0, 42, 41, 42, 
	33, 41, 28, 29, 31, 32, 43, 28, 
	43, 44, 43, 43, 0, 45, 0, 19, 
	45, 46, 0, 47, 46, 47, 19, 46, 
	48, 0, 18, 48, 49, 0, 50, 49, 
	50, 18, 49, 51, 0, 9, 51, 52, 
	0, 53, 52, 53, 9, 52, 56, 55, 
	58, 57, 59, 22, 60, 61, 23, 59, 
	23, 23, 23, 54, 62, 54, 59, 62, 
	63, 54, 64, 63, 64, 59, 63, 66, 
	65, 68, 67, 68, 66, 67, 70, 71, 
	72, 73, 74, 75, 76, 70, 69, 1, 
	2, 3, 4, 4, 1, 0, 77, 78, 
	78, 78, 78, 78, 77, 28, 29, 31, 
	32, 43, 28, 43, 79, 43, 43, 77, 
	56, 55, 58, 57, 57, 81, 59, 22, 
	60, 61, 23, 59, 23, 23, 23, 80, 
	65, 80, 67, 80, 0
]

class << self
	attr_accessor :_record_typ_trans_targs
	private :_record_typ_trans_targs, :_record_typ_trans_targs=
end
self._record_typ_trans_targs = [
	53, 0, 1, 3, 6, 2, 4, 5, 
	7, 8, 37, 39, 9, 10, 11, 12, 
	13, 14, 15, 16, 32, 34, 17, 26, 
	27, 29, 17, 18, 19, 20, 56, 21, 
	23, 19, 20, 56, 21, 23, 20, 55, 
	22, 24, 25, 57, 26, 28, 30, 31, 
	33, 35, 36, 38, 40, 41, 53, 42, 
	53, 43, 60, 44, 45, 47, 46, 48, 
	49, 50, 54, 51, 52, 53, 54, 58, 
	59, 53, 61, 62, 63, 53, 56, 57, 
	53, 53
]

class << self
	attr_accessor :_record_typ_trans_actions
	private :_record_typ_trans_actions, :_record_typ_trans_actions=
end
self._record_typ_trans_actions = [
	23, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 1, 1, 
	0, 0, 0, 0, 3, 28, 28, 3, 
	3, 0, 5, 5, 0, 0, 0, 0, 
	0, 0, 0, 46, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 21, 0, 
	13, 0, 34, 0, 0, 0, 0, 0, 
	0, 0, 37, 0, 0, 15, 43, 11, 
	43, 25, 43, 11, 11, 31, 0, 40, 
	19, 17
]

class << self
	attr_accessor :_record_typ_to_state_actions
	private :_record_typ_to_state_actions, :_record_typ_to_state_actions=
end
self._record_typ_to_state_actions = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 7, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0
]

class << self
	attr_accessor :_record_typ_from_state_actions
	private :_record_typ_from_state_actions, :_record_typ_from_state_actions=
end
self._record_typ_from_state_actions = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 9, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0
]

class << self
	attr_accessor :_record_typ_eof_trans
	private :_record_typ_eof_trans, :_record_typ_eof_trans=
end
self._record_typ_eof_trans = [
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 55, 1, 55, 55, 55, 55, 
	55, 55, 55, 55, 55, 0, 1, 78, 
	78, 78, 81, 81, 82, 81, 81, 81
]

class << self
	attr_accessor :record_typ_start
end
self.record_typ_start = 53;
class << self
	attr_accessor :record_typ_first_final
end
self.record_typ_first_final = 53;
class << self
	attr_accessor :record_typ_error
end
self.record_typ_error = -1;

class << self
	attr_accessor :record_typ_en_main
end
self.record_typ_en_main = 53;


# line 39 "/home/talek/gitrepos/vorax-rb/lib/vorax/parser/grammars/record_typ.rl"
        
# line 265 "/home/talek/gitrepos/vorax-rb/lib/vorax/parser/grammars/record_typ.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = record_typ_start
	ts = nil
	te = nil
	act = 0
end

# line 40 "/home/talek/gitrepos/vorax-rb/lib/vorax/parser/grammars/record_typ.rl"
        
# line 277 "/home/talek/gitrepos/vorax-rb/lib/vorax/parser/grammars/record_typ.rb"
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
	end
	if _goto_level <= _resume
	_acts = _record_typ_from_state_actions[cs]
	_nacts = _record_typ_actions[_acts]
	_acts += 1
	while _nacts > 0
		_nacts -= 1
		_acts += 1
		case _record_typ_actions[_acts - 1]
			when 6 then
# line 1 "NONE"
		begin
ts = p
		end
# line 307 "/home/talek/gitrepos/vorax-rb/lib/vorax/parser/grammars/record_typ.rb"
		end # from state action switch
	end
	if _trigger_goto
		next
	end
	_keys = _record_typ_key_offsets[cs]
	_trans = _record_typ_index_offsets[cs]
	_klen = _record_typ_single_lengths[cs]
	_break_match = false
	
	begin
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + _klen - 1

	     loop do
	        break if _upper < _lower
	        _mid = _lower + ( (_upper - _lower) >> 1 )

	        if data[p].ord < _record_typ_trans_keys[_mid]
	           _upper = _mid - 1
	        elsif data[p].ord > _record_typ_trans_keys[_mid]
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
	  _klen = _record_typ_range_lengths[cs]
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + (_klen << 1) - 2
	     loop do
	        break if _upper < _lower
	        _mid = _lower + (((_upper-_lower) >> 1) & ~1)
	        if data[p].ord < _record_typ_trans_keys[_mid]
	          _upper = _mid - 2
	        elsif data[p].ord > _record_typ_trans_keys[_mid+1]
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
	_trans = _record_typ_indicies[_trans]
	end
	if _goto_level <= _eof_trans
	cs = _record_typ_trans_targs[_trans]
	if _record_typ_trans_actions[_trans] != 0
		_acts = _record_typ_trans_actions[_trans]
		_nacts = _record_typ_actions[_acts]
		_acts += 1
		while _nacts > 0
			_nacts -= 1
			_acts += 1
			case _record_typ_actions[_acts - 1]
when 0 then
# line 7 "/home/talek/gitrepos/vorax-rb/lib/vorax/parser/grammars/record_typ.rl"
		begin

  expr = Parser.walk_balanced_paren(data[(p..-1)])
  p += expr.length - 1
  te = p
		end
when 1 then
# line 16 "/home/talek/gitrepos/vorax-rb/lib/vorax/parser/grammars/record_typ.rl"
		begin
 @start = p 		end
when 2 then
# line 16 "/home/talek/gitrepos/vorax-rb/lib/vorax/parser/grammars/record_typ.rl"
		begin
 @attr = data[(@start..p)] 		end
when 3 then
# line 17 "/home/talek/gitrepos/vorax-rb/lib/vorax/parser/grammars/record_typ.rl"
		begin
 @start = p 		end
when 4 then
# line 17 "/home/talek/gitrepos/vorax-rb/lib/vorax/parser/grammars/record_typ.rl"
		begin
 @attributes << { :name => @attr, :type => data[(@start..p)] } 		end
when 7 then
# line 1 "NONE"
		begin
te = p+1
		end
when 8 then
# line 20 "/home/talek/gitrepos/vorax-rb/lib/vorax/parser/grammars/record_typ.rl"
		begin
act = 1;		end
when 9 then
# line 22 "/home/talek/gitrepos/vorax-rb/lib/vorax/parser/grammars/record_typ.rl"
		begin
act = 3;		end
when 10 then
# line 23 "/home/talek/gitrepos/vorax-rb/lib/vorax/parser/grammars/record_typ.rl"
		begin
act = 4;		end
when 11 then
# line 25 "/home/talek/gitrepos/vorax-rb/lib/vorax/parser/grammars/record_typ.rl"
		begin
act = 6;		end
when 12 then
# line 21 "/home/talek/gitrepos/vorax-rb/lib/vorax/parser/grammars/record_typ.rl"
		begin
te = p+1
		end
when 13 then
# line 24 "/home/talek/gitrepos/vorax-rb/lib/vorax/parser/grammars/record_typ.rl"
		begin
te = p+1
		end
when 14 then
# line 25 "/home/talek/gitrepos/vorax-rb/lib/vorax/parser/grammars/record_typ.rl"
		begin
te = p+1
		end
when 15 then
# line 20 "/home/talek/gitrepos/vorax-rb/lib/vorax/parser/grammars/record_typ.rl"
		begin
te = p
p = p - 1;		end
when 16 then
# line 23 "/home/talek/gitrepos/vorax-rb/lib/vorax/parser/grammars/record_typ.rl"
		begin
te = p
p = p - 1;		end
when 17 then
# line 25 "/home/talek/gitrepos/vorax-rb/lib/vorax/parser/grammars/record_typ.rl"
		begin
te = p
p = p - 1;		end
when 18 then
# line 25 "/home/talek/gitrepos/vorax-rb/lib/vorax/parser/grammars/record_typ.rl"
		begin
 begin p = ((te))-1; end
		end
when 19 then
# line 1 "NONE"
		begin
	case act
	when 6 then
	begin begin p = ((te))-1; end
end
	else
	begin begin p = ((te))-1; end
end
end 
			end
# line 466 "/home/talek/gitrepos/vorax-rb/lib/vorax/parser/grammars/record_typ.rb"
			end # action switch
		end
	end
	if _trigger_goto
		next
	end
	end
	if _goto_level <= _again
	_acts = _record_typ_to_state_actions[cs]
	_nacts = _record_typ_actions[_acts]
	_acts += 1
	while _nacts > 0
		_nacts -= 1
		_acts += 1
		case _record_typ_actions[_acts - 1]
when 5 then
# line 1 "NONE"
		begin
ts = nil;		end
# line 486 "/home/talek/gitrepos/vorax-rb/lib/vorax/parser/grammars/record_typ.rb"
		end # to state action switch
	end
	if _trigger_goto
		next
	end
	p += 1
	if p != pe
		_goto_level = _resume
		next
	end
	end
	if _goto_level <= _test_eof
	if p == eof
	if _record_typ_eof_trans[cs] > 0
		_trans = _record_typ_eof_trans[cs] - 1;
		_goto_level = _eof_trans
		next;
	end
end
	end
	if _goto_level <= _out
		break
	end
	end
	end

# line 41 "/home/talek/gitrepos/vorax-rb/lib/vorax/parser/grammars/record_typ.rl"
		  end
		  return @attributes
		end

	end

end
