
# line 1 "lib/vorax/parser/grammars/probe_subprog.rl"

# line 19 "lib/vorax/parser/grammars/probe_subprog.rl"


module Vorax

  module Parser

    class SubprogRegion < NamedRegion

      # Tries to figure out the type of the composite region.
      # @param data [String] the PLSQL code to be checked
      # @return [Hash] with the following keys: :name => the name of the function or procedure,
      #   :kind => the valid values are: :function, :procedure
      # @example
      #   text = 'function abc return boolean as begin null; end;'
      #   p Parser::SubprogRegion.probe(text)
      def self.probe(data)
				@name_pos, @temp_name_pos, @kind, @kind_temp, @name_temp, @name = nil
				if data
					eof = data.length
					
# line 26 "lib/vorax/parser/grammars/probe_subprog.rb"
class << self
	attr_accessor :_probe_subprog_actions
	private :_probe_subprog_actions, :_probe_subprog_actions=
end
self._probe_subprog_actions = [
	0, 1, 0, 1, 2, 1, 3, 2, 
	1, 4
]

class << self
	attr_accessor :_probe_subprog_key_offsets
	private :_probe_subprog_key_offsets, :_probe_subprog_key_offsets=
end
self._probe_subprog_key_offsets = [
	0, 0, 14, 18, 20, 22, 24, 26, 
	28, 30, 32, 34, 36, 41, 48, 49, 
	50, 51, 52, 54, 56, 58, 60, 62, 
	64, 66, 68, 73, 108, 109, 117, 118, 
	119, 120, 121, 123, 131, 132, 140, 148, 
	149, 156, 172, 189, 206, 207, 208, 209, 
	210, 212, 233, 243, 262, 281, 300, 319, 
	340, 359, 378, 397, 416, 435, 456, 475, 
	494, 513, 532, 551, 570, 589, 608, 627, 
	644, 663, 682, 701, 720, 739, 758, 777, 
	796, 815, 834, 853, 872, 891, 910, 929, 
	948, 969, 988, 1007, 1026, 1045, 1064, 1083, 
	1102, 1121, 1142, 1161, 1180, 1199, 1218, 1237, 
	1256, 1275, 1294, 1313, 1332, 1351, 1370, 1389, 
	1408, 1427, 1446, 1465, 1467, 1469, 1471, 1473, 
	1478, 1497, 1498, 1499, 1500, 1501, 1503, 1505, 
	1509, 1511, 1513, 1515, 1520, 1531, 1532, 1533, 
	1534, 1535, 1537, 1539, 1541, 1543, 1545, 1547, 
	1549, 1551, 1553, 1555, 1557, 1559, 1564, 1573, 
	1574, 1575, 1576, 1577, 1579, 1583, 1585, 1590, 
	1607, 1608, 1609, 1610, 1611, 1613, 1615, 1617, 
	1619, 1621, 1623, 1628, 1641, 1642, 1643, 1644, 
	1645, 1647, 1649, 1651, 1653, 1655, 1657, 1659, 
	1661, 1663, 1668, 1670, 1672, 1674, 1676, 1678, 
	1682, 1689, 1696, 1697, 1698, 1699, 1700, 1702, 
	1704, 1706, 1708, 1710, 1712, 1714, 1719, 1738, 
	1739, 1740, 1741, 1742, 1744, 1748, 1750, 1752, 
	1754, 1756, 1758, 1760, 1762, 1764, 1766, 1768, 
	1770, 1775, 1794, 1795, 1796, 1797, 1798, 1800, 
	1802, 1807
]

class << self
	attr_accessor :_probe_subprog_trans_keys
	private :_probe_subprog_trans_keys, :_probe_subprog_trans_keys=
