#!/usr/bin/env bash
# Author: Openset
# Home: https://github.com/openset

# ------------------------------------------------------------------------
# 注释
# ------------------------------------------------------------------------
# 以"#"开头的行就是注释，会被解释器忽略。
# sh里没有多行注释，只能每一行加一个#号。
# 多行注释(HereDoc)
:<<EOF
注释内容...
注释内容...
注释内容...
EOF

# echo命令

# 双引号完全可以省略
echo string

# 显示普通字符串
echo "It is a string"   # It is a string

# 显示转义字符
echo "\"Hello World!\"" # "Hello World!"

# 显示变量
name=Sandy
echo "Hi, $name"        # Hi, Sandy

# 显示换行
echo -e "OK! \n" # -e 开启转义
echo "It it a test"
# OK!
#
# It it a test

# 显示不换行
echo -e "OK! \c" # -e 开启转义 \c 不换行
echo "It is a test"
# OK! It is a test

# 显示结果定向至文件
echo "It is a test" > myfile

# 原样输出字符串，不进行转义或取变量(用单引号)
echo '$name\"'

# 显示命令执行结果
echo `date`     # Fri Aug 3 17: 16: 42 CST 2018
echo $(date)    # Fri Aug 3 17: 17: 59 CST 2018

# ------------------------------------------------------------------------
# 变量类型
# 1 局部变量
# 2 环境变量
# 3 shell变量
# ------------------------------------------------------------------------

# 变量
name="Sandy"
echo $name
echo ${name}

# 只读变量
readonly PI=3.1415926
echo PI

# 删除变量
t='abc'
unset t

# ------------------------------------------------------------------------
# 字符串
# ------------------------------------------------------------------------

# 单引号
str='this is a string'
echo $str

# 双引号
str="Hello, I know you are \"$name\"!"
echo $str

# 拼接字符串
world="world"

# 使用双引号拼接
greeting="hello, "$world" !"    # hello, world !
greeting_1="hello, ${world} !"  # hello, world !
echo $greeting  $greeting_1

# 使用单引号拼接
greeting_2='hello, '$world' !'  # hello, world !
greeting_3='hello, ${world} !'  # hello, ${world} !
echo $greeting_2  $greeting_3

