#!/bin/bash

while [ true ];do

	time=$(date +%r)
	mem_use=$(free -h | grep  'Mem:' | awk '{print$3}')
	disk_use=$(df -h | grep 'sda3' | awk '{print$3}')
	echo "Time : $time , mem use : $mem_use , disk use : $disk_use"
	mem_use=$(echo $mem_use | tr -d [:alpha:])
	mem_use=$(echo "$mem_use * 10" | bc | tr -d [:punct:])
	#Checking the amount of RAM usage
	if [ $mem_use -ge 170 ];then
		killing=$(ps -e | grep 'firefox' | awk '{print$1}')
		memU=$(free | grep  'Mem:' | awk '{print$3}')
		echo "break => mem use : $memU" >> mt.txt
		kill % $killing
	fi

	sleep 1

done


