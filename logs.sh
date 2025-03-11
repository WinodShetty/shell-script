#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)

LOGS_FOLDER="/var/log/shell-script-logs"
LOG_FILE=$(echo $0 | cut "." -f1)
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

dnf list installed mysql &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
   then
      dnf install mysql -y &>>$LOG_FILE_NAME
      VALIDATE $? "Installing MySQL"

   
else
   echo -e "$Y MySQL is already installed $N"

fi

dnf list installed  git &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
      then 
         dnf install git -y &>>$LOG_FILE_NAME
        VALIDATE $? "Installing Git"
else
   echo -e "$Y Git is already installed $N"
fi
   
    

 

