#!/bin/sh
#理解本文件夹中的shell命令
# $#: 变量个数
# []: 条件表达式


# 判断输入参数个数
if [ "$#" != "1" ] && [ "$#" != "2" ] ; then 
	echo "tobuild:          ./pack.sh Debug/Release\r\n" 
	echo "clean and build:  ./pack.sh Debug/Release clean\r\n"
	exit 1; #标记退出状态
fi 

# 定义变量，接收参数
buildtype="$1"
cleantype=""

if [ "$#" == "1" ]; then
	buildtype="$1"
fi

if [ "$#" == "2" ]; then
	buildtype="$1"
	cleantype="$2"
fi

echo ${buildtype}
echo ${cleantype}

# 判断输入的参数正确性
if [ "${buildtype}" != "Debug" ] && [ "${buildtype}" != "Release" ]; then
	echo "tobuild:          ./pack.sh Debug/Release \r\n" 
	echo "clean and build:  ./pack.sh Debug/Release clean\r\n"
	exit 1;
fi

if [ "$cleantype" != 'clean' ] && [ "$cleantype" != '' ] ; then
	echo "clearn.............."
	echo "clean and build:  ./pack.sh Debug/Release clean\r\n"
	exit 1;
fi

# 定义路径常量（获取当前script所在文件夹的路径）
CURDIR=$(cd $(dirname ${BASH_SOURCE[0]}); pwd )
echo $CURDIR

# 编译路径
buildPath="${CURDIR}/../build"
echo "${buildpath}"