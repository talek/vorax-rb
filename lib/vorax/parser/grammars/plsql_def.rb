
# line 1 "lib/vorax/parser/grammars/plsql_def.rl"

# line 45 "lib/vorax/parser/grammars/plsql_def.rl"


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
      @name = ""
      @type = ""
      if data
        eof = data.length
        
# line 25 "lib/vorax/parser/grammars/plsql_def.rb"
class << self
	attr_accessor :_plsql_def_actions
	private :_plsql_def_actions, :_plsql_def_actions=
end
self._plsql_def_actions = [
	0, 1, 0, 1, 1, 1, 2, 1, 
	3, 1, 4, 1, 5, 1, 6, 2, 
	5, 0
]

class << self
	attr_accessor :_plsql_def_key_offsets
	private :_plsql_def_key_offsets, :_plsql_def_key_offsets=
end
self._plsql_def_key_offsets = [
	0, 0, 6, 8, 10, 20, 38, 39, 
	45, 46, 47, 48, 49, 51, 66, 67, 
	68, 69, 70, 72, 89, 104, 110, 111, 
	112, 113, 114, 116, 133, 150, 167, 182, 
	188, 189, 190, 191, 192, 194, 196, 198, 
	200, 202, 204, 206, 208, 210, 212, 214, 
	219, 234, 235, 241, 250, 251, 252, 253, 
	254, 256, 258, 263, 264, 265, 266, 267, 
	269, 277, 278, 283, 297, 312, 313, 314, 
	315, 316, 318, 335, 352, 369, 384, 401, 
	402, 408, 417, 418, 419, 420, 421, 423, 
	425, 430, 431, 432, 433, 434, 436, 444, 
	445, 450, 464, 479, 480, 481, 482, 483, 
	485, 502, 517, 518, 519, 520, 521, 523, 
	525, 527, 527, 532, 537
]

class << self
	attr_accessor :_plsql_def_trans_keys
	private :_plsql_def_trans_keys, :_plsql_def_trans_keys=
end
self._plsql_def_trans_keys = [
	69, 80, 84, 101, 112, 116, 78, 110, 
	68, 100, 32, 45, 47, 59, 73, 76, 
	105, 108, 9, 13, 32, 34, 45, 47, 
	59, 73, 76, 95, 105, 108, 9, 13, 
	35, 36, 65, 90, 97, 122, 34, 32, 
	45, 47, 59, 9, 13, 45, 10, 42, 
	42, 42, 47, 32, 45, 47, 59, 95, 
	9, 13, 35, 36, 48, 57, 65, 90, 
	97, 122, 45, 10, 42, 42, 42, 47, 
	32, 45, 47, 59, 70, 95, 102, 9, 
	13, 35, 36, 48, 57, 65, 90, 97, 
	122, 32, 45, 47, 59, 95, 9, 13, 
	35, 36, 48, 57, 65, 90, 97, 122, 
	32, 45, 47, 59, 9, 13, 45, 10, 
	42, 42, 42, 47, 32, 45, 47, 59, 
	79, 95, 111, 9, 13, 35, 36, 48, 
	57, 65, 90, 97, 122, 32, 45, 47, 
	59, 79, 95, 111, 9, 13, 35, 36, 
	48, 57, 65, 90, 97, 122, 32, 45, 
	47, 59, 80, 95, 112, 9, 13, 35, 
	36, 48, 57, 65, 90, 97, 122, 32, 
	45, 47, 59, 95, 9, 13, 35, 36, 
	48, 57, 65, 90, 97, 122, 32, 45, 
	47, 59, 9, 13, 45, 10, 42, 42, 
	42, 47, 70, 102, 79, 111, 79, 111, 
	80, 112, 65, 97, 67, 99, 75, 107, 
	65, 97, 71, 103, 69, 101, 32, 45, 
	47, 9, 13, 32, 34, 45, 47, 66, 
	95, 98, 9, 13, 35, 36, 65, 90, 
	97, 122, 34, 32, 45, 46, 47, 9, 
	13, 32, 45, 47, 65, 73, 97, 105, 
	9, 13, 45, 10, 42, 42, 42, 47, 
	83, 115, 32, 45, 47, 9, 13, 45, 
	10, 42, 42, 42, 47, 34, 95, 35, 
	36, 65, 90, 97, 122, 34, 32, 45, 
	47, 9, 13, 32, 45, 47, 95, 9, 
	13, 35, 36, 48, 57, 65, 90, 97, 
	122, 32, 45, 46, 47, 95, 9, 13, 
	35, 36, 48, 57, 65, 90, 97, 122, 
	45, 10, 42, 42, 42, 47, 32, 45, 
	46, 47, 79, 95, 111, 9, 13, 35, 
	36, 48, 57, 65, 90, 97, 122, 32, 
	45, 46, 47, 68, 95, 100, 9, 13, 
	35, 36, 48, 57, 65, 90, 97, 122, 
	32, 45, 46, 47, 89, 95, 121, 9, 
	13, 35, 36, 48, 57, 65, 90, 97, 
	122, 32, 45, 46, 47, 95, 9, 13, 
	35, 36, 48, 57, 65, 90, 97, 122, 
	32, 34, 45, 47, 65, 73, 95, 97, 
	105, 9, 13, 35, 36, 66, 90, 98, 
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
	47, 83, 95, 115, 9, 13, 35, 36, 
	48, 57, 65, 90, 97, 122, 32, 45, 
	46, 47, 95, 9, 13, 35, 36, 48, 
	57, 65, 90, 97, 122, 45, 10, 42, 
	42, 42, 47, 89, 121, 80, 112, 32, 
	45, 47, 9, 13, 32, 45, 47, 9, 
	13, 32, 45, 47, 65, 73, 97, 105, 
	9, 13, 0
]

