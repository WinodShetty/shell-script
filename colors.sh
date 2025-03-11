#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"

USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
      then 
         echo -e "$2.....$R failure"
         exit 1
   else
      echo -e "$2 .... $G success"
   fi
}

if [ $USERID -ne 0 ]
 then 
   echo "error: you must have sudo access to excute this script"
   exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]
   then
      dnf install mysql -y
      VALIDATE $? "Installing MySQL"

   
else
   echo -e "$Y MySQL is already installed"

fi

dnf list installed  git

if [ $? -ne 0 ]
      then 
         dnf install git -y
        VALIDATE $? "Installing Git"
else
   echo -e "$Y Git is already installed"
fi
   
    

 

