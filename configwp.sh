#!/bin/bash

# Configuration Wordpress

if [ -f ~/wpvardevops/wphostfile ]
then
  read wphost 0< ~/wpvardevops/wphostfile
  read wproot 0< ~/wpvardevops/wprootfile
  read wprootpw 0< ~/wpvardevops/wprootpwfile
  read dbname 0< ~/wpvardevops/dbnamefile
  read dbuser 0< ~/wpvardevops/dbuserfile
  read dbupw 0< ~/wpvardevops/dbupwfile
  sshpass -p "$wprootpw" ssh -o StrictHostKeyChecking=no $wproot@$wphost << EOF
  cd /var/www/html
  cp wp-config-sample.php wp-config.php
  sed -i "s/database_name_here/$dbname/g" /var/www/html/wp-config.php
  sed -i "s/username_here/$dbuser/g" /var/www/html/wp-config.php
  sed -i "s/password_here/$dbupw/g" /var/www/html/wp-config.php
  sed -i "s/localhost/$wphost/g" /var/www/html/wp-config.php
  setsebool -P httpd_can_network_connect_db 1
EOF
else

cd /var/www/html
cp wp-config-sample.php wp-config.php

read dbname 0< ~/wpvardevops/dbnamefile
read dbuser 0< ~/wpvardevops/dbuserfile
read dbupw 0< ~/wpvardevops/dbupwfile
read dbhost 0< ~/wpvardevops/dbhostfile

sed -i "s/database_name_here/$dbname/g" /var/www/html/wp-config.php
sed -i "s/username_here/$dbuser/g" /var/www/html/wp-config.php
sed -i "s/password_here/$dbupw/g" /var/www/html/wp-config.php
sed -i "s/localhost/$dbhost/g" /var/www/html/wp-config.php
setsebool -P httpd_can_network_connect_db 1
fi
exit