end
self._probe_subprog_trans_keys = [
	67, 70, 73, 77, 79, 80, 83, 99, 
	102, 105, 109, 111, 112, 115, 79, 82, 
	111, 114, 78, 110, 83, 115, 84, 116, 
	82, 114, 85, 117, 67, 99, 84, 116, 
	79, 111, 82, 114, 32, 45, 47, 9, 
	13, 32, 45, 47, 70, 102, 9, 13, 
	45, 10, 42, 42, 42, 47, 85, 117, 
	78, 110, 67, 99, 84, 116, 73, 105, 
	79, 111, 78, 110, 32, 45, 47, 9, 
	13, 32, 34, 45, 47, 65, 66, 67, 
	68, 69, 70, 73, 79, 80, 82, 84, 
	95, 97, 98, 99, 100, 101, 102, 105, 
	111, 112, 114, 116, 9, 13, 35, 36, 
	71, 90, 103, 122, 34, 32, 40, 45, 
	46, 47, 59, 9, 13, 45, 10, 42, 
	42, 42, 47, 34, 95, 35, 36, 65, 
	90, 97, 122, 34, 32, 40, 45, 46, 
	47, 59, 9, 13, 34, 95, 35, 36, 
	65, 90, 97, 122, 34, 32, 40, 45, 
	47, 59, 9, 13, 32, 40, 45, 47, 
	59, 95, 9, 13, 35, 36, 48, 57, 
	65, 90, 97, 122, 32, 40, 45, 46, 
	47, 59, 95, 9, 13, 35, 36, 48, 
	57, 65, 90, 97, 122, 32, 40, 45, 
	46, 47, 59, 95, 9, 13, 35, 36, 
	48, 57, 65, 90, 97, 122, 45, 10, 
	42, 42, 42, 47, 32, 40, 45, 46, 
	47, 59, 83, 85, 95, 115, 117, 9, 
	13, 35, 36, 48, 57, 65, 90, 97, 
	122, 46, 95, 35, 36, 48, 57, 65, 
	90, 97, 122, 32, 40, 45, 46, 47, 
	59, 84, 95, 116, 9, 13, 35, 36, 
	48, 57, 65, 90, 97, 122, 32, 40, 
	45, 46, 47, 59, 72, 95, 104, 9, 
	13, 35, 36, 48, 57, 65, 90, 97, 
	122, 32, 40, 45, 46, 47, 59, 73, 
	95, 105, 9, 13, 35, 36, 48, 57, 
	65, 90, 97, 122, 32, 40, 45, 46, 
	47, 59, 68, 95, 100, 9, 13, 35, 
	36, 48, 57, 65, 90, 97, 122, 32, 
	40, 45, 46, 47, 59, 69, 79, 95, 
	101, 111, 9, 13, 35, 36, 48, 57, 
	65, 90, 97, 122, 32, 40, 45, 46, 
	47, 59, 71, 95, 103, 9, 13, 35, 
	36, 48, 57, 65, 90, 97, 122, 32, 
	40, 45, 46, 47, 59, 73, 95, 105, 
	9, 13, 35, 36, 48, 57, 65, 90, 
	97, 122, 32, 40, 45, 46, 47, 59, 
	78, 95, 110, 9, 13, 35, 36, 48, 
	57, 65, 90, 97, 122, 32, 40, 45, 
	46, 47, 59, 68, 95, 100, 9, 13, 
	35, 36, 48, 57, 65, 90, 97, 122, 
	32, 40, 45, 46, 47, 59, 89, 95, 
	121, 9, 13, 35, 36, 48, 57, 65, 
	90, 97, 122, 32, 40, 45, 46, 47, 
	59, 82, 85, 95, 114, 117, 9, 13, 
	35, 36, 48, 57, 65, 90, 97, 122, 
	32, 40, 45, 46, 47, 59, 69, 95, 
	101, 9, 13, 35, 36, 48, 57, 65, 
	90, 97, 122, 32, 40, 45, 46, 47, 
	59, 65, 95, 97, 9, 13, 35, 36, 
	48, 57, 66, 90, 98, 122, 32, 40, 
	45, 46, 47, 59, 84, 95, 116, 9, 
	13, 35, 36, 48, 57, 65, 90, 97, 
	122, 32, 40, 45, 46, 47, 59, 69, 
	95, 101, 9, 13, 35, 36, 48, 57, 
	65, 90, 97, 122, 32, 40, 45, 46, 
	47, 59, 82, 95, 114, 9, 13, 35, 
	36, 48, 57, 65, 90, 97, 122, 32, 
	40, 45, 46, 47, 59, 82, 95, 114, 
	9, 13, 35, 36, 48, 57, 65, 90, 
	97, 122, 32, 40, 45, 46, 47, 59, 
	69, 95, 101, 9, 13, 35, 36, 48, 
	57, 65, 90, 97, 122, 32, 40, 45, 
	46, 47, 59, 78, 95, 110, 9, 13, 
	35, 36, 48, 57, 65, 90, 97, 122, 
	32, 40, 45, 46, 47, 59, 84, 95, 
	116, 9, 13, 35, 36, 48, 57, 65, 
	90, 97, 122, 32, 40, 45, 46, 47, 
	59, 95, 9, 13, 35, 36, 48, 57, 
	65, 90, 97, 122, 32, 40, 45, 46, 
	47, 59, 85, 95, 117, 9, 13, 35, 
	36, 48, 57, 65, 90, 97, 122, 32, 
	40, 45, 46, 47, 59, 83, 95, 115, 
	9, 13, 35, 36, 48, 57, 65, 90, 
	97, 122, 32, 40, 45, 46, 47, 59, 
	69, 95, 101, 9, 13, 35, 36, 48, 
	57, 65, 90, 97, 122, 32, 40, 45, 
	46, 47, 59, 82, 95, 114, 9, 13, 
	35, 36, 48, 57, 65, 90, 97, 122, 
	32, 40, 45, 46, 47, 59, 69, 95, 
	101, 9, 13, 35, 36, 48, 57, 65, 
	90, 97, 122, 32, 40, 45, 46, 47, 
	59, 70, 95, 102, 9, 13, 35, 36, 
	48, 57, 65, 90, 97, 122, 32, 40, 
	45, 46, 47, 59, 73, 95, 105, 9, 
	13, 35, 36, 48, 57, 65, 90, 97, 
	122, 32, 40, 45, 46, 47, 59, 78, 
	95, 110, 9, 13, 35, 36, 48, 57, 
	65, 90, 97, 122, 32, 40, 45, 46, 
	47, 59, 78, 95, 110, 9, 13, 35, 
	36, 48, 57, 65, 90, 97, 122, 32, 
	40, 45, 46, 47, 59, 85, 95, 117, 
	9, 13, 35, 36, 48, 57, 65, 90, 
	97, 122, 32, 40, 45, 46, 47, 59, 
	78, 95, 110, 9, 13, 35, 36, 48, 
	57, 65, 90, 97, 122, 32, 40, 45, 
	46, 47, 59, 67, 95, 99, 9, 13, 
	35, 36, 48, 57, 65, 90, 97, 122, 
	32, 40, 45, 46, 47, 59, 84, 95, 
	116, 9, 13, 35, 36, 48, 57, 65, 
	90, 97, 122, 32, 40, 45, 46, 47, 
	59, 73, 95, 105, 9, 13, 35, 36, 
	48, 57, 65, 90, 97, 122, 32, 40, 
	45, 46, 47, 59, 79, 95, 111, 9, 
	13, 35, 36, 48, 57, 65, 90, 97, 
	122, 32, 40, 45, 46, 47, 59, 83, 
	95, 115, 9, 13, 35, 36, 48, 57, 
	65, 90, 97, 122, 32, 40, 45, 46, 
	47, 59, 82, 86, 95, 114, 118, 9, 
	13, 35, 36, 48, 57, 65, 90, 97, 
	122, 32, 40, 45, 46, 47, 59, 69, 
	95, 101, 9, 13, 35, 36, 48, 57, 
	65, 90, 97, 122, 32, 40, 45, 46, 
	47, 59, 82, 95, 114, 9, 13, 35, 
	36, 48, 57, 65, 90, 97, 122, 32, 
	40, 45, 46, 47, 59, 82, 95, 114, 
	9, 13, 35, 36, 48, 57, 65, 90, 
	97, 122, 32, 40, 45, 46, 47, 59, 
	73, 95, 105, 9, 13, 35, 36, 48, 
	57, 65, 90, 97, 122, 32, 40, 45, 
	46, 47, 59, 68, 95, 100, 9, 13, 
	35, 36, 48, 57, 65, 90, 97, 122, 
	32, 40, 45, 46, 47, 59, 73, 95, 
	105, 9, 13, 35, 36, 48, 57, 65, 
	90, 97, 122, 32, 40, 45, 46, 47, 
	59, 78, 95, 110, 9, 13, 35, 36, 
	48, 57, 65, 90, 97, 122, 32, 40, 
	45, 46, 47, 59, 71, 95, 103, 9, 
	13, 35, 36, 48, 57, 65, 90, 97, 
	122, 32, 40, 45, 46, 47, 59, 65, 
	82, 95, 97, 114, 9, 13, 35, 36, 
	48, 57, 66, 90, 98, 122, 32, 40, 
	45, 46, 47, 59, 67, 95, 99, 9, 
	13, 35, 36, 48, 57, 65, 90, 97, 
	122, 32, 40, 45, 46, 47, 59, 75, 
	95, 107, 9, 13, 35, 36, 48, 57, 
	65, 90, 97, 122, 32, 40, 45, 46, 
	47, 59, 65, 95, 97, 9, 13, 35, 
	36, 48, 57, 66, 90, 98, 122, 32, 
	40, 45, 46, 47, 59, 71, 95, 103, 
	9, 13, 35, 36, 48, 57, 65, 90, 
	97, 122, 32, 40, 45, 46, 47, 59, 
	79, 95, 111, 9, 13, 35, 36, 48, 
	57, 65, 90, 97, 122, 32, 40, 45, 
	46, 47, 59, 67, 95, 99, 9, 13, 
	35, 36, 48, 57, 65, 90, 97, 122, 
	32, 40, 45, 46, 47, 59, 69, 95, 
	101, 9, 13, 35, 36, 48, 57, 65, 
	90, 97, 122, 32, 40, 45, 46, 47, 
	59, 68, 95, 100, 9, 13, 35, 36, 
	48, 57, 65, 90, 97, 122, 32, 40, 
	45, 46, 47, 59, 85, 95, 117, 9, 
	13, 35, 36, 48, 57, 65, 90, 97, 
	122, 32, 40, 45, 46, 47, 59, 82, 
	95, 114, 9, 13, 35, 36, 48, 57, 
	65, 90, 97, 122, 32, 40, 45, 46, 
	47, 59, 69, 95, 101, 9, 13, 35, 
	36, 48, 57, 65, 90, 97, 122, 32, 
	40, 45, 46, 47, 59, 80, 95, 112, 
	9, 13, 35, 36, 48, 57, 65, 90, 
	97, 122, 32, 40, 45, 46, 47, 59, 
	76, 95, 108, 9, 13, 35, 36, 48, 
	57, 65, 90, 97, 122, 32, 40, 45, 
	46, 47, 59, 65, 95, 97, 9, 13, 
	35, 36, 48, 57, 66, 90, 98, 122, 
	32, 40, 45, 46, 47, 59, 67, 95, 
	99, 9, 13, 35, 36, 48, 57, 65, 
	90, 97, 122, 32, 40, 45, 46, 47, 
	59, 89, 95, 121, 9, 13, 35, 36, 
	48, 57, 65, 90, 97, 122, 32, 40, 
	45, 46, 47, 59, 80, 95, 112, 9, 
	13, 35, 36, 48, 57, 65, 90, 97, 
	122, 69, 101, 65, 97, 84, 116, 69, 
	101, 32, 45, 47, 9, 13, 32, 45, 
	47, 67, 70, 73, 77, 79, 80, 83, 
	99, 102, 105, 109, 111, 112, 115, 9, 
	13, 45, 10, 42, 42, 42, 47, 79, 
	111, 73, 85, 105, 117, 78, 110, 65, 
	97, 76, 108, 32, 45, 47, 9, 13, 
	32, 45, 47, 67, 70, 73, 99, 102, 
	105, 9, 13, 45, 10, 42, 42, 42, 
	47, 78, 110, 83, 115, 84, 116, 65, 
	97, 78, 110, 84, 116, 73, 105, 65, 
	97, 66, 98, 76, 108, 69, 101, 32, 
	45, 47, 9, 13, 32, 45, 47, 67, 
	70, 99, 102, 9, 13, 45, 10, 42, 
	42, 42, 47, 65, 69, 97, 101, 80, 
	112, 32, 45, 47, 9, 13, 32, 45, 
	47, 67, 70, 73, 77, 80, 83, 99, 
	102, 105, 109, 112, 115, 9, 13, 45, 
	10, 42, 42, 42, 47, 69, 101, 77, 
	109, 66, 98, 69, 101, 82, 114, 32, 
	45, 47, 9, 13, 32, 45, 47, 67, 
	70, 73, 80, 99, 102, 105, 112, 9, 
	13, 45, 10, 42, 42, 42, 47, 82, 
	114, 79, 111, 67, 99, 69, 101, 68, 
	100, 85, 117, 82, 114, 69, 101, 32, 
	45, 47, 9, 13, 84, 116, 65, 97, 
	84, 116, 73, 105, 67, 99, 82, 86, 
	114, 118, 32, 45, 47, 68, 100, 9, 
	13, 32, 45, 47, 82, 114, 9, 13, 
	45, 10, 42, 42, 42, 47, 69, 101, 
	80, 112, 76, 108, 65, 97, 67, 99, 
	69, 101, 32, 45, 47, 9, 13, 32, 
	45, 47, 67, 70, 73, 77, 79, 80, 
	83, 99, 102, 105, 109, 111, 112, 115, 
	9, 13, 45, 10, 42, 42, 42, 47, 
	82, 86, 114, 118, 68, 100, 69, 101, 
	82, 114, 69, 101, 82, 114, 82, 114, 
	73, 105, 68, 100, 73, 105, 78, 110, 
	71, 103, 32, 45, 47, 9, 13, 32, 
	45, 47, 67, 70, 73, 77, 79, 80, 
	83, 99, 102, 105, 109, 111, 112, 115, 
	9, 13, 45, 10, 42, 42, 42, 47, 
	82, 114, 32, 45, 47, 9, 13, 0
]

