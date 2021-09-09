#!/bin/bash
MYSQL_ROOT_PASSWORD='@Sistemas2021' # SET THIS! Avoid quotes/apostrophes in the password, but do use lowercase + uppercase + numbers + special chars

# Install MySQL
echo debconf mysql-server/root_password password $MYSQL_ROOT_PASSWORD | sudo debconf-set-selections
echo debconf mysql-server/root_password_again password $MYSQL_ROOT_PASSWORD | sudo debconf-set-selections
sudo apt-get -qq install mysql-server expect # > /dev/null # Install MySQL quietly

echo "MySQL Root Password: $MYSQL_ROOT_PASSWORD\r"

sudo apt-get update > /dev/null
# Build Expect script
tee ~/secure_our_mysql.sh > /dev/null << EOF
spawn $(which mysql_secure_installation)
expect "Enter password for user root:"
send "$MYSQL_ROOT_PASSWORD\r"

expect "Press y|Y for Yes, any other key for No:"
send "n\r"

expect "Please enter 0 = LOW, 1 = MEDIUM and 2 = STRONG:"
send "0\r"

expect "Change the password for root ? ((Press y|Y for Yes, any other key for No) :"
send "y\r"

expect "New password:"
send "$MYSQL_ROOT_PASSWORD\r"

expect "Re-enter new password:"
send "$MYSQL_ROOT_PASSWORD\r"

expect "Remove anonymous users? (Press y|Y for Yes, any other key for No) :"
send "y\r"

expect "Disallow root login remotely? (Press y|Y for Yes, any other key for No) :"
send "y\r"

expect "Remove test database and access to it? (Press y|Y for Yes, any other key for No) :"
send "y\r"

expect "Reload privilege tables now? (Press y|Y for Yes, any other key for No) :"
send "y\r"

EOF

# Run Expect script.
# This runs the "mysql_secure_installation" script which removes insecure defaults.
sudo expect ~/secure_our_mysql.sh

sudo service mysql start

sh initDB.sh