class << self
	attr_accessor :_plsql_def_single_lengths
	private :_plsql_def_single_lengths, :_plsql_def_single_lengths=
end
self._plsql_def_single_lengths = [
	0, 6, 2, 2, 8, 10, 1, 4, 
	1, 1, 1, 1, 2, 5, 1, 1, 
	1, 1, 2, 7, 5, 4, 1, 1, 
	1, 1, 2, 7, 7, 7, 5, 4, 
	1, 1, 1, 1, 2, 2, 2, 2, 
	2, 2, 2, 2, 2, 2, 2, 3, 
	7, 1, 4, 7, 1, 1, 1, 1, 
	2, 2, 3, 1, 1, 1, 1, 2, 
	2, 1, 3, 4, 5, 1, 1, 1, 
	1, 2, 7, 7, 7, 5, 9, 1, 
	4, 7, 1, 1, 1, 1, 2, 2, 
	3, 1, 1, 1, 1, 2, 2, 1, 
	3, 4, 5, 1, 1, 1, 1, 2, 
	7, 5, 1, 1, 1, 1, 2, 2, 
	2, 0, 3, 3, 7
]

class << self
	attr_accessor :_plsql_def_range_lengths
	private :_plsql_def_range_lengths, :_plsql_def_range_lengths=
end
self._plsql_def_range_lengths = [
	0, 0, 0, 0, 1, 4, 0, 1, 
	0, 0, 0, 0, 0, 5, 0, 0, 
	0, 0, 0, 5, 5, 1, 0, 0, 
	0, 0, 0, 5, 5, 5, 5, 1, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 1, 
	4, 0, 1, 1, 0, 0, 0, 0, 
	0, 0, 1, 0, 0, 0, 0, 0, 
	3, 0, 1, 5, 5, 0, 0, 0, 
	0, 0, 5, 5, 5, 5, 4, 0, 
	1, 1, 0, 0, 0, 0, 0, 0, 
	1, 0, 0, 0, 0, 0, 3, 0, 
	1, 5, 5, 0, 0, 0, 0, 0, 
	5, 5, 0, 0, 0, 0, 0, 0, 
	0, 0, 1, 1, 1
]

class << self
	attr_accessor :_plsql_def_index_offsets
	private :_plsql_def_index_offsets, :_plsql_def_index_offsets=
end
self._plsql_def_index_offsets = [
	0, 0, 7, 10, 13, 23, 38, 40, 
	46, 48, 50, 52, 54, 57, 68, 70, 
	72, 74, 76, 79, 92, 103, 109, 111, 
	113, 115, 117, 120, 133, 146, 159, 170, 
	176, 178, 180, 182, 184, 187, 190, 193, 
	196, 199, 202, 205, 208, 211, 214, 217, 
	222, 234, 236, 242, 251, 253, 255, 257, 
	259, 262, 265, 270, 272, 274, 276, 278, 
	281, 287, 289, 294, 304, 315, 317, 319, 
	321, 323, 326, 339, 352, 365, 376, 390, 
	392, 398, 407, 409, 411, 413, 415, 418, 
	421, 426, 428, 430, 432, 434, 437, 443, 
	445, 450, 460, 471, 473, 475, 477, 479, 
	482, 495, 506, 508, 510, 512, 514, 517, 
	520, 523, 524, 529, 534
]

