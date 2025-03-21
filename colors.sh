#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
      then 
         echo -e "$2.....$R failure $N" 
         # -e ante color apply avabothund iani chepthunnam
         # $R means text ki red color apply avuthundhi then $N normal color{white},
         # otherwise mottam red color a vastadhi.
         exit 1
         
   else
      echo -e "$2 .... $G success $N"
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
   echo -e "$Y MySQL is already installed $N"

fi

dnf list installed  git

if [ $? -ne 0 ]
      then 
         dnf install git -y
        VALIDATE $? "Installing Git"
else
   echo -e "$Y Git is already installed $N"
fi
   
    

 

