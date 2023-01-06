# rsync-backup-script

This script is used to backup a Debian based distro using rsync and sshpass.

# Workflow ("Highlights")

1, Installs rsync and sshpass 

2, Asks user about various things for later use in rsync command.

3, Saves rsync command under rsync-backup.sh to be used later.

4, Prompt if user wants to start the rsync command right away.


# Tutorial

1, User with root privileges on remote server

2, apt install python3 wget -y

3, wget https://raw.githubusercontent.com/babywhale321/rsync-backup-script/main/rsync-backup-script.py

4, chmod +x rsync-backup-script.sh

5, sudo python3 rsync-backup-script.py

6, Follow the prompts as they come up
