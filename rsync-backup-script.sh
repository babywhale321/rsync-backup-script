import os
import subprocess

while True:
    
    try:
        os.system("sudo apt install rsync sshpass")
        
    except:
        print("Failed to Install rsync and sshpass\n")
        restart_var = input("Press enter to restart or type the word 'exit' to exit the program\n")
        if restart_var == 'exit': 
            break
        else: 
            continue


    ip_var = input("What is the IPv4 address of the remote server?\n")

    port_var = input("What is the port number that ssh is listening to on the remote server?\n")

    user_var = input("What is the ssh username? root = an example\n")

    passwd_var = input("What is the ssh password for this user?\n")

    remotedir_var = input("What is the directory of the remote server you are backing up? /home/bob = an example\n")

    localdir_var = input("What is the local directory you are saving this to? /root/backups = an example\n")
    
    del_var = input("Would you like to delete files that are not on the sending side? (y/n)\n")

    del_var = del_var.lower()

    if del_var == "y":
        del_var = " --delete"

    elif del_var == "yes":
        del_var = " --delete"

    else:
        del_var = ""

    print("this is what the output will be: sshpass -p",passwd_var,"rsync -av" + str(del_var),"-e ssh -p",port_var,user_var + "@" + str(ip_var) + ":" + str(remotedir_var),localdir_var)
    print("The Proper example output is as follows: sshpass -p \"password123\" rsync -av --delete -e \"ssh -p 22\" root@123.123.321.321:/ /home/backups")
    print("A new file will be created under rsync-backup.sh in this current direcotry for furthor use.")
    input("Press enter to coninue")
    
    try:
        
        newfile_var = open("rsync-backup.sh", "w")
        newfile_var.write("sshpass -p \"" + passwd_var + "\" rsync -av" + del_var + " -e \"ssh -p " + port_var + "\" " + user_var + "@" + ip_var + ":" + remotedir_var + " " + localdir_var)
        os.system("sudo chmod +x rsync-backup.sh")  
        
    except:
        
        print("1 or more variables that have been entered may not be correct.\n")
        print("Failed to save and write to rsync-backup.sh\n")
        restart_var = input("Press enter to restart or type the word 'exit' to exit the program\n")
        if restart_var == 'exit': 
            break
        else: 
            continue

    askstart_var = input("Would you like to start this script now? (y/n)")

    askstart_var = askstart_var.lower()
    
    if askstart_var == "y":
        try:
            print(subprocess.run(["sudo bash rsync-backup.sh"], shell=True))
            print("Thanks for using this program and the created rsync script is under rsync-backup.sh and can be used at anytime with sudo bash rsync-backup.sh")
            input("Press enter to exit")
            break
        
        except:
            print("Failed to run rsync-backup.sh")
            break

    elif askstart_var == "yes":
        try:
            print(subprocess.run(["sudo bash rsync-backup.sh"], shell=True))
            print("Thanks for using this program and the created rsync script is under rsync-backup.sh and can be used at anytime with sudo bash rsync-backup.sh")
            input("Press enter to exit")
            break
        
        except:
            print("Failed to run rsync-backup.sh")
            break
    
    else:
        print("Thanks for using this program and the created rsync script is under rsync-backup.sh and can be used at anytime with sudo bash rsync-backup.sh")
        break