# 获取字符串长度
string="Hello"
echo ${#string}     # 5

# 提取子字符串
string="I love china!"
echo ${string: 0: 4}  # I lo

# ------------------------------------------------------------------------
# 数组
# ------------------------------------------------------------------------
# 定义数组
array_name=('value0' 'value1' 'value2' 'value3')

# 读取数组
# 读取数组元素值的一般格式是:
# ${array_name[index]}

# 使用 @/* 符号可以获取数组中的所有元素
echo ${array_name[@]}   # value0 value1 value2 value3
echo ${array_name[*]}   # value0 value1 value2 value3
echo ${array_name[0]}   # value0
echo ${array_name[2]}   # value2

# 取得数组元素的个数
length=${#array_name[@]}
echo $length            # 4
# 或者
length=${#array_name[*]}
echo $length            # 4

# 取得数组单个元素的长度
length=${#array_name[1]}
echo $length            # 6

# ------------------------------------------------------------------------
# 传递参数
# ------------------------------------------------------------------------
# 我们可以在执行 Shell 脚本时，向脚本传递参数，脚本内获取参数的格式为: $n。
# n 代表一个数字，0 为执行的文件名, 1 为执行脚本的第一个参数，2 为执行脚本的第二个参数，以此类推……

# 执行的文件名
echo $0     # ./learn.bash

# 传递到脚本的参数个数
echo $#     # 3

# 以一个单字符串显示所有向脚本传递的参数。
# 如"$*"用「"」括起来的情况、以"$1 $2 … $n"的形式输出所有参数。
echo $*     # a b c

# 脚本运行的当前进程ID号
echo $$     # 3664

# 后台运行的最后一个进程的ID号
echo $!     # 3670

# 与$*相同，但是使用时加引号，并在引号中返回每个参数。
# 如"$@"用「"」括起来的情况、以"$1" "$2" … "$n" 的形式输出所有参数。
echo "$@"   # a b c

# 显示Shell使用的当前选项，与set命令功能相同。
echo $-     # hB

# 显示最后命令的退出状态。0表示没有错误，其他任何值表明有错误。
echo $?     # 0

# ------------------------------------------------------------------------
# 基本运算符
#   算术运算符
#   关系运算符
#   布尔运算符
#   字符串运算符
#   文件测试运算符
# ------------------------------------------------------------------------

# 算术运算符
# ------------------------------------------------------------------------
# 运算符     说明      举例
# ------------------------------------------------------------------------
# +         加法      `expr $a + $b` 结果为 30。
# -         减法      `expr $a - $b` 结果为 -10。
# *         乘法      `expr $a \* $b` 结果为  200。
# /         除法      `expr $b / $a` 结果为 2。
# %         取余      `expr $b % $a` 结果为 0。
# =         赋值      a=$b 将把变量 b 的值赋给 a。
# ==        相等      用于比较两个数字，相同则返回 true。    [ $a == $b ] 返回 false。
# !=        不相等     用于比较两个数字，不相同则返回 true。   [ $a != $b ] 返回 true。
# ------------------------------------------------------------------------
# 注意: 条件表达式要放在方括号之间，并且要有空格，例如: [$a==$b] 是错误的，必须写成 [ $a == $b ]。

a=10
b=20

val=`expr $a + $b`
echo "a + b : $val"
# a + b : 30

val=`expr $a - $b`
echo "a - b : $val"
# a - b : -10

val=`expr $a \* $b`
echo "a * b : $val"
# a * b : 200

val=`expr $b / $a`
echo "b / a : $val"
# b / a : 2

val=`expr $b % $a`
echo "b % a : $val"
# b % a : 0

if [ $a == $b ]
then
   echo "a 等于 b"
fi

if [ $a != $b ]
then
   echo "a 不等于 b"
fi
# a 不等于 b

# 关系运算符
# ------------------------------------------------------------------------
# 运算符   说明                                          举例
# ------------------------------------------------------------------------
# -eq     检测两个数是否相等，相等返回 true。                [ $a -eq $b ] 返回 false。
# -ne     检测两个数是否不相等，不相等返回 true。             [ $a -ne $b ] 返回 true。
# -gt     检测左边的数是否大于右边的，如果是，则返回 true。     [ $a -gt $b ] 返回 false。
# -lt     检测左边的数是否小于右边的，如果是，则返回 true。     [ $a -lt $b ] 返回 true。
# -ge     检测左边的数是否大于等于右边的，如果是，则返回 true。  [ $a -ge $b ] 返回 false。
# -le     检测左边的数是否小于等于右边的，如果是，则返回 true。  [ $a -le $b ] 返回 true。
# ------------------------------------------------------------------------

a=10
b=20

if [ $a -eq $b ]
then
   echo "$a -eq $b : a 等于 b"
else
   echo "$a -eq $b: a 不等于 b"
fi
# 10 -eq 20: a 不等于 b

if [ $a -ne $b ]
then
   echo "$a -ne $b: a 不等于 b"
else
   echo "$a -ne $b : a 等于 b"
fi
# 10 -ne 20: a 不等于 b

if [ $a -gt $b ]
then
   echo "$a -gt $b: a 大于 b"
else
   echo "$a -gt $b: a 不大于 b"
fi
# 10 -gt 20: a 不大于 b

if [ $a -lt $b ]
then
   echo "$a -lt $b: a 小于 b"
else
   echo "$a -lt $b: a 不小于 b"
fi
# 10 -lt 20: a 小于 b

if [ $a -ge $b ]
then
   echo "$a -ge $b: a 大于或等于 b"
else
   echo "$a -ge $b: a 小于 b"
fi
# 10 -ge 20: a 小于 b

if [ $a -le $b ]
then
   echo "$a -le $b: a 小于或等于 b"
else
   echo "$a -le $b: a 大于 b"
fi
# 10 -le 20: a 小于或等于 b

# 布尔运算符
# ------------------------------------------------------------------------
# 运算符   说明                                           举例
# ------------------------------------------------------------------------
# !       非运算，表达式为 true 则返回 false，否则返回 true。  [ ! false ] 返回 true。
# -o      或运算，有一个表达式为 true 则返回 true。           [ $a -lt 20 -o $b -gt 100 ] 返回 true。
# -a      与运算，两个表达式都为 true 才返回 true。           [ $a -lt 20 -a $b -gt 100 ] 返回 false。
# ------------------------------------------------------------------------

a=10
b=20

if [ $a != $b ]
then
   echo "$a != $b : a 不等于 b"
else
   echo "$a != $b: a 等于 b"
fi
# 10 != 20 : a 不等于 b

if [ $a -lt 100 -a $b -gt 15 ]
then
   echo "$a 小于 100 且 $b 大于 15 : 返回 true"
else
   echo "$a 小于 100 且 $b 大于 15 : 返回 false"
fi
# 10 小于 100 且 20 大于 15 : 返回 true

if [ $a -lt 100 -o $b -gt 100 ]
then
   echo "$a 小于 100 或 $b 大于 100 : 返回 true"
else
   echo "$a 小于 100 或 $b 大于 100 : 返回 false"
fi
# 10 小于 100 或 20 大于 100 : 返回 true

if [ $a -lt 5 -o $b -gt 100 ]
then
   echo "$a 小于 5 或 $b 大于 100 : 返回 true"
else
   echo "$a 小于 5 或 $b 大于 100 : 返回 false"
fi
# 10 小于 5 或 20 大于 100 : 返回 false

# 逻辑运算符
# ------------------------------------------------------------------------
# 运算符   说明          举例
# ------------------------------------------------------------------------
# &&    逻辑的 AND [[ $a -lt 100 && $b -gt 100 ]] 返回 false
# ||    逻辑的 OR      [[ $a -lt 100 || $b -gt 100 ]] 返回 true
# ------------------------------------------------------------------------

a=10
b=20

if [[ $a -lt 100 && $b -gt 100 ]]
then
   echo "返回 true"
else
   echo "返回 false"
fi
# 返回 false

if [[ $a -lt 100 || $b -gt 100 ]]
then
   echo "返回 true"
else
   echo "返回 false"
fi
# 返回 true

# 字符串运算符
# ------------------------------------------------------------------------
# 运算符   说明                                  举例
# ------------------------------------------------------------------------
# =     检测两个字符串是否相等，相等返回 true。     [ $a = $b ] 返回 false。
# !=    检测两个字符串是否相等，不相等返回 true。   [ $a != $b ] 返回 true。
# -z    检测字符串长度是否为0，为0返回 true。      [ -z $a ] 返回 false。
# -n    检测字符串长度是否为0，不为0返回 true。     [ -n "$a" ] 返回 true。
# str   检测字符串是否为空，不为空返回 true。       [ $a ] 返回 true。
# ------------------------------------------------------------------------

a="abc"
b="efg"

if [ $a = $b ]
then
   echo "$a = $b : a 等于 b"
else
   echo "$a = $b: a 不等于 b"
fi
# abc = efg: a 不等于 b

if [ $a != $b ]
then
   echo "$a != $b : a 不等于 b"
else
   echo "$a != $b: a 等于 b"
fi
# abc != efg : a 不等于 b

if [ -z $a ]
then
   echo "-z $a : 字符串长度为 0"
else
   echo "-z $a : 字符串长度不为 0"
fi
# -z abc : 字符串长度不为 0

if [ -n "$a" ]
then
   echo "-n $a : 字符串长度不为 0"
else
   echo "-n $a : 字符串长度为 0"
fi
# -n abc : 字符串长度不为 0

if [ $a ]
then
   echo "$a : 字符串不为空"
else
   echo "$a : 字符串为空"
fi
# abc : 字符串不为空

# 文件测试运算符
# ------------------------------------------------------------------------
# 操作符       说明                                              举例
# ------------------------------------------------------------------------
# -b file   检测文件是否是块设备文件，如果是，则返回 true。          [ -b $file ] 返回 false。
# -c file   检测文件是否是字符设备文件，如果是，则返回 true。        [ -c $file ] 返回 false。
# -d file   检测文件是否是目录，如果是，则返回 true。               [ -d $file ] 返回 false。
# -f file   检测文件是否是普通文件（既不是目录，也不是设备文件），如果是，则返回 true。    [ -f $file ] 返回 true。
# -g file   检测文件是否设置了 SGID 位，如果是，则返回 true。        [ -g $file ] 返回 false。
# -k file   检测文件是否设置了粘着位(Sticky Bit)，如果是，则返回 true。  [ -k $file ] 返回 false。
# -p file   检测文件是否是有名管道，如果是，则返回 true。            [ -p $file ] 返回 false。
# -u file   检测文件是否设置了 SUID 位，如果是，则返回 true。        [ -u $file ] 返回 false。
# -r file   检测文件是否可读，如果是，则返回 true。                 [ -r $file ] 返回 true。
# -w file   检测文件是否可写，如果是，则返回 true。                 [ -w $file ] 返回 true。
# -x file   检测文件是否可执行，如果是，则返回 true。               [ -x $file ] 返回 true。
# -s file   检测文件是否为空（文件大小是否大于0），不为空返回 true。   [ -s $file ] 返回 true。
# -e file   检测文件（包括目录）是否存在，如果是，则返回 true。       [ -e $file ] 返回 true。
# ------------------------------------------------------------------------

file="./learn.bash"

if [ -r $file ]
then
   echo "文件可读"
else
   echo "文件不可读"
fi
# 文件可读

if [ -w $file ]
then
   echo "文件可写"
else
   echo "文件不可写"
fi
# 文件可写

if [ -x $file ]
then
   echo "文件可执行"
else
   echo "文件不可执行"
fi
# 文件可执行

if [ -f $file ]
then
   echo "文件为普通文件"
else
   echo "文件为特殊文件"
fi
# 文件为普通文件

if [ -d $file ]
then
   echo "文件是个目录"
else
   echo "文件不是个目录"
fi
# 文件不是个目录

if [ -s $file ]
then
   echo "文件不为空"
else
   echo "文件为空"
fi
# 文件不为空

if [ -e $file ]
then
   echo "文件存在"
else
   echo "文件不存在"
fi
# 文件存在

# ------------------------------------------------------------------------
# printf 命令
# printf 命令的语法:
# printf  format-string  [arguments...]
# 参数说明:
#   format-string: 为格式控制字符串
#   arguments: 为参数列表。
# ------------------------------------------------------------------------

printf "Hello, Shell\n"     # Hello, Shell
printf "%-10s %-8s %-4s\n" 姓名 性别 体重kg
printf "%-10s %-8s %-4.2f\n" 郭靖 男 66.1234
printf "%-10s %-8s %-4.2f\n" 杨过 男 48.6543
printf "%-10s %-8s %-4.2f\n" 郭芙 女 47.9876
# %s %c %d %f都是格式替代符
# %d %s %c %f 格式替代符详解:
#   d: Decimal 十进制整数 -- 对应位置参数必须是十进制整数，否则报错！
#   s: String 字符串 -- 对应位置参数必须是字符串或者字符型，否则报错！
#   c: Char 字符 -- 对应位置参数必须是字符串或者字符型，否则报错！
#   f: Float 浮点 -- 对应位置参数必须是数字型，否则报错！
# %-10s 指一个宽度为10个字符（-表示左对齐，没有则表示右对齐），任何字符都会被显示在10个字符宽的字符内，如果不足则自动以空格填充，超过也会将内容全部显示出来。
# %-4.2f 指格式化为小数，其中.2指保留2位小数。

# format-string为双引号
printf "%d %s\n" 1 "abc"
# 1 abc

# 单引号与双引号效果一样
printf '%d %s\n' 1 "abc"
# 1 abc

# 没有引号也可以输出
printf %s abcdef
# abcdef

# 格式只指定了一个参数，但多出的参数仍然会按照该格式输出，format-string 被重用
printf %s abc def
# abcdef

printf "%s\n" abc def
# abc
# def

printf "%s %s %s\n" a b c d e f g h i j
# a b c
# d e f
# g h i
# j

# 如果没有 arguments，那么 %s 用NULL代替，%d 用 0 代替
printf "%s and %d \n"
#  and 0

# printf的转义序列
# ------------------------------------------------------------------------
# 序列    说明
# ------------------------------------------------------------------------
# \a    警告字符，通常为ASCII的BEL字符
# \b    后退
# \c    抑制（不显示）输出结果中任何结尾的换行字符（只在%b格式指示符控制下的参数字符串中有效），而且，任何留在参数里的字符、任何接下来的参数以及任何留在格式字符串中的字符，都被忽略
# \f    换页（formfeed）
# \n    换行
# \r    回车（Carriage return）
# \t    水平制表符
# \v    垂直制表符
# \\    一个字面上的反斜杠字符
# \ddd  表示1到3位数八进制值的字符。仅在格式字符串中有效
# \0ddd 表示1到3位的八进制值字符
# ------------------------------------------------------------------------

# ------------------------------------------------------------------------
# test 命令
# Shell中的 test 命令用于检查某个条件是否成立，它可以进行数值、字符和文件三个方面的测试。
# ------------------------------------------------------------------------

# 数值测试
# ------------------------------------------------------------------------
# 参数    说明
# ------------------------------------------------------------------------
# -eq   等于则为真
# -ne   不等于则为真
# -gt   大于则为真
# -ge   大于等于则为真
# -lt   小于则为真
# -le   小于等于则为真
# ------------------------------------------------------------------------

num1=100
num2=100
if test $[num1] -eq $[num2]
then
    echo '两个数相等！'
else
    echo '两个数不相等！'
fi
# 两个数相等！

# 代码中的 [] 执行基本的算数运算，如:
a=5
b=6

result=$[a+b] # 注意等号两边不能有空格
echo "result 为: $result"
# result 为: 11

# 字符串测试
# ------------------------------------------------------------------------
# 参数        说明
# ------------------------------------------------------------------------
# =         等于则为真
# !=        不相等则为真
# -z 字符串    字符串的长度为零则为真
# -n 字符串    字符串的长度不为零则为真

str1="hello"
str2="hello"
if test $str1 = $str2
then
    echo '两个字符串相等!'
else
    echo '两个字符串不相等!'
fi
# 两个字符串相等!

# 文件测试
# ------------------------------------------------------------------------
# 参数        说明
# ------------------------------------------------------------------------
# -e 文件名    如果文件存在则为真
# -r 文件名    如果文件存在且可读则为真
# -w 文件名    如果文件存在且可写则为真
# -x 文件名    如果文件存在且可执行则为真
# -s 文件名    如果文件存在且至少有一个字符则为真
# -d 文件名    如果文件存在且为目录则为真
# -f 文件名    如果文件存在且为普通文件则为真
# -c 文件名    如果文件存在且为字符型特殊文件则为真
# -b 文件名    如果文件存在且为块特殊文件则为真
# ------------------------------------------------------------------------

cd /bin
if test -e ./bash
then
    echo '文件已存在!'
else
    echo '文件不存在!'
fi
# 文件已存在!

# 另外，Shell还提供了与( -a )、或( -o )、非( ! )三个逻辑操作符用于将测试条件连接起来，其优先级为: "!"最高，"-a"次之，"-o"最低。例如:
cd /bin
if test -e ./notFile -o -e ./bash
then
    echo '至少有一个文件存在!'
else
    echo '两个文件都不存在'
fi
# 至少有一个文件存在!

# ------------------------------------------------------------------------
# 流程控制
# ------------------------------------------------------------------------

# if
# ------------------------------------------------------------------------
# if 语句语法格式:
#
# if condition
# then
#    command1
#    command2
#    ...
#    commandN
# fi

# 写成一行（适用于终端命令提示符）
if [ $(ps -ef | grep -c "ssh") -gt 1 ]; then echo "true"; fi

# if else
# ------------------------------------------------------------------------
# if else 语法格式:
#
# if condition
# then
#    command1
#    command2
#    ...
#    commandN
# else
#    command
# fi

# if else-if else
# ------------------------------------------------------------------------
# if else-if else 语法格式:
#
# if condition1
# then
#    command1
# elif condition2
# then
#    command2
# else
#    commandN
# fi

a=10
b=20
if [ $a == $b ]
then
   echo "a 等于 b"
elif [ $a -gt $b ]
then
   echo "a 大于 b"
elif [ $a -lt $b ]
then
   echo "a 小于 b"
else
   echo "没有符合的条件"
fi
# a 小于 b

# if else语句经常与test命令结合使用
num1=$[2*3]
num2=$[1+5]
if test $[num1] -eq $[num2]
then
    echo '两个数字相等!'
else
    echo '两个数字不相等!'
fi
# 两个数字相等!

# for 循环
# ------------------------------------------------------------------------
# for循环一般格式为:
#
# for var in item1 item2 ... itemN
# do
#    command1
#    command2
#    ...
#    commandN
# done

# 写成一行
# for var in item1 item2 ... itemN; do command1; command2… done;

for loop in 1 2 3 4 5
do
    echo "The value is: $loop"
done
# The value is: 1
# The value is: 2
# The value is: 3
# The value is: 4
# The value is: 5

# 顺序输出字符串中的字符
for str in 'This is a string'
do
    echo $str
done
# This is a string

# while 语句
# ------------------------------------------------------------------------
# while循环用于不断执行一系列命令，也用于从输入文件中读取数据；命令通常为测试条件。其格式为:
# while condition
# do
#    command
# done

int=1
while(( $int<3 ))
do
    echo $int
    let "int++"
done
# 1
# 2

# 无限循环
# ------------------------------------------------------------------------
# 无限循环语法格式:
#
# while :
# do
#    command
# done
# 或者
#
# while true
# do
#    command
# done
# 或者
#
# for (( ; ; ))

# until 循环
# ------------------------------------------------------------------------
# until 循环执行一系列命令直至条件为 true 时停止。
# until 循环与 while 循环在处理方式上刚好相反。
# 一般 while 循环优于 until 循环，但在某些时候—也只是极少数情况下，until 循环更加有用。
# until 语法格式:
#
# until condition
# do
#    command
# done

a=0

until [ ! $a -lt 3 ]
do
   echo $a
   a=`expr $a + 1`
done
# 0
# 1
# 2

# case
# ------------------------------------------------------------------------
# Shell case语句为多选择语句。可以用case语句匹配一个值与一个模式，如果匹配成功，执行相匹配的命令。
# case语句格式如下:
#
# case 值 in
# 模式1)
#    command1
#    command2
#    ...
#    commandN
#    ;;
# 模式2）
#    command1
#    command2
#    ...
#    commandN
#    ;;
# esac

# case工作方式如上所示。取值后面必须为单词in，每一模式必须以右括号结束。取值可以为变量或常数。匹配发现取值符合某一模式后，其间所有命令开始执行直至 ;;。
#
# 取值将检测匹配的每一个模式。一旦模式匹配，则执行完匹配模式相应命令后不再继续其他模式。如果无一匹配模式，使用星号 * 捕获该值，再执行后面的命令。

# 下面的脚本提示输入1到4，与每一种模式进行匹配:
echo '输入 1 到 4 之间的数字: '
echo '你输入的数字为: '
aNum=1
case $aNum in
    1)  echo '你选择了 1'
    ;;
    2)  echo '你选择了 2'
    ;;
    3)  echo '你选择了 3'
    ;;
    4)  echo '你选择了 4'
    ;;
    *)  echo '你没有输入 1 到 4 之间的数字'
    ;;
