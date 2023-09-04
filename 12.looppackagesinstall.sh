#!/bin/bash
#sudo sh 12.looppackagesinstall.sh git mongo
USERID=$(id -u)  #to extract the user id

if [ $USERID -ne 0 ] 
then 
 echo "Error please run with root acess"
 exit 1                                            #1-127 refers to error code, 0 referes to success
fi 

DATE=$(date +%F)
SCRIPT=$0
LOGFILE=/tmp/$SCRIPT-$DATE

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"


VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "Error:: $R installing $2 $N"
    else 
        echo "Success $G Installing $2 $N"
    fi 
}

for i in $@ 
do 
    dpkg --list | grep $i >>$LOGFILE
    if [ $? -ne 0 ]
    then 
        echo $i is not installed, lets install it
        apt install $i -y >>$LOGFILE
        VALIDATE $? $i

    else 
        echo "$Y $i is already installed"
    fi 
done
