#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
 then 
   echo "error: you must have sudo access to excute this script"
   exit 1
   # echo $? exit status ni theluskovadaniki. 0 means success, 0 thappa yem vachina its failed
   # exit status ante manam enter chesina last command, last command status

fi

dnf list installed mysql

if [ $? -ne 0 ]
   then
      dnf install mysql -y

   if [ $? -ne 0 ]
      then 
         echo "error: installing mysql is .....failure"
         exit 1
   else
      echo "installing mysql is .... success"
   fi
else
   echo "mysql is already .... installed"

fi

dnf list installed  git

if [ $? -ne 0 ]
      then 
         dnf install git -y
         if [ $? -ne 0 ]
            then 
             echo "error: installing git is .... failure"
             exit 1
         else 
            echo " installing git is .... success"
         fi
else
   echo "git is already installed"
fi
   
    

 

