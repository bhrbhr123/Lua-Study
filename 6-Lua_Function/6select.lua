function average(...)
    sum = 0
    local arg = {...}

    for i, v in ipairs(arg) do
        sum = sum + v
    end
    

    print("总共传入" .. #arg .. "个数")
    return sum / select("#",...)

end

print("平均值:", average(10,5,3,7,9))



