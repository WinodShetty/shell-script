#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ] 
 then
 
    echo "error:: you must have sudo acces to execute this script"
    exit 1
    
    
fi
 
dnf install mysqld -y

if [ $? -ne 0 ]
 then 
    echo "Installing mysql ... is failure"
    exit 1
 else 
    echo "installing mysql ... is success"
fi

dnf install git