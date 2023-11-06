# Lua-Study
Learn Lua language routines.



## Linux Environment Configuration

```shell
1.Unzip the source code package and enter the directory。
2.make linux test
3.sudo make install
```



## Lua Basic Grammar

### Interactive Programming

```lua
$ lua
Lua 5.4.6  Copyright (C) 1994-2023 Lua.org, PUC-Rio
> print("hello world")
hello world
```



### Scripted Programming

```lua
#!/usr/local/bin/lua

print("hello Lua")
print("https://github.com/bhrbhr123")
```



result:

```shell
$ chmod u+x 2script.lua 
$ ls
1hello.lua  2script.lua
$ ./2script.lua 
hello Lua
https://github.com/bhrbhr123
```



### Comment

Single line comments

```lua
-- Single line comments
```



Multi-line comments

```lua
--[[
	Multi-line comments
	Multi-line comments
--]]
```



### Identifier

Lua identifiers are used to define a variable and functions to obtain other user-defined items. An identifier starts with one of the letters A to Z or a to z or an underscore _ followed by 0 or more letters, underscores, and numbers (0 to 9).

It is best not to use underscores and capital letters as identifiers, because this is also the case with Lua's reserved words.

Lua does not allow special characters such as @, $, and % to be used to define identifiers. Lua is a case-sensitive programming language. Therefore Runoob and runoob are two different identifiers in Lua.



### Key Words

Lua's reserved keywords are listed below. Reserved keywords cannot be used as constants or variables or other user-defined identifiers：

| and      | break | do    | else   |
| -------- | ----- | ----- | ------ |
| elseif   | end   | false | for    |
| function | if    | in    | local  |
| nil      | not   | or    | repeat |
| return   | then  | true  | until  |
| while    | goto  |       |        |

By general convention, names starting with an underscore followed by a string of uppercase letters (such as _VERSION) are reserved for Lua internal global variables.



### Global Variables

By default, variables are always considered global.

Global variables do not need to be declared. After assigning a value to a variable, the global variable is created. There is no error when accessing an uninitialized global variable, but the result is: nil.

```lua
-- nil
print(val)

-- 10
val = 10
print(val)
```



If you want to delete a global variable, just assign the variable to nil.

```lua
val = 10

print(val)


val = nil

-- A variable exists if and only if it is not equal to nil.
print(val)

```

This way the variable b acts as if it has never been used. In other words, a variable exists if and only if it is not equal to nil.



## Lua Type Of Data

Lua is a dynamically typed language. Variables do not need to be typed, only variables need to be assigned values. Values can be stored in variables, passed as arguments or returned as results.

There are 8 basic types in Lua: nil, boolean, number, string, userdata, function, thread and table.

| 数据类型 | 描述                                                         |
| :------- | :----------------------------------------------------------- |
| nil      | 这个最简单，只有值nil属于该类，表示一个无效值（在条件表达式中相当于false）。 |
| boolean  | 包含两个值：false和true。                                    |
| number   | 表示双精度类型的实浮点数                                     |
| string   | 字符串由一对双引号或单引号来表示                             |
| function | 由 C 或 Lua 编写的函数                                       |
| userdata | 表示任意存储在变量中的C数据结构                              |
| thread   | 表示执行的独立线路，用于执行协同程序                         |
| table    | Lua 中的表（table）其实是一个"关联数组"（associative arrays），数组的索引可以是数字、字符串或表类型。在 Lua 里，table 的创建是通过"构造表达式"来完成，最简单构造表达式是{}，用来创建一个空表。 |

We can use the type function to test the type of a given variable or value:

```lua
print(type(nil))

print(type(ture))
print(type(false))

print(type(10.66))

print(type('hello'))
print(type("world"))

print(type(type))

result:
$ lua 1type.lua 
nil
nil
boolean
number
string
string
function
```



### nil

The nil type represents a type that does not have any valid value. It has only one value - nil. For example, printing a variable without an assignment will output a nil value:

```lua
> print(type(a))
nil
>
```

For global variables and tables, nil also has a "deletion" effect. Assigning a nil value to global variables or variables in the table is equivalent to deleting them. You can know by executing the following code:

