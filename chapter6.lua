function P_6_1(a)
    for _, v in ipairs(a) do print(v) end
end

function P_6_2(...)
    -- {...} 才是包含所有参数的table
    local r = { ... }
    for k, v in ipairs(r)
    do
        r[k] = r[k + 1]
    end
    return r
end

function P_6_3(...)
    local r = { ... }
    r[#r] = nil
    return r
end

function P_6_4(array)
    -- 洗牌算法
    local r = shuffle({ 1, 2, 3, 4, 5 })
    print(table.concat(r, ', '))
end

function P_6_5()
    array = { 1, 2, 3, 4 }
    local all = {}
    for i = 1, #array do
        gen_comb(array, i, 1, {}, all)
    end
    for k, v in pairs(all) do
        print(table.unpack(v))
    end
end

function P_6_6()
    -- 没搞懂
end

function shuffle(array)
    math.randomseed(os.time())
    -- 生成一个1到10之间的随机整数
    -- local randomInt = math.random(10)
    for i = #array, 1, -1 do
        -- 第i个数跟1到i随机位置交换
        local randIdx = math.random(i)
        array[i], array[randIdx] = array[randIdx], array[i]
    end
    return array
end

function gen_comb(array, m, start, result, all)
    if m == #result then
        table.insert(all, { table.unpack(result) })
        return
    end
    for i = start, #array do
        table.insert(result, array[i])
        gen_comb(array, m, i + 1, result, all)
        table.remove(result)
    end
end

-- P_6_2(1, { 5, 6 }, 3)
-- r = P_6_3(1, { 5, 6 }, 3)

P_6_5()
-- for k, v in pairs(r) do
--     print(k, v)
-- end
