#!/bin/bash

echo "Enter file name:"
read file

if [ -f "$file" ]
then
    echo "File exists"
else
    echo "File does not exist"
fi


if [ -d logs ]
then
    echo "logs folder exists"
else
    echo "logs folder missing"
fi

if [ ! -d logs ]
then
    mkdir logs
    echo "logs folder created"
else
    echo "logs folder already exists"
fi


