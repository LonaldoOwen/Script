#!/bin/sh

##
# 功能：截取字符串(和正则有联系)
# #：最小限度的截取左边；
# ##：最大限度截取左边；
# %：最小限度截取右边；
# %%：最大限度截取右边
#
#
#
#
##



string="https://github.com/LonaldoOwen/Script/tree/master"
echo "string: ${string}"

# 获得字符串长度
length=${#string}
echo "length: ${length}"
# 结果：49


# #：最小限度的截取左边；
# 语法：${parameter#word}（word可以是正则表达式）
# 将github及左边都截掉
substring=${string#*github}
echo "substring: ${substring}"
# 结果：.com/LonaldoOwen/Script/tree/master


# ##：最大限度截取左边；
# 语法：${parameter##word}
# 将最后一个/及之前的所有字符都截取掉
substring2=${string##*/}
echo "substring2: ${substring2}"
# 结果：master


# %：最小限度截取右边；
# 语法：${parameter%word}
# 将最后一个/及右边都截掉；
substring3=${string%/*}
echo "substring3: ${substring3}"
# 结果：https://github.com/LonaldoOwen/Script/tree


# %%：最大限度截取右边
# 语法：${parameter%%word}
# 将第一个/及右边都截掉；
substring4=${string%%/*}
echo "substring4: ${substring4}"
# 结果：https



