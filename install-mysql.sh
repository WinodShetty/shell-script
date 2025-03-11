#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
 then 
   echo "error: you must have sudo access to excute this script"

fi

dnf install mysql -y
dnf install git -y
   # echo $? exit status ni theluskovadaniki. 0 means success, 0 thappa yem vachina its failed
   # exit status ante manam enter chesina last command, last command status
    

 