esac

# 跳出循环
# ------------------------------------------------------------------------
# 在循环过程中，有时候需要在未达到循环结束条件时强制跳出循环，Shell使用两个命令来实现该功能: break和continue。

# break命令
# ------------------------------------------------------------------------
# break命令允许跳出所有循环（终止执行后面的所有循环）。
while :
do
    echo -n "输入 1 到 5 之间的数字: "
    aNum=6
    case $aNum in
        1|2|3|4|5) echo "你输入的数字为 $aNum!"
        ;;
        *) echo "你输入的数字不是 1 到 5 之间的! 游戏结束"
        break
        ;;
    esac
done

# continue
# ------------------------------------------------------------------------
# continue命令与break命令类似，只有一点差别，它不会跳出所有循环，仅仅跳出当前循环。
while :
do
    echo -n "输入 1 到 5 之间的数字: "
    aNum=3
    case $aNum in
        1|2|3|4|5) echo "你输入的数字为 $aNum!"
        break
        ;;
        *) echo "你输入的数字不是 1 到 5 之间的!"
            continue
            echo "游戏结束"
        ;;
    esac
done

# esac
# ------------------------------------------------------------------------
# case的语法和C family语言差别很大，它需要一个esac（就是case反过来）作为结束标记，
# 每个case分支用右圆括号，用两个分号表示break。

