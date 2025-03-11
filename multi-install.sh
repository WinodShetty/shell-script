#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)

LOGS_FOLDER="/var/log/shell-script-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

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

echo "Script started executing at: $TIMESTAMP"

if [ $USERID -ne 0 ]
 then 
   echo "error: you must have sudo access to excute this script"
   exit 1
fi

for package in $@ 
    do
        dnf list installed $package &>>$LOG_FILE_NAME
        if [ $? -ne 0 ]
            then
            VALIDATE $? "Installing $package"
        else
            echo -e "$package is $Y already installed $N"
    done
fi