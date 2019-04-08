#!/bin/bash

# Installation Wordpress

echo "Voulez-vous installer WORDPRESS sur cette machine? [y/n]" ; read a

if [ $a = y ]
then
# Apache
   yum -y install httpd 
   systemctl start httpd.service
   systemctl enable httpd.service
# PHP update de la version PHP de CentOS et ajout des modules nécessaires
   yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
   yum -y install epel-release yum-utils
   yum-config-manager --disable remp-php54
   yum-config-manager --enable remi-php73 
   yum -y install php php-mysql php-gd  
   service httpd restart
# Wordpress
   cd ~
   wget http://wordpress.org/latest.tar.gz
   tar xzvf latest.tar.gz
   rsync -avP ~/wordpress/ /var/www/html/
   mkdir /var/www/html/wp-content/uploads
   chown -R apache:apache /var/www/html/*
   cd ~
   rm latest.tar.gz
   exit

elif [ $a = n ]
  then
touch ~/wpvardevops/wphostfile
touch ~/wpvardevops/wprootfile
touch ~/wpvardevops/dbrootpwfile
  echo "Entrez l'adresse IP de l'ordinateur souhaité:" ; read wphost ; echo $wphost > ~/wpvardevops/wphostfile
  echo "Quel est le compte administrateur de cet hote" ; read wproot ; echo $wproot > ~/wpvardevops/wprootfile
  echo "Entrez le mot de passe administrateur de l'ordinateur souhaité :" ; read dbrootpw ;echo $dbrootpw > ~/wpvardevops/dbrootpwfile 
  sshpass -p "$dbrootpw" ssh -o StrictHostKeyChecking=no $wproot@$wphost << EOF
# Apache
   yum -y install httpd 
   systemctl start httpd.service
   systemctl enable httpd.service
# PHP : update de la version PHP de CentOS et ajout des modules nécessaires
   yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
   yum -y install epel-release yum-utils
   yum-config-manager --disable remp-php54
   yum-config-manager --enable remi-php73 
   yum -y install php php-mysql php-gd
   service httpd restart
# Wordpress
   cd ~
   wget http://wordpress.org/latest.tar.gz
   tar xzvf latest.tar.gz
   rsync -avP ~/wordpress/ /var/www/html/
   mkdir /var/www/html/wp-content/uploads
   chown -R apache:apache /var/www/html/*
   cd ~
   rm latest.tar.gz
EOF
exit

else 
   echo "Vous n'avez pas entré la bonne touche" 
exit
fi