# ------------------------------------------------------------------------
# 函数
# ------------------------------------------------------------------------
# shell中函数的定义格式如下:
#
# [ function ] funname [()]
#
# {
#
#    action;
#
#    [return int;]
#
# }
# 说明:
# 1、可以带function fun() 定义，也可以直接fun() 定义,不带任何参数。
# 2、参数返回，可以显示加: return 返回，如果不加，将以最后一条命令运行结果，作为返回值。 return后跟数值n(0-255

demoFun() {
    echo "这是我的第一个 shell 函数!"
}
echo "-----函数开始执行-----"
demoFun
echo "-----函数执行完毕-----"

funWithReturn() {
    echo "这个函数会对输入的两个数字进行相加运算..."
    echo "输入第一个数字: "
    aNum=1
    echo "输入第二个数字: "
    anotherNum=2
    echo "两个数字分别为 $aNum 和 $anotherNum !"
    return $(($aNum+$anotherNum))
}
funWithReturn
echo "输入的两个数字之和为 $? !"

# 函数参数
# 在Shell中，调用函数时可以向其传递参数。
# 在函数体内部，通过 $n 的形式来获取参数的值，
# 例如，$1表示第一个参数，$2表示第二个参数...
funWithParam(){
    echo "第一个参数为 $1 !"
    echo "第二个参数为 $2 !"
    #注意，$10 不能获取第十个参数，获取第十个参数需要${10}。当n>=10时，需要使用${n}来获取参数。
    echo "第十个参数为 $10 !"
    echo "第十个参数为 ${10} !"
    echo "第十一个参数为 ${11} !"
    echo "参数总数有 $# 个!"
    echo "作为一个字符串输出所有参数 $* !"
}
funWithParam 1 2 3 4 5 6 7 8 9 34 73

