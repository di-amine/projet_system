#!/bin/bash
# Effacement des variables

cd ~/wpvardevops
rm dbhostfile
rm dbrootfile
rm dbrootpwfile
rm dbnamefile
rm dbuserfile
rm dbupwfile
if [-f wphostfile ] then
rm wphostfile
rm wprootfile
rm wprootpwfile
fi
cd ../wpvardevops
rmdir ~/wpvardevops
exit