class << self
	attr_accessor :_plsql_def_trans_targs
	private :_plsql_def_trans_targs, :_plsql_def_trans_targs=
end
self._plsql_def_trans_targs = [
	2, 41, 111, 2, 41, 111, 0, 3, 
	3, 0, 4, 4, 0, 5, 14, 16, 
	113, 37, 38, 37, 38, 5, 0, 5, 
	6, 14, 16, 113, 19, 27, 13, 19, 
	27, 5, 13, 13, 13, 0, 7, 6, 
	7, 8, 10, 113, 7, 0, 9, 0, 
	7, 9, 11, 0, 12, 11, 12, 7, 
	11, 7, 8, 10, 113, 13, 7, 13, 
	13, 13, 13, 0, 15, 0, 5, 15, 
	17, 0, 18, 17, 18, 5, 17, 7, 
	8, 10, 113, 20, 13, 20, 7, 13, 
	13, 13, 13, 0, 21, 22, 24, 113, 
	13, 21, 13, 13, 13, 13, 0, 21, 
	22, 24, 113, 21, 0, 23, 0, 21, 
	23, 25, 0, 26, 25, 26, 21, 25, 
	7, 8, 10, 113, 28, 13, 28, 7, 
	13, 13, 13, 13, 0, 7, 8, 10, 
	113, 29, 13, 29, 7, 13, 13, 13, 
	13, 0, 7, 8, 10, 113, 30, 13, 
	30, 7, 13, 13, 13, 13, 0, 31, 
	32, 34, 113, 13, 31, 13, 13, 13, 
	13, 0, 31, 32, 34, 113, 31, 0, 
	33, 0, 31, 33, 35, 0, 36, 35, 
	36, 31, 35, 21, 21, 0, 39, 39, 
	0, 40, 40, 0, 31, 31, 0, 42, 
	42, 0, 43, 43, 0, 44, 44, 0, 
	45, 45, 0, 46, 46, 0, 47, 47, 
	0, 48, 69, 71, 48, 0, 48, 49, 
	69, 71, 74, 68, 74, 48, 68, 68, 
	68, 0, 50, 49, 51, 52, 64, 54, 
	51, 0, 51, 52, 54, 57, 57, 57, 
	57, 51, 0, 53, 0, 51, 53, 55, 
	0, 56, 55, 56, 51, 55, 58, 58, 
	0, 114, 59, 61, 114, 0, 60, 0, 
	114, 60, 62, 0, 63, 62, 63, 114, 
	62, 65, 67, 67, 67, 67, 0, 66, 
	65, 51, 52, 54, 51, 0, 51, 52, 
	54, 67, 51, 67, 67, 67, 67, 0, 
	51, 52, 64, 54, 68, 51, 68, 68, 
	68, 68, 0, 70, 0, 48, 70, 72, 
	0, 73, 72, 73, 48, 72, 51, 52, 
	64, 54, 75, 68, 75, 51, 68, 68, 
	68, 68, 0, 51, 52, 64, 54, 76, 
	68, 76, 51, 68, 68, 68, 68, 0, 
	51, 52, 64, 54, 77, 68, 77, 51, 
	68, 68, 68, 68, 0, 78, 99, 64, 
	101, 68, 78, 68, 68, 68, 68, 0, 
	78, 79, 99, 101, 104, 104, 98, 104, 
	104, 78, 98, 98, 98, 0, 80, 79, 
	81, 82, 94, 84, 81, 0, 81, 82, 
	84, 87, 87, 87, 87, 81, 0, 83, 
	0, 81, 83, 85, 0, 86, 85, 86, 
	81, 85, 88, 88, 0, 115, 89, 91, 
	115, 0, 90, 0, 115, 90, 92, 0, 
	93, 92, 93, 115, 92, 95, 97, 97, 
	97, 97, 0, 96, 95, 81, 82, 84, 
	81, 0, 81, 82, 84, 97, 81, 97, 
	97, 97, 97, 0, 81, 82, 94, 84, 
	98, 81, 98, 98, 98, 98, 0, 100, 
	0, 78, 100, 102, 0, 103, 102, 103, 
	78, 102, 81, 82, 94, 84, 105, 98, 
	105, 81, 98, 98, 98, 98, 0, 116, 
	106, 94, 108, 98, 116, 98, 98, 98, 
	98, 0, 107, 0, 116, 107, 109, 0, 
	110, 109, 110, 116, 109, 112, 112, 0, 
	46, 46, 0, 0, 114, 59, 61, 114, 
	0, 115, 89, 91, 115, 0, 116, 106, 
	108, 87, 87, 87, 87, 116, 0, 0
]