# 特殊字符
# ------------------------------------------------------------------------
# 参数处理  说明
# ------------------------------------------------------------------------
# $#        传递到脚本的参数个数
# $*        以一个单字符串显示所有向脚本传递的参数
# $$        脚本运行的当前进程ID号
# $!        后台运行的最后一个进程的ID号
# $@        与$*相同，但是使用时加引号，并在引号中返回每个参数。
# $-        显示Shell使用的当前选项，与set命令功能相同。
# $?        显示最后命令的退出状态。0表示没有错误，其他任何值表明有错误。
# ------------------------------------------------------------------------

# ------------------------------------------------------------------------
# 输入/输出重定向
# ------------------------------------------------------------------------
# 大多数 UNIX 系统命令从你的终端接受输入并将所产生的输出发送回​​到您的终端。
# 一个命令通常从一个叫标准输入的地方读取输入，默认情况下，这恰好是你的终端。
# 同样，一个命令通常将其输出写入到标准输出，默认情况下，这也是你的终端。
# ------------------------------------------------------------------------

# 重定向命令列表如下
# ------------------------------------------------------------------------
# 命令                说明
# ------------------------------------------------------------------------
# command > file    将输出重定向到 file。
# command < file    将输入重定向到 file。
# command >> file   将输出以追加的方式重定向到 file。
# n > file          将文件描述符为 n 的文件重定向到 file。
# n >> file         将文件描述符为 n 的文件以追加的方式重定向到 file。
# n >& m            将输出文件 m 和 n 合并。
# n <& m            将输入文件 m 和 n 合并。
# << tag            将开始标记 tag 和结束标记 tag 之间的内容作为输入。
# ------------------------------------------------------------------------
# 需要注意的是文件描述符 0 通常是标准输入（STDIN），1 是标准输出（STDOUT），2 是标准错误输出（STDERR）。

