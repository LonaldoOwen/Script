#!/bin/sh
#理解本文件夹中的shell命令
# $#: 变量个数
# []: 条件表达式

if [ "$#" != "1" ] && [ "$#" != "2" ] ; then 
	echo "tobuild:          ./pack.sh Debug/Release\r\n" 
	echo "clean and build:  ./pack.sh Debug/Release clean\r\n"
	exit 1; 
fi 

buildtype="$1"
cleantype=""
echo buildtype
echo cleantype