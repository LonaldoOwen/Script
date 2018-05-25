#!/bin/sh

echo "Hello, specific symbol!"
SEPERATE="======================================"

##
# 功能：specific symbol（特殊符号在shell script中的使用及功能）
# 1、()
# 2、"";''这两个的作用与区别
# 3、
##





# ()
# 1、命令组。括号中的命令将会新开一个子shell顺序执行，所以括号中的变量不能够被脚本余下的部分使用。# 括号中多个命令之间用分号隔开，最后一个命令可以没有分号，各命令和括号之间不必有空格。
# 2、命令替换。等同于`cmd`，shell扫描一遍命令行，发现了$(cmd)结构，便将$(cmd)中的cmd执行一次，得到其标准输出，再将此输出放到原来命令。有些shell不支持，如tcsh。
# 3、用于初始化数组。如：array=(a b c d)

# 命令组，没有新开shell啊？？？（指新开子shell执行括号中的命令，不是新开一个shell窗口）
(echo "cmd1"; echo "cmd2"; pwd)

# { cmd1;cmd2;cmd3}这种执行不了？？？
##{ echo "cmd1"; echo "cmd2"; pwd }
echo ${SEPERATE}


# $(cmd) = $`cmd`（反单引号，不是单引号）
echo $(ls -l)
echo ${SEPERATE}

echo $`ls -l`
echo ${SEPERATE}

echo $(cd $(pwd); ls)
echo ${SEPERATE}


# BASH_SOURCE
echo "${BASH_SOURCE[0]}"
echo "${BASH_SOURCE}"
echo "$(dirname ${BASH_SOURCE[0]})"

# 获取当前script路径
# 命令分解：(cd path; pwd)
CURDIR=$(cd $(dirname ${BASH_SOURCE[0]}); pwd )
echo $CURDIR
echo ${SEPERATE}