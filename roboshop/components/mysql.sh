#!/bin/bash
component/common.sh

Print "Setup repos"
curl -s -L -o /etc/yum.repos.d/mysql.repo https://raw.githubusercontent.com/roboshop-devops-project/mysql/main/mysql.repo &>>$LOG_FILE
StatCheck $?

Print "Installing mysql"
yum install mysql-community-server -y  &>>$LOG_FILE
StatCheck $?

print "Starting Mysql"
systemctl enable mysqld  &>>$LOG_FILE && systemctl start mysqld  &>>$LOG_FILE
StatCheck $?

#grep temp /var/log/mysqld.log

#mysql_secure_installation

#mysql -uroot -pRoboShop@1

#curl -s -L -o /tmp/mysql.zip "https://github.com/roboshop-devops-project/mysql/archive/main.zip"

# cd /tmp
# unzip mysql.zip
# cd mysql-main
# mysql -u root -pRoboShop@1 <shipping.sql