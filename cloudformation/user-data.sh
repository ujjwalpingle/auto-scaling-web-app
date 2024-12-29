#!/bin/bash
yum update -y
yum install -y httpd
service httpd start
chkconfig httpd on
echo "<h1>Auto-Scaling Web App</h1>" > /var/www/html/index.html
