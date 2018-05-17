#!/bin/sh

# 功能：test

# test -z string: string 为空
# test -n string：string 不为空
if test -z $*; then
  echo "Input empty!"
  exit 0
fi

for argument in $*; do
  echo "Input: $argument"
done

argument1="$1"
argument2="$2"
echo "argument1: $argument1"
echo "argument2: $argument2"

# test
if test $argument1 -eq 10; then
  echo "Input argument1 equal 10."
else 
  echo "Input argument1 not equal 10!"
fi

# [] = test
if [ "$argument2" -eq 20 ]; then
 echo "Input argument2 equal 20."
else 
  echo "Input argument2 not equal 20!"
fi