# 输出重定向
# ------------------------------------------------------------------------
# 重定向一般通过在命令间插入特定的符号来实现。
# 特别的，这些符号的语法如下所示:
# command1 > file1
# 上面这个命令执行command1然后将输出的内容存入file1。
# 注意任何file1内的已经存在的内容将被新内容替代。如果要将新内容添加在文件末尾，请使用>>操作符。

# 执行下面的 who 命令，它将命令的完整的输出重定向在用户文件中(userfile)
# who > userfile
# 执行后，并没有在终端输出信息，这是因为输出已被从默认的标准输出设备（终端）重定向到指定的文件。

# 输入重定向
# ------------------------------------------------------------------------
# 和输出重定向一样，Unix 命令也可以从文件获取输入，语法为:
# command1 < file1
# 这样，本来需要从键盘获取输入的命令会转移到文件读取内容。
# 注意: 输出重定向是大于号(>)，输入重定向是小于号(<)。

# 接着以上实例，我们需要统计 users 文件的行数,执行以下命令:
# wc -l userfile
#       2 userfile

# 也可以将输入重定向到 users 文件:
# wc -l < userfile
#        2

# command1 < infile > outfile
# 同时替换输入和输出，执行command1，从文件infile读取内容，然后将输出写入到outfile中。

# 重定向深入讲解
# ------------------------------------------------------------------------
# 一般情况下，每个 Unix/Linux 命令运行时都会打开三个文件:
#   标准输入文件(stdin): stdin的文件描述符为0，Unix程序默认从stdin读取数据。
#   标准输出文件(stdout): stdout 的文件描述符为1，Unix程序默认向stdout输出数据。
#   标准错误文件(stderr): stderr的文件描述符为2，Unix程序会向stderr流中写入错误信息。
# 默认情况下，command > file 将 stdout 重定向到 file，command < file 将stdin 重定向到 file。

