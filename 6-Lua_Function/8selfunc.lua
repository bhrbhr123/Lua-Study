function f(...)
    a = select(3, ...)
    print(a)
    print(select(3, ...))

end

f(1,2,3,4,5)