```lua
tab1 = { key1 = "val1", key2 = "val2", "val3" }
for k, v in pairs(tab1) do
    print(k .. " - " .. v)
end
 
tab1.key1 = nil
for k, v in pairs(tab1) do
    print(k .. " - " .. v)
end
```

nil should be compared with double quotes ":

```lua
> type(X)
nil
> type(X)==nil
false
> type(X)=="nil"
true
>
```

The reason why the result of type(X)==nil is false is that type(X) is essentially the returned "nil" string, which is a string type:

```lua
type(type(X))==string
```



### boolean

The boolean type has only two optional values: true (true) and false (false). Lua treats false and nil as false, everything else is true, and the number 0 is also true:

```lua
print(type(true))
print(type(false))
print(type(nil))
 
if false or nil then
    print("至少有一个是 true")
else
    print("false 和 nil 都为 false")
end

if 0 then
    print("数字 0 是 true")
else
    print("数字 0 为 false")
end
```



result:

```shell
$ lua 2boolean.lua 
nil
boolean
nil
都为false
0为ture
```



### number

Lua has only one number type by default - double (double precision) type (the default type can be modified in luaconf.h). The following writing methods are regarded as number types:

```lua
print(type(2))
print(type(2.2))
print(type(0.2))
print(type(2e+1))
print(type(0.2e-1))
print(type(7.8263692594256e-06))
```



result:

```shell
$ lua 3number.lua 
number
number
number
number
number
number
```



### string

A string is represented by a pair of double quotes or single quotes.

```lua
string1 = "this is string1"
string2 = 'this is string2'
```

You can also use 2 square brackets "[[]]" to represent a "block" of strings.

```lua
str1 = 'study Lua'
str2 = "study Lua"

html = [[
<html>
<head></head>
<body>
    <a href="http://www.runoob.com/">菜鸟教程</a>
</body>
</html>
]]
print(html)
print(str1)
print(str2)
```



result:

```shell
$ lua 4string.lua 
<html>
<head></head>
<body>
    <a href="http://www.runoob.com/">菜鸟教程</a>
</body>
</html>

study Lua
study Lua
```



When performing arithmetic operations on a numeric string, Lua will try to convert the numeric string into a number:

```lua
print("9" + 1)
print("2 + 8")
print("5" + "5")
```



result:

```shell
$ lua 5string_add_num.lua 
10
2 + 8
10
```



String concatenation uses .. , such as:

```lua
print('a' .. 'b')
print("c" .. "d")
print('e' .. "f")

print(123 .. 456 .. 789)
```



result:

```shell
$ !lua
lua 6string_concatenation.lua 
ab
cd
ef
123456789
```



Use # to calculate the length of the string and place it in front of the string, as shown in the following example:

```lua
-- 11
len = "hello world"

print(#len)

-- 9
print(#"study Lua")
```



result:

```shell
$ lua 7strlen.lua 
11
9
```



### table

In Lua, table creation is accomplished through "constructive expressions". The simplest constructed expression is {}, which is used to create an empty table. You can also add some data to the table and initialize the table directly:

```lua
-- 创建一个空的table
local tbl1 = {}

-- 直接初始化表
local tbl2 = {"me", "you", "he"}
```

A table in Lua is actually an "associative array", and the index of the array can be a number or a string.

```lua
-- table_test.lua 脚本文件
a = {}
a["key"] = "value"
key = 10
a[key] = 22
a[key] = a[key] + 11
for k, v in pairs(a) do
    print(k .. " : " .. v)
end
```



result:

```shell
$ lua table_test.lua 
key : value
10 : 33
```



Unlike arrays in other languages, which use 0 as the initial index of the array, the default initial index of tables in Lua generally starts with 1.

```lua
local tbl = {"i", "j", "k"}

-- The default initial index of a table in Lua generally starts with 1
print(tbl[1])
print(tbl[2])
print(tbl[3])
```



result:

```shell
$ !lu
lua 9table_index.lua 
i
j
k
```



The table will not have a fixed length. When new data is added, the length of the table will automatically grow. Tables that are not initialized will be nil.



