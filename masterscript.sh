#!/bin/bash
if [ -f varsetup ]
  then 
     ./varsetup
  else
     echo "Le fichier de requête de paramêtres d'installation n'existe pas dans ce répertoire"
  exit 20
fi

if [ -f testco ]
  then 
     ./testco
  else
     echo "Le script de test de connexion n'existe pas dans ce répertoire"
  exit 22
fi

if [ -f installbdd ]
  then 
     ./installbdd
  else
     echo "Le script d'installation à distance de la BDD n'existe pas dans ce répertoire"
  exit 24
fi

if [ -f installwp ]
  then 
     ./installwp
  else
     echo "Le script d'installation WP n'existe pas dans ce répertoire"
  exit 26
fi

if [ -f configwp ]
  then 
     ./configwp
  else
     echo "Le script de configuration WP n'existe pas dans ce répertoire"
  exit 28
fi

if [ -f removevar ]
  then 
     ./removevar
  else
     echo "Le script de nettoyage n'existe pas dans ce répertoire"
  exit 30
fi

