function Practice_3_3()
    for i = -10, 10 do
        print(i, i % 3)
    end
end

local math = require("math")
function Practice_3_6()
    -- 通过高 、 母线与轴线的夹角来计算正圆锥体体积的函数 。
    local slantHeight = 10    -- 母线长度，单位：米
    local height = 5          -- 高度，单位：米
    local angleInDegrees = 60 -- 母线与轴线的夹角，单位：度
    local v = calculateConeVolume(slantHeight, height, angleInDegrees)
    print(v)
end

function claculateRadius(l, thetaInDegrees)
    local theraInRadians = thetaInDegrees * math.pi / 180
    local r = l / math.tan(theraInRadians)
    return r
end

function calculateConeVolume(l, h, thetaInDegrees)
    local r = claculateRadius(l, thetaInDegrees)
    local volume = (1 / 3) * math.pi * r * r * h
    return volume
end

function Practice_3_7()
    --利用 函数 math.random 编写一个生成遵循正态分布（高斯分布）的伪随机数发生器
    -- Box-Muller变换
    math.randomseed(os.time())
    print (genGaussianRandom())
end

function genRandomNum()
    local r1 = math.random()
    local r2 = math.random()
    return r1, r2
end

function genGaussianRandom()
    local r1, r2 = genRandomNum()
    local z0     = math.sqrt(-2 * math.log(r1) * math.cos(2 * math.pi * r2))
    return z0
end

-- Practice_3_6()
Practice_3_7()