### function

In Lua, functions are regarded as "First-Class Values" and functions can be stored in variables:

```lua
-- function_test.lua 脚本文件
function factorial1(n)
    if n == 0 then
        return 1
    else
        return n * factorial1(n - 1)
    end
end
print(factorial1(5))
factorial2 = factorial1
print(factorial2(5))
```



result:

```shell
$ lua function_test.lua 
120
120
```



A function can be passed as an anonymous function via parameters:

```lua
-- function_test2.lua 脚本文件
function testFun(tab,fun)
        for k ,v in pairs(tab) do
                print(fun(k,v));
        end
end


tab={key1="val1",key2="val2"};
testFun(tab,
function(key,val)--匿名函数
        return key.."="..val;
end
);
```

result:

```shell
$ lua function_test2.lua 
key1=val1
key2=val2
```



### thread

In Lua, the most important thread is the coroutine. It is similar to a thread and has its own independent stack, local variables and instruction pointer. It can share global variables and most other things with other coroutines.

The difference between threads and coroutines: Threads can run multiple times at the same time, but coroutines can only run one at any time, and a running coroutine will only be suspended when it is suspended.



### userdata

userdata is a type of user-defined data used to represent a type created by an application or C/C++ language library. It can store any data of any C/C++ data type (usually struct and pointer) into Lua. Called in a variable.



## Lua Variable

Before a variable can be used, it needs to be declared in the code, that is, the variable must be created.

Before the compiler executes the code, the compiler needs to know how to open a storage area for the statement variable to store the value of the variable.

There are three types of Lua variables: global variables, local variables, and fields in tables.

All variables in Lua are global variables, even in statement blocks or functions, unless they are explicitly declared as local variables using local.

The scope of a local variable is from the declaration position to the end of the statement block.

The default value of variables is nil.

```lua
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
    e = 8;				-- 全局变量
    local f = 88;		-- 局部变量

    print(e)
    print(f)

end

print(e)
print(f)
```



result:

```shell
$ !lu
lua 1variable.lua 
3
33
5
nil
8
88
8
nil
```



### Assignment Statement

Assignment is the most basic method of changing the value of a variable and changing table fields.

```lua
str = "hello" .. "world"
print(str)
```



result:

```shell
$ lua 2assign.lua 
helloworld
```



Lua can assign values to multiple variables at the same time. Each element of the variable list and value list is separated by commas. The value on the right side of the assignment statement will be assigned to the variable on the left in turn.

```lua
num1, num2 = 10 * 2, 2 + 5
print(num1)
print(num2)
```



When encountering an assignment statement, Lua will first calculate all the values on the right and then perform the assignment operation, so we can exchange the values of the variables like this:

```lua
x, y = 10, 20
print(x)
print(y)

-- swap
x, y = y, x
print(x)
print(y)
```



result:

```shell
$ lua 3swap.lua 
10
20
20
10
```



When the number of variables and the number of values are inconsistent, Lua will always adopt the following strategy based on the number of variables:

```shell
a. 变量个数 > 值的个数             按变量个数补足nil
b. 变量个数 < 值的个数             多余的值会被忽略
```

```lua
-- 变量的个数 > 值的个数
a, b, c = 1, 2
print(a, b, c)


-- 变量的个数 < 值的个数
a, b = 10, 20, 30
print(a, b)

-- 易错
a, b, c = 0
print(a, b, c)
```



result:

```shell
$ lua 4variables_values.lua 
1	2	nil
10	20
0	nil	nil
```



Multivalued assignment is often used to exchange variables, or to return a function call to a variable:

```lua
a, b = f()
```

f() returns two values, the first is assigned to a and the second to b.



Local variables should be used as much as possible. There are two benefits:

- Avoid naming conflicts.
- Accessing local variables is faster than global variables.



### Index

Use square brackets [] for table indexes. Lua also provides the . operation.

```lua
t[i]
t.i                 -- 当索引为字符串类型时的一种简化写法
gettable_event(t,i) -- 采用索引访问本质上是一个类似这样的函数调用
```





























































































































