#!/bin/bash


for file in *.sh
do
	chmod +x "$file"
	echo "Made executable: $file"
done


for i in 1 2 3 4 5
do
	echo "Number : $i"
done


for i in 1 2 3 4 5
do
    if [ "$i" -eq 3 ]
    then
        break
    fi

    echo "Number: $i"
done


for file in *.sh
do
	echo "Scripts found: $file"
done


for dir in logs backup temp
do
    mkdir -p "$dir"
done


count=1

while [ $count -le 5 ]
do
    echo "Count: $count"
    count=$((count+1))
done


for i in 1 2 3 4 5
do
    if [ "$i" -eq 3 ]
    then
        break
    fi

    echo "Number: $i"
done


for i in 1 2 3 4 5
do
    if [ "$i" -eq 3 ]
    then
        continue
    fi

    echo "Number: $i"
done


while ! systemctl is-active nginx
do
    echo "Waiting for nginx..."
    sleep 2
done

echo "Nginx is running"
