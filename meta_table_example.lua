local Set = {}
local mt = {}

-- table中所有的键本身就是一个set

-- 使用指定列表创建集合
-- function Set.new(l)
--     local set = {}
--     for _, v in ipairs(l) do
--         set[v] = true
--     end
--     return set
-- end

function Set.union(a, b)
    local res = Set.new {}
    for k in pairs(a) do res[k] = true end
    for k in pairs(b) do res[k] = true end
    return res
end

function Set.intersection(a, b)
    print(getmetatable(a), getmetatable(b), mt)
    if getmetatable(a) ~= mt or getmetatable(b) ~= mt then
        error("attempt to 'add' a set with a non-set value", 2)
    end
    local res = Set.new {}
    for k in pairs(a) do res[k] = b[k] end
    return res
end

function Set.tostring(set)
    local l = {}
    for e in pairs(set) do
        l[#l + 1] = tostring(e)
    end
    return "{" .. table.concat(l, ", ") .. "}"
end

-- 直接重新赋值
function Set.new(l)
    local set = {}
    setmetatable(set, mt)
    for _, v in ipairs(l) do set[v] = true end
    return set
end

mt.__add = Set.union
mt.__mul = Set.intersection

-- 定义小于等于
mt.__le = function(a, b)
    for k in pairs(a) do
        if not b[k] then return false end
    end
    return true
end


-- 定义小于
mt.__lt = function(a, b)
    return a <= b and not (b <= a)
end

-- 等于
mt.__eq = function(a, b)
    return a <= b and b <= a
end

mt.__tostring = Set.tostring

-- 保护元表
-- 而且给元表命名了。如果元表的上层表调用getmetable就返回"not your business"
mt.__metatable = "not your business"

-- s1 = Set.new({ 10, 20, 30, 50 })
-- s2 = Set.new { 30, 1 }
-- print(getmetatable(s1))
-- print(getmetatable(s2))
-- print(Set.tostring(s1 + s2))
-- local s3 = (s1 + s2) * s1
-- print(Set.tostring(s3))

-- s = Set.new { 1, 2, 3 }
-- s = s + 8

return Set
