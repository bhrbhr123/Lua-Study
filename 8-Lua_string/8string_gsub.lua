str = "aaaaaaaaaaa"

-- 不改变原字符串
print(string.gsub(str, "a", "b", 3))
print(str)
print(string.gsub(str, "a", "M"))


