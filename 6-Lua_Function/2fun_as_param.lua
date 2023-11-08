function my_print(val)
    print("value=", val)

end

function add(num1, num2, functionprint)
    functionprint(num1 + num2)

end

add(10, 6, my_print)


