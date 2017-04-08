#!/bin/sh
#test for if

sperator='========================================='

exec 9>&2
exec 2>error.log

#当if之后的命令，返回状态值为0,才执行then后的命令，
if date
then 
    echo "hello shell"
fi

echo $sperator

if date; then
    echo "hello valjean"
fi 
	
echo $sperator

if valjean; then
    echo "hello hao"
fi 

echo $sperator
#if 命令与test命令结合后，可以测试数值、字符串、文件、文件夹，
#数值

if [ 1 -lt 2  ]; then 
echo "1 <2"
fi 
# (()) 是shell提供的高级数学表达式，这样可以不用转义字符，而且还支持一些高级功能 
if (( 2 > 1  )); then 
    echo 'success'
fi

echo $sperator

#字符串
if [ 'hao' = 'hao' ];then
    echo "hahah"
fi

#高级字符串处理，可以利用正则
if [[ $USER == 'ha?' ]];then 
    echo 'hao is hao '
else 
    echo $HOME
fi


echo $sperator
# 这个> < 必须进行转义，否则当成重定向符号处理

if [ 'hao' \< 'hxn' ];then
    echo "is wrong"
fi

if [ -n 'hao' ]; then 
    echo "this string is not empty"
fi 

if [ -z '' ];then
    echo 'this is null string'
fi

echo $sperator

#文件/文件夹,在遍历目录的时候加以练习

if [ -d $HOME ];then
    echo $HOME  
fi

exec 2>&9
exec 9>&-
