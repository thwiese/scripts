# scripts and needful things

## synogit.sh
Create a GIT repository on Synology NAS from your local machine, clones it to the current directory and creates an initial commit. 

> [!IMPORTANT]
> To setup and prepare git on Synology server follow these [instructions](#setup-git-on-synology-diskstation)

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
## Setup git on Synology Diskstation
For setup follow these steps by using the Synology admin :
1. Install the Git Server package on synology
2. Create the user "git"
3. Create a shared folder "git" (e.g. /volume1/git))
4. Set read/write permission on the folder "git" to the users "git" and "admin"
5. Permit the user git in the Git Server
 