class << self
	attr_accessor :_probe_subprog_single_lengths
	private :_probe_subprog_single_lengths, :_probe_subprog_single_lengths=
end
self._probe_subprog_single_lengths = [
	0, 14, 4, 2, 2, 2, 2, 2, 
	2, 2, 2, 2, 3, 5, 1, 1, 
	1, 1, 2, 2, 2, 2, 2, 2, 
	2, 2, 3, 27, 1, 6, 1, 1, 
	1, 1, 2, 2, 1, 6, 2, 1, 
	5, 6, 7, 7, 1, 1, 1, 1, 
	2, 11, 2, 9, 9, 9, 9, 11, 
	9, 9, 9, 9, 9, 11, 9, 9, 
	9, 9, 9, 9, 9, 9, 9, 7, 
	9, 9, 9, 9, 9, 9, 9, 9, 
	9, 9, 9, 9, 9, 9, 9, 9, 
	11, 9, 9, 9, 9, 9, 9, 9, 
	9, 11, 9, 9, 9, 9, 9, 9, 
	9, 9, 9, 9, 9, 9, 9, 9, 
	9, 9, 9, 2, 2, 2, 2, 3, 
	17, 1, 1, 1, 1, 2, 2, 4, 
	2, 2, 2, 3, 9, 1, 1, 1, 
	1, 2, 2, 2, 2, 2, 2, 2, 
	2, 2, 2, 2, 2, 3, 7, 1, 
	1, 1, 1, 2, 4, 2, 3, 15, 
	1, 1, 1, 1, 2, 2, 2, 2, 
	2, 2, 3, 11, 1, 1, 1, 1, 
	2, 2, 2, 2, 2, 2, 2, 2, 
	2, 3, 2, 2, 2, 2, 2, 4, 
	5, 5, 1, 1, 1, 1, 2, 2, 
	2, 2, 2, 2, 2, 3, 17, 1, 
	1, 1, 1, 2, 4, 2, 2, 2, 
	2, 2, 2, 2, 2, 2, 2, 2, 
	3, 17, 1, 1, 1, 1, 2, 2, 
	3, 0
]

