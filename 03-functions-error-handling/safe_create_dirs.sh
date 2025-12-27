#!/bin/bash
set -e #If ANY command fails → script stops immediately


mkdir testdir

if [ $? -eq 0 ]
then
    echo "Directory created successfully"
else
    echo "Failed to create directory"
    exit 1
fi


create_dir() {
    mkdir -p "$1"
    echo "Directory $1 ready"
} 
