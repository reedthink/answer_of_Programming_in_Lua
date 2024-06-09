function P_5_1()
    sunday = "monday"; monday = "sunday"
    print("sunday val = ", sunday)
    print("monday val = ", monday)

    t = { sunday = "monday", [sunday] = monday }
    print(t.sunday, t[sunday], t[t.sunday])
    for k, v in pairs(t) do
        print(k, v)
    end
    -- 预测：monday monday sunday
    -- 为什么？因为 .x 等价于 ['x']
end

function P_5_3()
    local str = "<![CDATA/[\n  Hello world\n]]"
    local a = {
        ["<![CDATA/[\\n  Hello world\\n]]"] = str,
        ['\\n'] = "\n"
    }
    for k, v in pairs(a)
    do
        print(k, v)
    end
end

function P_5_4(a, x)
    local ret_val = 0
    for k, v in ipairs(a) do
        ret_val = ret_val + v * x ^ (k - 1)
    end
    return P_5_4
end

function P_5_5(a, x)
    return P_5_4(a, x)
end

function isEffSeq(a)
    for i = 1, #a do
        if (a[i] == nil) then
            return false
        end
    end

    return true
end

function P_5_6()
    a = { 1, nil, 2, 90, -1, nil }
    print(isEffSeq(a), #a)
end

-- 该函数将指定列表的所有元素插入到另一个列表的指定位置 。
function insert_to_list(list, target_list, pos)
    if pos > #target_list then
        return {}
    end
    for i = 1, #list do
        table.insert(target_list, pos + i, list[i])
    end
    return target_list
end

function P_5_7()
    for i = 1, 4 do
        local list = insert_to_list({ 1, 2, 3, 4 }, { 10, 20, 30 }, i)
        print(table.concat(list, ", "))
    end
end

function functionA(a)
    local ans = table.concat(a)
end

function functionB(a)
    local ans = ''
    local sz = #a
    for i = 1, sz do
        ans = ans .. tostring(a[i])
    end
    -- print (ans)
end

function P_5_8()
    -- 差得有点多
    -- local million = 1000000/
    local million = 10
    local largeTable = {}

    for i = 1, million do
        largeTable[i] = i
    end

    -- 现在 largeTable 是一个从1到1,000,000的整数序列
    local startTimeA = os.clock()
    functionA(largeTable)
    local endTimeA = os.clock()
    local timeA = endTimeA - startTimeA
    print("Function A took " .. timeA .. " seconds")

    -- 测量函数B的执行时间
    local startTimeB = os.clock()
    functionB(largeTable)
    local endTimeB = os.clock()
    local timeB = endTimeB - startTimeB
    print("Function B took " .. timeB .. " seconds")
end

P_5_8()
