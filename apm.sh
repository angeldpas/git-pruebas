#!/bin/sh
dnf -y install vim bash-completion curl wget telnet nano
dnf -y install httpd
systemctl start httpd
systemctl enable httpd
firewall-cmd --add-service={http,https} --permanent
firewall-cmd --reload
dnf -y install php php-cli php-php-gettext php-mbstring php-mcrypt php-mysqlnd php-pear php-curl php-gd php-xml php-bcmath php-zip
php -v
dnf -y install mariadb-server
systemctl start mariadb
systemctl enable mariadb
firewall-cmd --add-service=mysql --permanent
firewall-cmd --reload
mysql_secure_installation 
nano /etc/httpd/conf.d/welcome.conf
systemctl reload httpd

