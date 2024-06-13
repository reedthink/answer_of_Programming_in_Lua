local Set = require "meta_table_example"
local s1 = Set.new { 2, 4 }
local s2 = Set.new { 4, 10, 2 }
print(s1 <= s2)
print(s1 < s2)
print(s1 >= s1)
print(s1 > s1)
-- print(s2 * s1)
print(s1 == (s2 * s1))
-- 类型不同直接返回false