class << self
	attr_accessor :_probe_subprog_range_lengths
	private :_probe_subprog_range_lengths, :_probe_subprog_range_lengths=
end
self._probe_subprog_range_lengths = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 1, 1, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 1, 4, 0, 1, 0, 0, 
	0, 0, 0, 3, 0, 1, 3, 0, 
	1, 5, 5, 5, 0, 0, 0, 0, 
	0, 5, 4, 5, 5, 5, 5, 5, 
	5, 5, 5, 5, 5, 5, 5, 5, 
	5, 5, 5, 5, 5, 5, 5, 5, 
	5, 5, 5, 5, 5, 5, 5, 5, 
	5, 5, 5, 5, 5, 5, 5, 5, 
	5, 5, 5, 5, 5, 5, 5, 5, 
	5, 5, 5, 5, 5, 5, 5, 5, 
	5, 5, 5, 5, 5, 5, 5, 5, 
	5, 5, 5, 0, 0, 0, 0, 1, 
	1, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 1, 1, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 1, 1, 0, 
	0, 0, 0, 0, 0, 0, 1, 1, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 1, 1, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 1, 0, 0, 0, 0, 0, 0, 
	1, 1, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 1, 1, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	1, 1, 0, 0, 0, 0, 0, 0, 
	1, 0
]

