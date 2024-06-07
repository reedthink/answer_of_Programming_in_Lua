N = 8

function isplaceok(a, n, c)
    for i = 1, n - 1 do
        if (a[i] == c) or (a[i] - i == c - n) or (a[i] + i == c + n) then
            return false
        end
    end
    return true
end

-- 打印棋盘
function printsolution(a)
    for i=1, N do
        for j=1, N do
            io.write(a[i]==j and "X" or "-", " ")
        end
        io.write("\n")
    end
    io.write("\n")
end

function addqueen(a, n)
    if n>N then
    -- if n>N and F==0 then -- 输出第一个解后结束
        printsolution(a)
        Num = Num + 1
        F = 1
    else
        for c = 1, N do
            if (isplaceok(a,n,c)) then
                DFS_judge_times = DFS_judge_times + 1
                a[n] = c
                addqueen(a, n+1)
            end
        end
    end
end

function permute(list, start, endTable)
    start = start or 1
    endTable = endTable or {}
    if start > #list then
        -- table.insert(endTable, table.concat(list, ", "))
        table.insert(endTable, {table.unpack(list)})
    else
        for i = start, #list do
            list[start], list[i] = list[i], list[start] -- 交换元素
            permute(list, start + 1, endTable)
            list[start], list[i] = list[i], list[start] -- 交换回来
        end
    end
    return endTable
end

function get_full_permutation(n)
    -- 使用示例
    local items = {}
    for i = 1, n do
        items[i] = i
    end
    return permute(items)
end

function solve_by_perm()
    local allPermutations = get_full_permutation(8)
    local ans_num = 0
    for _, perm in ipairs(allPermutations) do
        local isOk = true
        for row, col in ipairs(perm) do
            if isplaceok(perm, row, col) == false then
                PERM_judge_times = PERM_judge_times + 1
                isOk = false
                break
            end
        end
        if isOk then
            printsolution(perm)
            ans_num = ans_num + 1
        end
    end
    print("答案数量", ans_num)
end

F = 0
Num = 0
DFS_judge_times = 0
PERM_judge_times = 0

addqueen({}, 1)
print ("解的数量", Num)

solve_by_perm()

print("回溯调用 isplaceok的次数:", DFS_judge_times)
print("全排列调用 isplaceok 的次数:", PERM_judge_times)