a = {"apple", "banana", "orange"}


-- i = 1
-- print(a[1])
-- i = 1 --> Grammatical errors
--[[
for i = 1, 3, 1 do
    print(a[i])
end
--]]

for i, val in ipairs(a) do
    print(i, val)

end
