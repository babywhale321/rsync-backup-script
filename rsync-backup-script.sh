#!/bin/sh
#Made By: BabyWhale

#update check
echo "Are you updating a current backup archive? (y/n)"
read -r updatevar

if [[ "${updatevar,,}" == "y" || "${updatevar,,}" == "yes" ]]; then updatevar="u"
elif [[ "${updatevar,,}" == "n" || "${updatevar,,}" == "no" ]]; then updatevar=""
fi
echo " "

#public ipv4 of ssh server
echo "What is the public ipv4 address of the ssh server you are backin up? 22.22.22.22 = an example"
read -r ipvar 

#port of ssh server
echo "What is the port number of the ssh server you are backing up? 22 = an example"
read -r portvar

#user of ssh server
echo "What is the username of the ssh server you are backing up? (make sure to use a user who has root access)"
read -r uservar

#DIR copy
echo "What is the directory of the remote server you would like to backup? / = an example"
read -r dirvar

#local dir copy
echo "What is the Local directory location of where you would like to save the backup? /home/bill = an example"
read -r localdirvar

echo "----------------------------------------------------------------------------------------------------"
echo "please make sure that everything looks right before continueing"
echo "this is what the output will be: rsync -av$updatevar -e "ssh -p $portvar" $uservar@$ipvar:$dirvar $localdirvar"
echo "Here is an example for proper syntax: rsync -av -e root@123.123.321.321:22:/ /home/backups"
echo "just press enter to execute rsync"
read -r

#Variables from user input is put into proper syntax for rsync

rsync -av$updatevar -e "ssh -p $portvar" $uservar@$ipvar:$dirvar $localdirvar || echo "please check that your inputs are correct"
