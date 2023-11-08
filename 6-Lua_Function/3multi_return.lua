string = {"father", "mother", "son"}

function find_ht(str)
    i = 1
    while (str[i] ~= nil)
    do
        i = i + 1
    end

    return str[1], str[i - 1]

end


head, tail = find_ht(string)
print(head, tail)
