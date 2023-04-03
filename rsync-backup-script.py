import subprocess
import shlex

while True:
    
    #will try to install rsync and sshpass
    try:
        subprocess.run(['sudo', 'apt', 'install', 'rsync', 'sshpass'])
    
    #If installing fails then user gets an error message with an option to restart
    except:
        print("Failed to Install rsync and sshpass\n")
        restart_var = input("Press enter to restart or type the word 'exit' to exit the program\n")
        if restart_var == 'exit': 
            break
        else: 
            continue

    #rsync needed varibles that will be used later in program
    print("\n")
    
    ip_var = input("What is the IPv4 address of the remote server?\n")

    port_var = input("What is the port number that ssh is listening to on the remote server?\n")

    user_var = input("What is the ssh username? root = an example\n")

    passwd_var = input("What is the ssh password for this user?\n")

    remotedir_var = input("What is the directory of the remote server you are backing up? /home/bob = an example\n")

    localdir_var = input("What is the local directory you are saving this to? /root/backups = an example\n")
    
    del_var = input("Would you like to Delete files on the receiving side that don't exist on sender? (y/n)\n")

    print("\n")
    
    del_var = del_var.lower()

    if del_var == "y":
        del_var = " --delete"

    elif del_var == "yes":
        del_var = " --delete"

    else:
        del_var = ""
        
    #shows the user proper syntax of variables from above
    print("this is what the output will be:","sshpass -p \"" + passwd_var + "\" rsync -av" + del_var + " -e \"ssh -p " + port_var + "\" " + user_var + "@" + ip_var + ":" + remotedir_var + " " + localdir_var)
    print("The Proper example output is as follows: sshpass -p \"password123\" rsync -av --delete -e \"ssh -p 22\" root@123.123.321.321:/ /home/backups")
    print("A new file will be created under rsync-backup.sh in this current direcotry for furthor use")
    print("\n")
    input("Press enter to coninue")
    
    
    #fuctions for the next try and except
    #removes then create the file with permissions and rsync syntax
    #except is to just create and write permissions and rsync syntax
    def newfilecreate():
        newfile_var = open("rsync-backup.sh", "w")
        subprocess.run(["sudo", "chmod", "+x", "rsync-backup.sh"])
        newfile_var.write("sshpass -p \"" + passwd_var + "\" rsync -av" + del_var + " -e \"ssh -p " + port_var + "\" " + user_var + "@" + ip_var + ":" + remotedir_var + " " + localdir_var)
    def rmfile():
        subprocess.run("sudo","rm","rsync-bachup.sh")
        
        
    
    #removes then create the file with permissions and rsync syntax
    #except is to just create and write permissions and rsync syntax
    try:
        
        rmfile()
        newfilecreate()
        
        
    except:
        
        newfilecreate()

        
        
    #if the user says yes then the subprocess will try to run the recently created rsync shell script
    command = ("sshpass -p \"" + passwd_var + "\" rsync -av" + del_var + " -e \"ssh -p " + port_var + "\" " + user_var + "@" + ip_var + ":" + remotedir_var + " " + localdir_var)
    #split command from above
    command = shlex.split(command)
    
    #if user inputs "y" or "yes" then the rsync command will start
    ask_var = input("Would you like to start this script now? (y/n)\n")
    
    def yes_input(input_str):
        return input_str.lower() in ["y", "yes"]
    
    
    if yes_input(ask_var):
        
        try:
            
            subprocess.run(command)
            print("Thanks for using this program and the created rsync script is under rsync-backup.sh and can be used at anytime with sudo bash rsync-backup.sh")
            input("Press enter to exit")
            break
        
        except:
            
            print("An error has occured when trying to run rsync-backup.sh. please check your variables that you are entering.")
            restart_var = input("Press enter to restart or type 'exit' to exit this program\n")
            if restart_var == "exit":
                break
            else:
                continue
                
    else:
        
        print("Thanks for using this program and the created rsync script is under rsync-backup.sh and can be used at anytime with sudo bash rsync-backup.sh")
        break
