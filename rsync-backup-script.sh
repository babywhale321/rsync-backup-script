#!/bin/sh
#Made By: BabyWhale

#download sshpass and rsync
apt install rsync sshpass -y

#user input that reflects if they are updateing an exsisting archive
echo "Are you updating a current backup archive? (y/n)"
read -r updatevar

if [ "${updatevar}" = "y" ]; then updatevar="u"
elif [ "${updatevar}" = "n" ]; then updatevar=""
fi


#user input that reflects if they want ACL to be saved in the archive
echo "Would you want ACL permissions to be saved? (y/n)"
read -r aclvar

if [ "${aclvar}" = "y" ]; then aclvar="A"
elif [ "${aclvar}" = "n" ]; then aclvar=""
fi



#public ipv4 of ssh server
echo "What is the public ipv4 address of the ssh server you are backin up? 22.22.22.22 = an example"
read -r ipvar 

#port of ssh server
echo "What is the port number of the ssh server you are backing up? 22 = an example"
read -r portvar

#user of ssh server
echo "What is the username of the ssh server you are backing up? (make sure to use a user who has root access)"
read -r uservar

#user password
echo "What is the password of this user?"
read -r passwdvar

#DIR copy
echo "What is the directory of the remote server you would like to backup? /home = an example"
read -r remotedirvar

#local dir copy
echo "What is the Local directory location of where you would like to save the backup? /home/bill = an example"
read -r localdirvar

clear

echo "this is what the output will be: sshpass -p "$passwdvar" rsync -av$aclvar$updatevar --del -e "ssh -p $portvar" $uservar@$ipvar:$remotedirvar $localdirvar"
echo "Here is an example for proper syntax: rsync -avAu --del -e "ssh -p 22" root@123.123.321.321:/ /home/backups"
echo "press enter to execute rsync and a copy of the final script will be called rsync-backup-script.sh in this current directory"
read -r emptyvar


#Variables from user input is put into proper syntax for rsync and creates file called rsync-backup-script.sh
rm rsync-backup-script.sh

echo "sshpass -p \"$passwdvar\" rsync -av$aclvar$updatevar --del -e \"ssh -p $portvar\" $uservar@$ipvar:$remotedirvar $localdirvar" >> rsync-backup-script.sh

sshpass -p "$passwdvar" rsync -av$aclvar$updatevar --del -e "ssh -p $portvar" $uservar@$ipvar:$remotedirvar $localdirvar