class << self
	attr_accessor :_plsql_def_trans_actions
	private :_plsql_def_trans_actions, :_plsql_def_trans_actions=
end
self._plsql_def_trans_actions = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	5, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 5, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 5, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 5, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 5, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 9, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 9, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 5, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	5, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 5, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 7, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 7, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 13, 
	0, 0, 13, 13, 13, 0, 13, 13, 
	13, 0, 0, 0, 11, 11, 0, 11, 
	11, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 1, 0, 0, 1, 0, 0, 0, 
	1, 0, 0, 0, 0, 0, 0, 1, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 11, 11, 11, 11, 0, 11, 11, 
	11, 0, 11, 0, 0, 0, 0, 0, 
	11, 11, 0, 11, 0, 11, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 11, 11, 
	0, 11, 0, 0, 0, 11, 0, 0, 
	0, 0, 0, 11, 11, 0, 11, 0, 
	0, 0, 11, 0, 0, 0, 0, 0, 
	11, 11, 0, 11, 0, 0, 0, 11, 
	0, 0, 0, 0, 0, 11, 11, 0, 
	11, 0, 11, 0, 0, 0, 0, 0, 
	0, 13, 0, 0, 13, 13, 13, 13, 
	13, 0, 13, 13, 13, 0, 0, 0, 
	11, 11, 0, 11, 11, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 3, 0, 0, 
	3, 0, 0, 0, 3, 0, 0, 0, 
	0, 0, 0, 3, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 11, 11, 11, 
	11, 0, 11, 11, 11, 0, 11, 0, 
	0, 0, 0, 0, 11, 11, 0, 11, 
	0, 11, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 11, 11, 0, 11, 0, 0, 
	0, 11, 0, 0, 0, 0, 0, 15, 
	11, 0, 11, 0, 15, 0, 0, 0, 
	0, 0, 0, 0, 1, 0, 0, 0, 
	0, 0, 0, 1, 0, 0, 0, 0, 
	0, 0, 0, 0, 1, 0, 0, 1, 
	0, 3, 0, 0, 3, 0, 1, 0, 
	0, 0, 0, 0, 0, 1, 0, 0
]

class << self
	attr_accessor :plsql_def_start
end
self.plsql_def_start = 1;
class << self
	attr_accessor :plsql_def_first_final
end
self.plsql_def_first_final = 113;
class << self
	attr_accessor :plsql_def_error
end
self.plsql_def_error = 0;

class << self
	attr_accessor :plsql_def_en_main
end
self.plsql_def_en_main = 1;


# line 64 "lib/vorax/parser/grammars/plsql_def.rl"
        
# line 371 "lib/vorax/parser/grammars/plsql_def.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = plsql_def_start
end

# line 65 "lib/vorax/parser/grammars/plsql_def.rl"
        
# line 380 "lib/vorax/parser/grammars/plsql_def.rb"
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
# line 7 "lib/vorax/parser/grammars/plsql_def.rl"
		begin

  @end_pos = p - 1;
  @type = 'SPEC';
		end
when 1 then
# line 12 "lib/vorax/parser/grammars/plsql_def.rl"
		begin

  @end_pos = p - 1;
  @type = 'BODY';
		end
when 2 then
# line 17 "lib/vorax/parser/grammars/plsql_def.rl"
		begin

  @end_pos = p - 1;
  @type = 'END';
		end
when 3 then
# line 22 "lib/vorax/parser/grammars/plsql_def.rl"
		begin

  @end_pos = p - 1;
  @type = 'END_LOOP';
		end
when 4 then
# line 27 "lib/vorax/parser/grammars/plsql_def.rl"
		begin

  @end_pos = p - 1;
  @type = 'END_IF';
		end
when 5 then
# line 32 "lib/vorax/parser/grammars/plsql_def.rl"
		begin

  @name = data[(@start..p-1)]
		end
when 6 then
# line 40 "lib/vorax/parser/grammars/plsql_def.rl"
		begin
@start = p		end
# line 505 "lib/vorax/parser/grammars/plsql_def.rb"
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

# line 66 "lib/vorax/parser/grammars/plsql_def.rl"
      end
      return {:name => @name, :end_def => @end_pos, :type => @type}
    end

  end

end