class << self
	attr_accessor :_probe_subprog_index_offsets
	private :_probe_subprog_index_offsets, :_probe_subprog_index_offsets=
end
self._probe_subprog_index_offsets = [
	0, 0, 15, 20, 23, 26, 29, 32, 
	35, 38, 41, 44, 47, 52, 59, 61, 
	63, 65, 67, 70, 73, 76, 79, 82, 
	85, 88, 91, 96, 128, 130, 138, 140, 
	142, 144, 146, 149, 155, 157, 165, 171, 
	173, 180, 192, 205, 218, 220, 222, 224, 
	226, 229, 246, 253, 268, 283, 298, 313, 
	330, 345, 360, 375, 390, 405, 422, 437, 
	452, 467, 482, 497, 512, 527, 542, 557, 
	570, 585, 600, 615, 630, 645, 660, 675, 
	690, 705, 720, 735, 750, 765, 780, 795, 
	810, 827, 842, 857, 872, 887, 902, 917, 
	932, 947, 964, 979, 994, 1009, 1024, 1039, 
	1054, 1069, 1084, 1099, 1114, 1129, 1144, 1159, 
	1174, 1189, 1204, 1219, 1222, 1225, 1228, 1231, 
	1236, 1255, 1257, 1259, 1261, 1263, 1266, 1269, 
	1274, 1277, 1280, 1283, 1288, 1299, 1301, 1303, 
	1305, 1307, 1310, 1313, 1316, 1319, 1322, 1325, 
	1328, 1331, 1334, 1337, 1340, 1343, 1348, 1357, 
	1359, 1361, 1363, 1365, 1368, 1373, 1376, 1381, 
	1398, 1400, 1402, 1404, 1406, 1409, 1412, 1415, 
	1418, 1421, 1424, 1429, 1442, 1444, 1446, 1448, 
	1450, 1453, 1456, 1459, 1462, 1465, 1468, 1471, 
	1474, 1477, 1482, 1485, 1488, 1491, 1494, 1497, 
	1502, 1509, 1516, 1518, 1520, 1522, 1524, 1527, 
	1530, 1533, 1536, 1539, 1542, 1545, 1550, 1569, 
	1571, 1573, 1575, 1577, 1580, 1585, 1588, 1591, 
	1594, 1597, 1600, 1603, 1606, 1609, 1612, 1615, 
	1618, 1623, 1642, 1644, 1646, 1648, 1650, 1653, 
	1656, 1661
]

class << self
	attr_accessor :_probe_subprog_indicies
	private :_probe_subprog_indicies, :_probe_subprog_indicies=
