#!/bin/bash
read dbhost 0< ~/wpvardevops/dbhostfile
read dbroot 0< ~/wpvardevops/dbrootfile
read dbrootpw 0< ~/wpvardevops/dbrootpwfile

#Test connexion ping

ping -c 3 $dbhost
if [ ! $? -eq 0 ]
then echo "Impossible de pinger l'hôte de la base de données, veuillez vérifier que l'adresse est correct et que l'hôte est bien allumé" ; exit 10
fi
echo "Votre ordinateur peut bien pinger l'hôte de la Base de données";
# Test connexion SSH

yum -y install sshpass

sshpass -p $dbrootpw ssh -o StrictHostKeyChecking=no $dbroot@$dbhost << EOF
logout
EOF


if [ $? -eq 0 ]
then 
    echo ""
    echo ""
    echo "***********La connexion sécurisée au système hôte distant a réussi*********"
    echo ""
    exit 11

else
    echo ""
    echo ""
    echo "***********La connexion sécurisée au système hôte distant a échoué*********"
    exit 12
fi


exit