# 如果希望 stderr 重定向到 file，可以这样写:
# $ command 2 > file

# 如果希望 stderr 追加到 file 文件末尾，可以这样写:
# $ command 2 >> file
# 2 表示标准错误文件(stderr)。

# 如果希望将 stdout 和 stderr 合并后重定向到 file，可以这样写:
# $ command > file 2>&1
# 或者
# $ command >> file 2>&1

# 如果希望对 stdin 和 stdout 都重定向，可以这样写:
# $ command < file1 >file2
# command 命令将 stdin 重定向到 file1，将 stdout 重定向到 file2。

# Here Document
# ------------------------------------------------------------------------
# Here Document 是 Shell 中的一种特殊的重定向方式，用来将输入重定向到一个交互式 Shell 脚本或程序。
# 它的基本的形式如下:
# command << delimiter
#     document
# delimiter
# 它的作用是将两个 delimiter 之间的内容(document) 作为输入传递给 command。
# 注意:
# 结尾的delimiter 一定要顶格写，前面不能有任何字符，后面也不能有任何字符，包括空格和 tab 缩进。
# 开始的delimiter前后的空格会被忽略掉。

# 在命令行中通过 wc -l 命令计算 Here Document 的行数:
wc -l << EOF
    Hello
    world
EOF
#        2

# 也可以将 Here Document 用在脚本中，例如:
cat << EOF
    Hello
    world
EOF
#     Hello
#     world

# /dev/null 文件
# ------------------------------------------------------------------------
# 如果希望执行某个命令，但又不希望在屏幕上显示输出结果，那么可以将输出重定向到 /dev/null:
# $ command > /dev/null
# /dev/null 是一个特殊的文件，写入到它的内容都会被丢弃；
# 如果尝试从该文件读取内容，那么什么也读不到。
# 但是 /dev/null 文件非常有用，将命令的输出重定向到它，会起到"禁止输出"的效果。
# 如果希望屏蔽 stdout 和 stderr，可以这样写:
# $ command > /dev/null 2>&1
# 注意: 0 是标准输入（STDIN），1 是标准输出（STDOUT），2 是标准错误输出（STDERR）。

