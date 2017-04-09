#!/bin/bash
#iterate though all the files in adirectory

for file in /home/hzj/workspace/git/bro/exercise/2/data/2017/02/*
do   
 #echo $file is a file

cat $file | awk  '{print $3 ,$5}'n | sed -n 's/=/ /gp' | cut -d ' ' -f 1,6

done