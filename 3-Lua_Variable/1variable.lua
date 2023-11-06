a = 3               -- 全局变量
local b = 33        -- 局部变量

print(a)
print(b)

function joke()
    c = 5           -- 全局变量
    local d = 55    -- 局部变量
end

joke()
print(c)
print(d)

do
    e = 8;
    local f = 88;

    print(e)
    print(f)

end

print(e)
print(f)


