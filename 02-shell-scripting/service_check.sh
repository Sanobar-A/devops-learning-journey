#!/bin/bash

echo "Enter service name:"
read SERVICE

if [ -f "$SERVICE.service" ]
then
    echo "Service file exists"
else
    echo "Service file not found"
fi
