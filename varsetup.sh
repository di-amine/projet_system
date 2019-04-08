#!/bin/bash

# Création des variables
cd ~
mkdir wpvardevops
cd ~/wpvardevops
touch dbhostfile ; chmod 777 dbhostfile
touch dbrootfile ; chmod 777 dbrootfile
touch dbrootpwfile ; chmod 777 dbrootpwfile
touch dbnamefile ; chmod 777 dbnamefile
touch dbuserfile ; chmod 777 dbuserfile
touch dbupwfile ; chmod 777 dbupwfile
echo "--------- Informations concernant l'ordinateur hôte de la BDD ---------"
echo "Quelle est l'adresse IP de l'ordinateur abritant la base de données ? " ; read dbhost; echo $dbhost > ~/wpvardevops/dbhostfile
echo "Quel est l'utilisateur d'administration de l'ordinateur hébergeant la BDD ? "; read dbroot; echo $dbroot > ~/wpvardevops/dbrootfile
echo "Quel est son mot de passe"; read dbrootpw ; echo $dbrootpw > ~/wpvardevops/dbrootpwfile
echo "Quel sera le nom de la base de données ? " ; read dbname ; echo $dbname > ~/wpvardevops/dbnamefile
echo "Que sera le nom de l'utilisateur de la base de données ? " ; read dbuser ; echo $dbuser > ~/wpvardevops/dbuserfile
echo "Que sera le mot de passe de la base de données ? " ; read dbupw ; echo $dbupw > ~/wpvardevops/dbupwfile

# Inscription dans des fichiers et Contrôle

read a 0< ~/wpvardevops/dbhostfile
read b 0< ~/wpvardevops/dbrootfile
read c 0< ~/wpvardevops/dbrootpwfile
read d 0< ~/wpvardevops/dbnamefile
read e 0< ~/wpvardevops/dbuserfile
read f 0< ~/wpvardevops/dbupwfile
if [ "$a" != "$dbhost" ]
then 
    echo "Problème de stockage de l'IP" ; exit 3
elif [ "$b" != "$dbroot" ]
then
    echo "Problème de stockage du nom admin" ; exit 4
elif [ "$c" != "$dbrootpw" ]
then
    echo "Problème de stockage du pw admin" ; exit 5
elif [ "$d" != "$dbname" ]
then
    echo "Problème de stockage du nom de BDD" ; exit 6
elif [ "$e" != "$dbuser" ]
then
    echo "Problème de stockage de l'utilisateur BDD"; exit 7
elif [ "$f" != "$dbupw" ]
then
    echo "Problème de stockage du mot de passe"; exit 8
else 
    echo "Vos paramètres ont bien été enregistrés"
fi
exit

