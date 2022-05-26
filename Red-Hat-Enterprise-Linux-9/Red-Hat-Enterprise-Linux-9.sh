#!/bin/bash

# Variables
cpuarch=$(uname -m)
core=$(nproc)
snap_path_is_include=$(export PATH="$PATH:/snap/bin/")
scripts_path=$(find / -name scripts | grep -i "Red-Hat-Enterprise-Linux-9/scripts" | head -n 1)
# Select Which Softwares to be Installed

choice () {
    local choice=$1
    if [[ ${opts[choice]} ]] # toggle
    then
        opts[choice]=
    else
        opts[choice]=+
    fi
}
PS3='
Please enter your choice(s): '
while :
do
    clear
    options=("PHP ${opts[1]}" "Nginx ${opts[2]}" "Apache ${opts[3]}" "Done ${opts[4]}")
    select opt in "${options[@]}"
    do
        case $opt in
            "PHP ${opts[1]}")
                choice 1
                break
                ;;
            "Nginx ${opts[2]}")
                choice 2
                break
                ;;
            "Apache ${opts[3]}")
                choice 3
                break
                ;;
            "Done ${opts[4]}")
                break 2
                ;;

            *) printf '%s\n' 'Please Choose Between 1-4';;
        esac
    done
done

printf '%s\n\n' 'Options chosen:'
for opt in "${!opts[@]}"
do
    if [[ ${opts[opt]} ]]
    then
        printf '%s\n' "Option $opt"
    fi
done

if [ "${opts[opt]}" = "" ];then
    exit
fi



# Loading Bar

printf "Installation starting"
value=0
while [ $value -lt 600 ];do
    value=$((value+20))
    printf "."
    sleep 0.05
done
printf "\n"


#Necessary Packages
#sudo dnf -vy update
sudo dnf -vy install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm
sudo dnf -vy install wget curl mlocate nano lynx net-tools htop git dnf yum snapd bash-completion
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
sudo systemctl start snapd
export PATH=$PATH:/snap/bin
source /etc/profile
source /etc/profile.d/bash_completion.sh
printf "\n"

# Create Download Folder in root
if [ -d "/root/Downloads/" ];then
    :
else
    sudo mkdir -pv /root/Downloads/
fi

# INSTALLATION BY SELECTION

for opt in "${!opts[@]}"
do
    if [[ ${opts[opt]} ]]
    then
        case $opt in 
            1) 
            #PHP
            . "$scripts_path/1-Php.sh"
            ;;
            2)
            # 2- Nginx
            . "$scripts_path/2-Nginx.sh"
            ;;
            3)
            # 3- Apache
            . "$scripts_path/3-Apache.sh"
            ;;
        esac
    fi
done