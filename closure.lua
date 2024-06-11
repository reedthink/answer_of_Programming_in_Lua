function createClosure()
    local secret = "I'm a secret!" -- 这是一个局部变量
    return function()
        print(secret)              -- 内部函数可以访问外部函数的局部变量
    end
end

local myClosure = createClosure() -- 创建闭包
myClosure()                       -- 输出 "I'm a secret!"


function newCounter()
    local count = 0
    return function()
        count = count + 1
        return count
    end
end

c1 = newCounter()
print(type(c1))
print(c1())
print(c1())
print(count)

-- 每个闭包是独立的
c2 = newCounter()
print(c2())
print(c2())


print(c1())

-- 好像很平滑就理解了函数是第一类值
-- C++那种才不方便理解，因为一开始的抽象层级没有充分屏蔽底层细节
function F(x)
    return {
        set = function(y) x = y end,
        get = function()
            return x
        end
    }
end

o1 = F(10)
o2 = F(20)

print(o1.get(), o2.get())

o2.set(100)
o1.set(300)
print(o1.get(), o2.get())