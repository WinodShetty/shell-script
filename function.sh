#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
      then 
         echo "$2.....failure"
         exit 1
   else
      echo "$2 .... success"
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
   echo "MySQL is already installed"

fi

dnf list installed  git

if [ $? -ne 0 ]
      then 
         dnf install git -y
        VALIDATE $? "Installing Git"
else
   echo "Git is already installed"
fi
   
    

 

