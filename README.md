# scripts and needful things

## synogit.sh
Create a Git repository on Synology NAS from your local machine, clones it to the current directory and creates an initial commit. 

> [!NOTE]
> To setup and prepare Git on Synology server follow these [instructions](#setup-git-on-synology-diskstation)

> [!NOTE]
> Copy your local rsa public key file to the Synology server, if you don't want to enter the passwords for admin and git user all the time.
> o achieve this follow these [instructions](#add-public-key)

> [!IMPORTANT]
> The script is calling chown and chmod with user admin. It is required to add them to the /etc/sudoers:
> ```
> sudo -i
> vi /etc/sudoers
> ```
> and add
> ```
> admin ALL=(ALL) NOPASSWD: /bin/chmod, /bin/chown
> ```
> !!! Be carefull when editing the /etc/sudoers. A broken file will disallow using sudo any more. 


#
## Setup Git on Synology Diskstation
For setup follow these steps by using the Synology admin :
1. Install the Git Server package on synology
2. Create the user "git"
3. Create a shared folder "git" (e.g. /volume1/git))
4. Set read/write permission on the folder "git" to the users "git" and "admin"
5. Permit the user git in the Git Server
 
## Add public key
1. Find the home directory for the git or admin user
   ```
   cat /etc/passwd | grep git
   cat /etc/passwd | grep admin
   ```
2. Append your private key file content from your local computer ~/.ssh/id_rsa.pub to the admin an git homes on the Synology servers ~/.ssh/authorized_keys
   
