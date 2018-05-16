#!/bin/bash

# 原始脚本
#for f in `ls *.gyb`; do
#    echo "Processing $f"
#    name=${f%.gyb}
##    ../../../utils/gyb -D CMAKE_SIZEOF_VOID_P=8 -o $name $f --line-directive ""
#done


# 练习
for f in `ls *.sh`; do
  echo "Processing $f"
  echo "evaluate 'ls'"
  ls
# 截取字符串，去掉.sh部分
  name=${f%.sh}
  echo $name
#    ../../../utils/gyb -D CMAKE_SIZEOF_VOID_P=8 -o $name $f --line-directive ""
done