end
self._probe_subprog_indicies = [
	0, 2, 3, 4, 5, 6, 7, 0, 
	2, 3, 4, 5, 6, 7, 1, 8, 
	9, 8, 9, 1, 10, 10, 1, 11, 
	11, 1, 12, 12, 1, 13, 13, 1, 
	14, 14, 1, 15, 15, 1, 16, 16, 
	1, 17, 17, 1, 18, 18, 1, 19, 
	20, 21, 19, 1, 19, 20, 21, 22, 
	22, 19, 1, 23, 1, 19, 23, 24, 
	1, 25, 24, 25, 19, 24, 26, 26, 
	1, 27, 27, 1, 28, 28, 1, 29, 
	29, 1, 30, 30, 1, 31, 31, 1, 
	32, 32, 1, 33, 34, 35, 33, 1, 
	36, 37, 39, 40, 41, 42, 43, 44, 
	45, 46, 47, 48, 49, 50, 51, 38, 
	41, 42, 43, 44, 45, 46, 47, 48, 
	49, 50, 51, 36, 38, 38, 38, 1, 
	53, 52, 54, 55, 56, 57, 58, 55, 
	54, 1, 59, 1, 60, 59, 61, 1, 
	62, 61, 62, 60, 61, 63, 64, 64, 
	64, 64, 1, 65, 63, 54, 55, 56, 
	66, 58, 55, 54, 1, 67, 68, 68, 
	68, 68, 1, 69, 67, 54, 55, 56, 
	58, 55, 54, 1, 54, 55, 56, 58, 
	55, 68, 54, 68, 68, 68, 68, 1, 
	54, 55, 56, 66, 58, 55, 64, 54, 
	64, 64, 64, 64, 1, 54, 55, 56, 
	57, 58, 55, 70, 54, 70, 70, 70, 
	70, 1, 71, 1, 36, 71, 72, 1, 
	73, 72, 73, 36, 72, 54, 55, 56, 
	57, 58, 55, 74, 75, 70, 74, 75, 
	54, 70, 70, 70, 70, 1, 57, 70, 
	70, 70, 70, 70, 1, 54, 55, 56, 
	57, 58, 55, 76, 70, 76, 54, 70, 
	70, 70, 70, 1, 54, 55, 56, 57, 
	58, 55, 77, 70, 77, 54, 70, 70, 
	70, 70, 1, 54, 55, 56, 57, 58, 
	55, 78, 70, 78, 54, 70, 70, 70, 
	70, 1, 54, 55, 56, 57, 58, 55, 
	74, 70, 74, 54, 70, 70, 70, 70, 
	1, 54, 55, 56, 57, 58, 55, 79, 
	80, 70, 79, 80, 54, 70, 70, 70, 
	70, 1, 54, 55, 56, 57, 58, 55, 
	81, 70, 81, 54, 70, 70, 70, 70, 
	1, 54, 55, 56, 57, 58, 55, 82, 
	70, 82, 54, 70, 70, 70, 70, 1, 
	54, 55, 56, 57, 58, 55, 74, 70, 
	74, 54, 70, 70, 70, 70, 1, 54, 
	55, 56, 57, 58, 55, 83, 70, 83, 
	54, 70, 70, 70, 70, 1, 54, 55, 
	56, 57, 58, 55, 74, 70, 74, 54, 
	70, 70, 70, 70, 1, 54, 55, 56, 
	57, 58, 55, 84, 85, 70, 84, 85, 
	54, 70, 70, 70, 70, 1, 54, 55, 
	56, 57, 58, 55, 86, 70, 86, 54, 
	70, 70, 70, 70, 1, 54, 55, 56, 
	57, 58, 55, 87, 70, 87, 54, 70, 
	70, 70, 70, 1, 54, 55, 56, 57, 
	58, 55, 88, 70, 88, 54, 70, 70, 
	70, 70, 1, 54, 55, 56, 57, 58, 
	55, 74, 70, 74, 54, 70, 70, 70, 
	70, 1, 54, 55, 56, 57, 58, 55, 
	89, 70, 89, 54, 70, 70, 70, 70, 
	1, 54, 55, 56, 57, 58, 55, 90, 
	70, 90, 54, 70, 70, 70, 70, 1, 
	54, 55, 56, 57, 58, 55, 91, 70, 
	91, 54, 70, 70, 70, 70, 1, 54, 
	55, 56, 57, 58, 55, 92, 70, 92, 
	54, 70, 70, 70, 70, 1, 54, 55, 
	56, 57, 58, 55, 93, 70, 93, 54, 
	70, 70, 70, 70, 1, 54, 55, 56, 
	57, 58, 55, 94, 54, 70, 70, 70, 
	70, 1, 54, 55, 56, 57, 58, 55, 
	95, 70, 95, 54, 70, 70, 70, 70, 
	1, 54, 55, 56, 57, 58, 55, 96, 
	70, 96, 54, 70, 70, 70, 70, 1, 
	54, 55, 56, 57, 58, 55, 97, 70, 
	97, 54, 70, 70, 70, 70, 1, 54, 
	55, 56, 57, 58, 55, 74, 70, 74, 
	54, 70, 70, 70, 70, 1, 54, 55, 
	56, 57, 58, 55, 98, 70, 98, 54, 
	70, 70, 70, 70, 1, 54, 55, 56, 
	57, 58, 55, 99, 70, 99, 54, 70, 
	70, 70, 70, 1, 54, 55, 56, 57, 
	58, 55, 100, 70, 100, 54, 70, 70, 
	70, 70, 1, 54, 55, 56, 57, 58, 
	55, 96, 70, 96, 54, 70, 70, 70, 
	70, 1, 54, 55, 56, 57, 58, 55, 
	78, 70, 78, 54, 70, 70, 70, 70, 
	1, 54, 55, 56, 57, 58, 55, 101, 
	70, 101, 54, 70, 70, 70, 70, 1, 
	54, 55, 56, 57, 58, 55, 102, 70, 
	102, 54, 70, 70, 70, 70, 1, 54, 
	55, 56, 57, 58, 55, 103, 70, 103, 
	54, 70, 70, 70, 70, 1, 54, 55, 
	56, 57, 58, 55, 104, 70, 104, 54, 
	70, 70, 70, 70, 1, 54, 55, 56, 
	57, 58, 55, 105, 70, 105, 54, 70, 
	70, 70, 70, 1, 54, 55, 56, 57, 
	58, 55, 82, 70, 82, 54, 70, 70, 
	70, 70, 1, 54, 55, 56, 57, 58, 
	55, 74, 70, 74, 54, 70, 70, 70, 
	70, 1, 54, 55, 56, 57, 58, 55, 
	74, 106, 70, 74, 106, 54, 70, 70, 
	70, 70, 1, 54, 55, 56, 57, 58, 
	55, 107, 70, 107, 54, 70, 70, 70, 
	70, 1, 54, 55, 56, 57, 58, 55, 
	108, 70, 108, 54, 70, 70, 70, 70, 
	1, 54, 55, 56, 57, 58, 55, 109, 
	70, 109, 54, 70, 70, 70, 70, 1, 
	54, 55, 56, 57, 58, 55, 110, 70, 
	110, 54, 70, 70, 70, 70, 1, 54, 
	55, 56, 57, 58, 55, 111, 70, 111, 
	54, 70, 70, 70, 70, 1, 54, 55, 
	56, 57, 58, 55, 112, 70, 112, 54, 
	70, 70, 70, 70, 1, 54, 55, 56, 
	57, 58, 55, 113, 70, 113, 54, 70, 
	70, 70, 70, 1, 54, 55, 56, 57, 
	58, 55, 74, 70, 74, 54, 70, 70, 
	70, 70, 1, 54, 55, 56, 57, 58, 
	55, 114, 115, 70, 114, 115, 54, 70, 
	70, 70, 70, 1, 54, 55, 56, 57, 
	58, 55, 116, 70, 116, 54, 70, 70, 
	70, 70, 1, 54, 55, 56, 57, 58, 
	55, 117, 70, 117, 54, 70, 70, 70, 
	70, 1, 54, 55, 56, 57, 58, 55, 
	118, 70, 118, 54, 70, 70, 70, 70, 
	1, 54, 55, 56, 57, 58, 55, 88, 
	70, 88, 54, 70, 70, 70, 70, 1, 
	54, 55, 56, 57, 58, 55, 119, 70, 
	119, 54, 70, 70, 70, 70, 1, 54, 
	55, 56, 57, 58, 55, 120, 70, 120, 
	54, 70, 70, 70, 70, 1, 54, 55, 
	56, 57, 58, 55, 121, 70, 121, 54, 
	70, 70, 70, 70, 1, 54, 55, 56, 
	57, 58, 55, 122, 70, 122, 54, 70, 
	70, 70, 70, 1, 54, 55, 56, 57, 
	58, 55, 123, 70, 123, 54, 70, 70, 
	70, 70, 1, 54, 55, 56, 57, 58, 
	55, 88, 70, 88, 54, 70, 70, 70, 
	70, 1, 54, 55, 56, 57, 58, 55, 
	124, 70, 124, 54, 70, 70, 70, 70, 
	1, 54, 55, 56, 57, 58, 55, 125, 
	70, 125, 54, 70, 70, 70, 70, 1, 
	54, 55, 56, 57, 58, 55, 126, 70, 
	126, 54, 70, 70, 70, 70, 1, 54, 
	55, 56, 57, 58, 55, 127, 70, 127, 
	54, 70, 70, 70, 70, 1, 54, 55, 
	56, 57, 58, 55, 88, 70, 88, 54, 
	70, 70, 70, 70, 1, 54, 55, 56, 
	57, 58, 55, 128, 70, 128, 54, 70, 
	70, 70, 70, 1, 54, 55, 56, 57, 
	58, 55, 88, 70, 88, 54, 70, 70, 
	70, 70, 1, 129, 129, 1, 130, 130, 
	1, 131, 131, 1, 132, 132, 1, 133, 
	134, 135, 133, 1, 133, 134, 135, 136, 
	2, 3, 4, 137, 6, 7, 136, 2, 
	3, 4, 137, 6, 7, 133, 1, 138, 
	1, 133, 138, 139, 1, 140, 139, 140, 
	133, 139, 8, 8, 1, 141, 26, 141, 
	26, 1, 142, 142, 1, 143, 143, 1, 
	144, 144, 1, 145, 146, 147, 145, 1, 
	145, 146, 147, 136, 22, 3, 136, 22, 
	3, 145, 1, 148, 1, 145, 148, 149, 
	1, 150, 149, 150, 145, 149, 151, 151, 
	1, 152, 152, 1, 153, 153, 1, 154, 
	154, 1, 155, 155, 1, 156, 156, 1, 
	157, 157, 1, 158, 158, 1, 159, 159, 
	1, 160, 160, 1, 161, 161, 1, 162, 
	163, 164, 162, 1, 162, 163, 164, 136, 
	22, 136, 22, 162, 1, 165, 1, 162, 
	165, 166, 1, 167, 166, 167, 162, 166, 
	168, 169, 168, 169, 1, 170, 170, 1, 
	171, 172, 173, 171, 1, 171, 172, 173, 
	136, 2, 3, 174, 6, 7, 136, 2, 
	3, 174, 6, 7, 171, 1, 175, 1, 
	171, 175, 176, 1, 177, 176, 177, 171, 
	176, 169, 169, 1, 178, 178, 1, 179, 
	179, 1, 180, 180, 1, 181, 181, 1, 
	182, 183, 184, 182, 1, 182, 183, 184, 
	136, 2, 3, 6, 136, 2, 3, 6, 
	182, 1, 185, 1, 182, 185, 186, 1, 
	187, 186, 187, 182, 186, 188, 188, 1, 
	189, 189, 1, 190, 190, 1, 191, 191, 
	1, 192, 192, 1, 193, 193, 1, 194, 
	194, 1, 195, 195, 1, 196, 197, 198, 
	196, 1, 199, 199, 1, 200, 200, 1, 
	201, 201, 1, 202, 202, 1, 181, 181, 
	1, 203, 204, 203, 204, 1, 205, 206, 
	207, 208, 208, 205, 1, 205, 206, 207, 
	209, 209, 205, 1, 210, 1, 205, 210, 
	211, 1, 212, 211, 212, 205, 211, 213, 
	213, 1, 214, 214, 1, 215, 215, 1, 
	216, 216, 1, 217, 217, 1, 218, 218, 
	1, 219, 220, 221, 219, 1, 219, 220, 
	221, 136, 2, 3, 4, 5, 6, 7, 
	136, 2, 3, 4, 5, 6, 7, 219, 
	1, 222, 1, 219, 222, 223, 1, 224, 
	223, 224, 219, 223, 225, 204, 225, 204, 
	1, 208, 208, 1, 226, 226, 1, 170, 
	170, 1, 227, 227, 1, 228, 228, 1, 
	229, 229, 1, 230, 230, 1, 231, 231, 
	1, 232, 232, 1, 233, 233, 1, 234, 
	234, 1, 235, 236, 237, 235, 1, 235, 
	236, 237, 136, 2, 3, 4, 238, 6, 
	7, 136, 2, 3, 4, 238, 6, 7, 
	235, 1, 239, 1, 235, 239, 240, 1, 
	241, 240, 241, 235, 240, 225, 225, 1, 
	60, 242, 243, 60, 1, 1, 0
]

