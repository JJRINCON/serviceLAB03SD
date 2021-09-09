#!/bin/bash
mysql -u root -p
expect "Enter password: "
send "@Sistemas2021\r"
source university.sql 
exit;