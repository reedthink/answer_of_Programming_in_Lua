function P_4_1()
    str = "<![CDATA/[\n  Hello world\n]]"
    str2 = [=[
<![CDATA/[
    Hello world
]]]=]
    print(str)
    print(str2)
end

function insert(str, index, insert_str)
    return string.sub(str, 1, index - 1) .. insert_str .. string.sub(str, index)
end

function insert_utf8(str, index, insert_str)
    index = utf8.offset(str, index)
    local ans = ''
    if index == nil then
        return str .. insert_str
    end

    for p, c in utf8.codes(str) do
        if p >= index then
            break
        end
        ans = ans .. utf8.char(c)
    end
    ans = ans .. insert_str
    for p, c in utf8.codes(str) do
        if p >= index then
            ans = ans .. utf8.char(c)
        end
    end
    return ans
end

function P_4_3()
    print(insert("123", 6, "HHHH"))
    print(insert("hello world", 1, "start:"))
    print(insert("hello world", 7, "small "))
end

function P_4_4()
    utf8_str = "一二三四"
    -- print(utf8_str)
    for i = 1, 6 do
        print(insert_utf8(utf8_str, i, "!"))
    end
end

function remove(str, begin, len)
    local endIdx = begin + len
    return string.sub(str, 1, begin - 1) .. string.sub(str, endIdx)
end

function P_4_5()
    print(remove('hello world', 7, 4))
end

function utf8_sub(str, i, j)
    i = utf8.offset(str, i)
    j = utf8.offset(str, j)
    local ans = ''
    for p, c in utf8.codes(str) do
        if p >= i and (j == nil or p <= j) then
            ans = ans .. utf8.char(c)
        end
    end
    return ans
end

function remove_utf8(str, begin, len)
    local endIdx = begin + len
    return utf8_sub(str, 1, begin - 1) .. utf8_sub(str, endIdx, #str)
end

function P_4_6()
    print(remove_utf8('一二三四', 2, 2))
end

function ispali(str)
    local reverse_str = string.reverse(str)
    return str == reverse_str
end

function P_4_7()
    print(ispali('step on no pets'))
    print(ispali('banana'))
end

function removeWhitespaceAndPunctuation(str)
    -- 替换空格为无（%s代表空格，替换为""）
    str = string.gsub(str, "%s+", "")
    -- 替换标点符号为无（这里使用了一部分基本拉丁语标点符号集）
    str = string.gsub(str, "[%p]", "")
    return str
end

function P_4_8()
    print(ispali(removeWhitespaceAndPunctuation('step on no  pets')))
    print(ispali(removeWhitespaceAndPunctuation('banana')))
end

function utf8_reverse(str)
    local reversed = {}
    -- 使用utf8.codes迭代每个字符
    for _, codepoint in utf8.codes(str) do
        -- 将字符插入到数组的开头
        table.insert(reversed, 1, utf8.char(codepoint))
    end
    -- 将数组连接成字符串
    return table.concat(reversed)
end

function ispali_utf8(str)
    local reverse_str = utf8_reverse(str)
    print(reverse_str)
    return str == reverse_str
end

function P_4_9()
    print(ispali_utf8('一二三四'))
    print(ispali_utf8('一二一二一'))
end

-- P_4_1()
P_4_9()