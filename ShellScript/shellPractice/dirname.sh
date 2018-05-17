#!/bin/sh

## 
# dirname
##

# output "/usr"
dirname /usr/bin/sort

# output "dir1" followed by"dir2"
dirname dir1/str dir2/str

# output "."
dirname stdio.h


# 获取当前脚本所在文件夹路径
shellPath=$(cd "$(dirname "$0")"; pwd)
echo "Current script path: $shellPath"
