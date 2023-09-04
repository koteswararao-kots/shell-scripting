USERID=$(id -u)  #to extract the user id

if [ $USERID -ne 0 ] 
then 
 echo "Error please run with root acess"
 exit 1                                            #1-127 refers to error code, 0 referes to success
fi 

apt install mysql-server -y 

if [ $? -ne 0 ]
then 
    echo "Error, installing packages"
    exit 2 
else 
    echo "Installation of mysql is success"
fi 

apt install postfix -y

if [ $? -ne 0 ]
then 
    echo "Error, installing packages"
    exit 2 
else 
    echo "Installation of postfix is success"
fi 



