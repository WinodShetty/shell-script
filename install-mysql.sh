#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ] 
 then
 
    echo "error:: you must have sudo acces to execute this script"
    exit 1
    
    
fi
 
 dnf install mysql-server -y

if [ $? -ne 0 ]
 then 
    echo "Installing MySQL ... is failure"
    exit 1
 else 
    echo "installing MySQL ... is success"
fi

