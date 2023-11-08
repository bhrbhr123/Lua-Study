function sum(...)
    num = 0

    -- note: in
    for i, v in ipairs{...}
    do
        num = num + v
    end
    return num
end

print(sum(1,2,3,4,5,6))




