#!/bin/bash

#54-Wazuh Server
printf "\nPlease Choose Your Desired Wazuh Server Installation\n\n1-) Wazuh Server (Unattended Installation\n\
2-) Wazuh Server (Step-By-Step Installation)\n\nPlease Select Your Wazuh Server Version:"
read -r wazuh_server_version
if [ "$wazuh_server_version" = "1" ];then
    echo "Test"
elif [ "$phpmyadmin_version" = "2" ];then
    cd /root/Downloads
    curl -so wazuh-installation.sh \
    https://packages.wazuh.com/resources/4.2/open-distro/unattended-installation/unattended-installation.sh
    sudo bash ./wazuh-installation.sh
else
    echo "Out of options please choose between 1-2"
fi
;;
55)
#Wazuh Agent
printf "\nPlease Enter Your Wazuh Server ip :"
read -r WAZUH_MANAGER
rpm --import https://packages.wazuh.com/key/GPG-KEY-WAZUH
cat > /etc/yum.repos.d/wazuh.repo << EOF
[wazuh]
gpgcheck=1
gpgkey=https://packages.wazuh.com/key/GPG-KEY-WAZUH
enabled=1
name=EL-\$releasever - Wazuh
baseurl=https://packages.wazuh.com/4.x/yum/
protect=1
EOF
WAZUH_MANAGER="$WAZUH_MANAGER" yum install wazuh-agent
systemctl daemon-reload
systemctl enable wazuh-agent
systemctl start wazuh-agent