class << self
	attr_accessor :_probe_subprog_trans_targs
	private :_probe_subprog_trans_targs, :_probe_subprog_trans_targs=
end
self._probe_subprog_trans_targs = [
	2, 0, 127, 138, 156, 212, 177, 186, 
	3, 115, 4, 5, 6, 7, 8, 9, 
	10, 11, 12, 13, 14, 16, 19, 15, 
	17, 18, 20, 21, 22, 23, 24, 25, 
	26, 27, 44, 46, 27, 28, 43, 44, 
	46, 49, 55, 61, 76, 80, 81, 87, 
	88, 97, 108, 113, 28, 29, 232, 233, 
	30, 35, 32, 31, 232, 33, 34, 36, 
	42, 37, 38, 39, 41, 40, 43, 45, 
	47, 48, 50, 51, 52, 53, 54, 56, 
	59, 57, 58, 60, 62, 66, 63, 64, 
	65, 67, 68, 69, 70, 71, 72, 73, 
	74, 75, 77, 78, 79, 82, 83, 84, 
	85, 86, 89, 90, 91, 92, 93, 94, 
	95, 96, 98, 102, 99, 100, 101, 103, 
	104, 105, 106, 107, 109, 110, 111, 112, 
	114, 116, 117, 118, 119, 120, 121, 123, 
	126, 191, 122, 124, 125, 128, 129, 130, 
	131, 132, 133, 135, 134, 136, 137, 139, 
	140, 141, 142, 143, 144, 145, 146, 147, 
	148, 149, 150, 151, 153, 152, 154, 155, 
	157, 166, 158, 159, 160, 162, 165, 161, 
	163, 164, 167, 168, 169, 170, 171, 172, 
	174, 173, 175, 176, 178, 179, 180, 181, 
	182, 183, 184, 185, 27, 44, 46, 187, 
	188, 189, 190, 192, 216, 193, 194, 196, 
	214, 199, 195, 197, 198, 200, 201, 202, 
	203, 204, 205, 206, 207, 209, 208, 210, 
	211, 213, 215, 217, 218, 219, 220, 221, 
	222, 223, 224, 225, 226, 228, 231, 227, 
	229, 230, 30, 32
]

