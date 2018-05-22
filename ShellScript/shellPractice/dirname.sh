#!/bin/sh

## 
# 功能：dirname
# Strip last file name component
# 剥离文件的最后一个元素；通常用于获取路径
##

# output "/usr"
dirname /usr/bin/sort

# output "dir1" followed by"dir2"
dirname dir1/str dir2/str

# output "."（“.”表示当前文件路径）
dirname stdio.h


# 获取当前脚本所在文件夹路径
shellPath=$(cd "$(dirname "$0")"; pwd)
echo "Current script path: $shellPath"
