#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0]
then
    echo "error: you must have sudo acces to execute this script"
fi

dnf install mysql -y