# ------------------------------------------------------------------------
# 文件包含
# ------------------------------------------------------------------------
# Shell 也可以包含外部脚本。这样可以很方便的封装一些公用的代码作为一个独立的文件。
# Shell 文件包含的语法格式如下:
# . filename   # 注意点号(.)和文件名中间有一空格
# 或
# source filename
# 注: 被包含的文件 filename 不需要可执行权限。

# ------------------------------------------------------------------------
# Linux 命令大全
# ------------------------------------------------------------------------

# 1、文件管理
# ------------------------------------------------------------------------
# cat           chattr          chgrp           chmod
# chown         cksum           cmp             diff
# diffstat      file            find            git
# gitview       indent          cut             ln
# less          locate          lsattr          mattrib
# mc            mdel            mdir            mktemp
# more          mmove           mread           mren
# mtools        mtoolstest      mv              od
# paste         patch           rcp             rm
# slocate       split           tee             tmpwatch
# touch         umask           which           cp
# whereis       mcopy           mshowfat        rhmask
# scp           awk             read

# 2、文档编辑
# ------------------------------------------------------------------------
# col           colrm           comm            csplit
# ed            egrep           ex              fgrep
# fmt           fold            grep            ispell
# jed           joe             join            look
# mtype         pico            rgrep           sed
# sort          spell           tr              expr
# uniq          wc              let

# 3、文件传输
# ------------------------------------------------------------------------
# lprm          lpr             lpq             lpd
# bye           ftp             uuto            uupick
# uucp          uucico          tftp            ncftp
# ftpshut       ftpwho          ftpcount

# 4、磁盘管理
# ------------------------------------------------------------------------
# cd            df              dirs            du
# edquota       eject           mcd             mdeltree
# mdu           mkdir           mlabel          mmd
# mrd           mzip            pwd             quota
# mount         mmount          rmdir           rmt
# stat          tree            umount          ls
# quotacheck    quotaoff        lndir           repquota
# quotaon

# 5、磁盘维护
# ------------------------------------------------------------------------
# badblocks     cfdisk          dd              e2fsck
# ext2ed        fsck            fsck.minix      fsconf
# fdformat      hdparm          mformat         mkbootdisk
# mkdosfs       mke2fs          mkfs.ext2       mkfs.msdos
# mkinitrd      mkisofs         mkswap          mpartition
# swapon        symlinks        sync            mbadblocks
# mkfs.minix    fsck.ext2       fdisk           losetup
# mkfs          sfdisk          swapoff

# 6、网络通讯
# ------------------------------------------------------------------------
# apachectl     arpwatch        dip             getty
# mingetty      uux             telnet          uulog
# uustat        ppp-off         netconfig       nc
# httpd         ifconfig        minicom         mesg
# dnsconf       wall            netstat         ping
# pppstats      samba           setserial       talk
# traceroute    tty             newaliases      uuname
# netconf       write           statserial      efax
# pppsetup      tcpdump         ytalk           cu
# smbd          testparm        smbclient       shapecfg

# 7、系统管理
# ------------------------------------------------------------------------
# adduser       chfn            useradd         date
# exit          finger          fwhios          sleep
# suspend       groupdel        groupmod        halt
# kill          last            lastb           login
# logname       logout          ps              nice
# procinfo      top             pstree          reboot
# rlogin        rsh             sliplogin       screen
# shutdown      rwho            sudo            gitps
# swatch        tload           logrotate       uname
# chsh          userconf        userdel         usermod
# vlock         who             whoami          whois
# newgrp        renice          su              skill
# w             id              free

# 8、系统设置
# ------------------------------------------------------------------------
# reset         clear           alias           dircolors
# aumix         bind            chroot          clock
# crontab       declare         depmod          dmesg
# enable        eval            export          pwunconv
# grpconv       rpm             insmod          kbdconfig
# lilo          liloconfig      lsmod           minfo
# set           modprobe        ntsysv          mouseconfig
# passwd        pwconv          rdate           resize
# rmmod         grpunconv       modinfo         time
# setup         sndconfig       setenv          setconsole
# timeconfig    ulimit          unset           chkconfig
# apmd          hwclock         mkkickstart     fbset
# unalias       SVGATextMode

# 9、备份压缩
# ------------------------------------------------------------------------
# ar            bunzip2         bzip2           bzip2recover
# gunzip        unarj           compress        cpio
# dump          uuencode        gzexe           gzip
# lha           restore         tar             uudecode
# unzip         zip             zipinfo

# 10、设备管理
# ------------------------------------------------------------------------
# setleds       loadkeys        rdev            dumpkeys
# MAKEDEV