class << self
	attr_accessor :_probe_subprog_trans_actions
	private :_probe_subprog_trans_actions, :_probe_subprog_trans_actions=
end
self._probe_subprog_trans_actions = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 5, 5, 5, 0, 1, 1, 0, 
	0, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 0, 0, 7, 7, 
	7, 0, 7, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 3, 3, 3, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0
]

class << self
	attr_accessor :probe_subprog_start
end
self.probe_subprog_start = 1;
class << self
	attr_accessor :probe_subprog_first_final
end
self.probe_subprog_first_final = 232;
class << self
	attr_accessor :probe_subprog_error
end
self.probe_subprog_error = 0;

class << self
	attr_accessor :probe_subprog_en_subprog
end
self.probe_subprog_en_subprog = 1;


# line 39 "lib/vorax/parser/grammars/probe_subprog.rl"
					
# line 729 "lib/vorax/parser/grammars/probe_subprog.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = probe_subprog_start
end

# line 40 "lib/vorax/parser/grammars/probe_subprog.rl"
					
# line 738 "lib/vorax/parser/grammars/probe_subprog.rb"
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
	_keys = _probe_subprog_key_offsets[cs]
	_trans = _probe_subprog_index_offsets[cs]
	_klen = _probe_subprog_single_lengths[cs]
	_break_match = false
	
	begin
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + _klen - 1

	     loop do
	        break if _upper < _lower
	        _mid = _lower + ( (_upper - _lower) >> 1 )

	        if data[p].ord < _probe_subprog_trans_keys[_mid]
	           _upper = _mid - 1
	        elsif data[p].ord > _probe_subprog_trans_keys[_mid]
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
	  _klen = _probe_subprog_range_lengths[cs]
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + (_klen << 1) - 2
	     loop do
	        break if _upper < _lower
	        _mid = _lower + (((_upper-_lower) >> 1) & ~1)
	        if data[p].ord < _probe_subprog_trans_keys[_mid]
	          _upper = _mid - 2
	        elsif data[p].ord > _probe_subprog_trans_keys[_mid+1]
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
	_trans = _probe_subprog_indicies[_trans]
	cs = _probe_subprog_trans_targs[_trans]
	if _probe_subprog_trans_actions[_trans] != 0
		_acts = _probe_subprog_trans_actions[_trans]
		_nacts = _probe_subprog_actions[_acts]
		_acts += 1
		while _nacts > 0
			_nacts -= 1
			_acts += 1
			case _probe_subprog_actions[_acts - 1]
when 0 then
# line 10 "lib/vorax/parser/grammars/probe_subprog.rl"
		begin
@start_id = p; @temp_name_pos = p		end
when 1 then
# line 10 "lib/vorax/parser/grammars/probe_subprog.rl"
		begin
@name_temp = data[@start_id...p]		end
when 2 then
# line 14 "lib/vorax/parser/grammars/probe_subprog.rl"
		begin
@kind_temp = :procedure		end
when 3 then
# line 16 "lib/vorax/parser/grammars/probe_subprog.rl"
		begin
@kind_temp = :function		end
when 4 then
# line 17 "lib/vorax/parser/grammars/probe_subprog.rl"
		begin
@name = @name_temp; @kind = @kind_temp; @name_pos = @temp_name_pos		end
# line 839 "lib/vorax/parser/grammars/probe_subprog.rb"
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

# line 41 "lib/vorax/parser/grammars/probe_subprog.rl"
				end
				{:name => @name, :kind => @kind, :name_pos => @name_pos}
			end

    end

  end

end
