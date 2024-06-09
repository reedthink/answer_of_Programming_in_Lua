function P_7_1()
    if arg[1] == nil then
        repeat
            local t = io.read("l")
            io.write(Sort_string(t) .. '\n')
        until false
    elseif arg[1] ~= nil and arg[2] == nil then
        local file, err = io.open(arg[1], "r")
        if not file then
            print("Error opening file: " .. err)
            return
        end
        repeat
            local t = file:read("l")
            if t == nil then break end
            io.write(Sort_string(t) .. '\n')
        until false
        file:close() -- 关闭文件
    elseif arg[1] ~= nil and arg[2] ~= nil then
        local file_in = assert(io.open(arg[1], "r"))
        local file_out = assert(io.open(arg[2], "a"))

        repeat
            local t = file_in:read("l")
            if t == nil then break end
            file_out:write(Sort_string(t) .. '\n')
        until false
        file_in:close()  -- 关闭文件
        file_out:close() -- 关闭文件
    end
end

function P_7_2()
    if arg[1] == nil then
        repeat
            local t = io.read("l")
            io.write(Sort_string(t) .. '\n')
        until false
    elseif arg[1] ~= nil and arg[2] == nil then
        local file, err = io.open(arg[1], "r")
        if not file then
            print("Error opening file: " .. err)
            return
        end
        repeat
            local t = file:read("l")
            if t == nil then break end
            io.write(Sort_string(t) .. '\n')
        until false
        file:close() -- 关闭文件
    elseif arg[1] ~= nil and arg[2] ~= nil then
        local file_in = assert(io.open(arg[1], "r"))
        local f, e = io.open(arg[2], "r")
        if f ~= nil then
            io.write('输出文件已存在，是否继续 y/n : ')
            local t = io.read("l")
            if t ~= 'y' then
                return
            end
        end
        local file_out = assert(io.open(arg[2], "a"))

        repeat
            local t = file_in:read("l")
            if t == nil then break end
            file_out:write(Sort_string(t) .. '\n')
        until false
        file_in:close()  -- 关闭文件
        file_out:close() -- 关闭文件
    end
end

function P_7_3()
    -- 生成一个大文件
    -- g = string.rep("abcd", 2 ^ 15)
    -- for i = 1, 2 ^ 10 do
    --     io.write(g..'\n')
    -- end
    use_time("r_w_by_byte", r_w_by_byte, {})
    use_time("r_w_by_line", r_w_by_line, {})
    use_time("r_w_by_block", r_w_by_block, {})
    use_time("r_w_by_full", r_w_by_full, {})
end

function P_7_4()
    local f         = assert(io.open("test.in", 'r'))
    local size      = f:seek("end")
    local enter_num = 0
    for i = 1, size do
        local pos = f:seek("end", -(i))
        local t   = f:read(1)
        f:seek('set', pos)   -- 读取会移动游标, 所以要回原位
        if t == '\n' then
            f:seek("cur", 1) -- 因为是回车，所以往后退一格
            local t = f:read("a")
            io.write(t)
            return
        end
    end
    local t = f:read("a")
    io.write(t)
end

function P_7_5()
    last_n_line(10)
end

function P_7_6()
    os.execute("mkdir tmp_dir")
    os.execute("ls | grep tmp")
    os.execute("rm -r tmp_dir")

    io.popen('mkdir tmp_dir', "r")
    local f = io.popen('ls -lha | grep tmp', "r")
    local list = {}
    for e in f:lines() do
        list[#list + 1] = e
    end
    for k, v in pairs(list) do
        print(k, v)
    end
    io.popen('rm -r tmp_dir', "r")
end

function P_7_7()
    -- 改变不了
    os.execute("cd ../test_data")
end

function Sort_string(str)
    local char_array = {}
    for c in str:gmatch("%w") do
        table.insert(char_array, c)
    end
    table.sort(char_array)
    return table.concat(char_array)
end

function r_w_by_byte()
    -- 按字节
    io.input("../test_data/test.in")
    io.output("../test_data/test_byte.out")
    print("using byte")
    while true do
        local text = io.read(1)
        if not text then
            return
        end
        io.write(text)
    end
end

function r_w_by_line()
    -- 按行
    io.input("../test_data/test.in")
    io.output("../test_data/test_line.out")
    print("using all")
    while true do
        local text = io.read("L")
        if not text then
            return
        end
        io.write(text)
    end
end

function r_w_by_block()
    -- 按块
    io.input("../test_data/test.in")
    io.output("../test_data/test_block.out")
    print("using r_w_by_block")
    while true do
        local block = io.read(2 ^ 13)
        if not block then break end
        io.write(block)
    end
end

function r_w_by_full()
    io.input("../test_data/test.in")
    io.output("../test_data/test_full.out")
    print("using full")
    local text = io.read("a")
    if not text then
        return
    end
    io.write(text)
end

function use_time(func_name, func, args)
    local startTimeA = os.clock()
    func(table.unpack(args))
    local endTimeA = os.clock()
    local timeA = endTimeA - startTimeA
    print("Function " .. func_name .. " took " .. timeA .. " seconds")
end

function last_n_line(n)
    if n < 1 then return end
    local now_last_line = 0
    local f             = assert(io.open("test.in", 'r'))
    local size          = f:seek("end")
    local enter_num     = 0
    for i = 1, size do
        local last = f:seek("end", -(i))
        local t    = f:read(1)
        f:seek('cur', -1)
        if t == '\n' then
            now_last_line = now_last_line + 1
            if now_last_line == n then
                f:seek('cur', 1) -- 跳过回车
                local t = f:read("a")
                io.write(t)
                return
            end
        end
    end
    local t = f:read("a")
    io.write(t)
end

-- P_7_4()
P_7_7()
-- print(Sort_string("fsgfdAAjkdjvf"))
