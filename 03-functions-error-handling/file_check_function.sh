#!/bin/bash

Welcome() {
    echo "Welcome $1"
}


#Functions can accept inputs
check_file() {
    if [ -f "$1" ]
    then
        echo "File $1 exists"
    else
        echo "File $1 does not exist"
    fi
}

# can use - echo $?
# it give 0 - success or 1 - 255 -failure
