function permute(list, start, endTable)
    start = start or 1
    endTable = endTable or {}
    if start > #list then
        -- table.insert(endTable, table.concat(list, ", "))
        table.insert(endTable, list)
    else
        for i = start, #list do
            list[start], list[i] = list[i], list[start] -- 交换元素
            permute(list, start + 1, endTable)
            list[start], list[i] = list[i], list[start] -- 交换回来
        end
    end
    return endTable
end

-- 使用示例
-- local items = {1,2,3,4,5,6,7,8}
local items = { 1, 2, 3, 4 }
allPermutations = permute(items)

print(#allPermutations)

-- 打印所有排列
for _, perm in ipairs(allPermutations) do
    print(perm, type(perm), type(items))
    for i = 1, #perm do
        print(perm[i], " ,")
        -- print(", ")
    end
end
print(#allPermutations)
