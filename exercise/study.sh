#!/bin/bash
#this shell for study node 

#for
function func_for(){
echo "=======================for  ========================"
for var in a b c d  e f g 
do 
    echo $var 

done 


for (( i=0;i<5;i++ )) 
do
    echo $i
done 


}


#while 
function func_while(){
echo "=======================while ========================"

w=0

while [ $w -le 5 ] 
do
    echo $w
    w=$[ $w + 1 ]
    #w=$(($w+1))
done 


#while :
#do
    #printf  "this is dead loop \n"
    #sleep 3 
#done 
}

#until 
function func_until(){
echo "=======================until ========================"
u=0
until 
    echo "i am until "
    #test $u -gt  8
    [ $u -ge 0 ]
do
    echo "this is until "
    sleep 3 
    u=$[ $u + 1 ] 

done 

}

#case 
function func_case(){
echo "=======================case ========================"
case $1 in 
    pwd)
        echo   `pwd` ;;
    ls) 
        ls -l ;;
    *) 
        echo '$1 no value';;
esac
}
#if 
function func_if(){
echo "=======================if   ========================"
if test $# -gt 2 ;then 
    echo $@
fi

if [ $1 -gt 3 ]; then 
    echo -n '$1 value is '
    echo $1
fi

if test true 
then 
    echo "this true"
fi

if [ true ] 
then 
    echo "this 2 true"
fi


if [ 0 -gt 1 ]
then 
    echo "this false"
else
    echo "this false false "
fi

if [ 0 -gt 1 ] 
then
    echo "this is false "
elif [ 0 -lt 1 ] 
then 
    echo "this is true"
fi
}

#array 
function array(){
echo "=======================array ========================"
store=(9 8 7 6 5 4 3 2 1)
i=0
while [ $i -lt 5 ] 
do
    echo ${store[$i]}
    #i=$[ $i + 1 ]
    let i=i+1
done

sum=${#store[*]}
echo "the array sum is $sum" 
len=${#store[1]}
echo "the array of index is 1 len is $len"

echo "the array all value ${store[@]}"
}


#variable 
function variable()
{
echo "=======================variable ========================"

echo -n 's# is '
echo $# 

while [ $# -gt 0 ]
do
    #echo $1
    echo $*
    shift 
done 
}


#select 
function func_select(){
echo "=======================select   ========================"

select s in func_while func_if func_case func_for func_until array variable 
do
    case $s in 
        func_while)
                func_while;;
        func_if)
                func_if;;
        func_case)
                func_case;;
        func_for)
                func_for;;
        func_until)
                func_until;;
        array)
                array;;
        variable)
                variable;;
            *) echo "=====end";;
    esac
done
    


}
#other 
#getopts
func_getopt()
{
   echo "this is function is nousage" 

}

#function 

echo "=======================fuction  ========================"

if [ $# -lt 4 ];then 
     echo "USAGE: ./$0 -l http://xxx/live.m3u8 -o 输出路径"
     exit
fi

while getopts :l:o: opt
do
    case  $opt  in 
        l) M3U8_URL=$OPTARG;;
        o) OUTPUT_DIR=$OPTARG;;
        *) echo "USAGE: $0 -l http://xxx/live.m3u8 -o 输出路径"
            exit ;; 
    esac
done

echo "addr :   $M3U8_URL"
echo "outdir  $OUTPUT_DIR"
