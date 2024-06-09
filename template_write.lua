function writeFunctionToFile(name, filePath)
    -- 创建函数定义
    local functionContent = "function " .. name .. "()\n    \nend\n\n"

    -- 打开文件以写入内容
    local file, err = io.open(filePath, "a") 
    if not file then
        print("Error opening file: " .. err)
        return
    end

    -- 写入函数定义到文件
    file:write(functionContent)
    file:close() -- 关闭文件
    print("Function written to " .. filePath)
end

-- 使用writeFunctionToFile函数将P_6_1函数写入到指定文件
-- writeFunctionToFile("P_6_1", "chapter6.lua")

for i = 1, 10 do
    writeFunctionToFile("P_6_" .. i, "chapter6.lua")
end
