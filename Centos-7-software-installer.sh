#!/bin/bash

# Variables
cpuarch=$(uname -m)
core=$(nproc)
snap_path_is_include=$(export PATH="$PATH:/snap/bin/")
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
options=("PHP ${opts[1]}" "Nginx ${opts[2]}" "FFmpeg ${opts[3]}" "GCC4.8 - Latest From Source ${opts[4]}" "G++ ${opts[5]}" "Cmake ${opts[6]}" "VLC ${opts[7]}"
"Apache2 ${opts[8]}" "Monitoring Tools ${opts[9]}" "Transmission-cli ${opts[10]}" "Nmap ${opts[11]}" "Irssi (IRC) ${opts[12]}" "Timeshift ${opts[13]}" 
"Jenkins ${opts[14]}" "Docker ${opts[15]}" "Weechat (IRC) ${opts[16]}" "Quassel (IRC) ${opts[17]}" "Neofetch ${opts[18]}" "GNU Emacs ${opts[19]}" 
"Kubectl ${opts[20]}" "Magic Wormhole ${opts[21]}" "Neovim ${opts[22]}" "OpenJDK 8-11-17 ${opts[23]}" 
"Deluge ${opts[24]}" "Snap ${opts[25]}" "WineHQ From Source ${opts[26]}" "VMware Workstation Pro ${opts[27]}" "Telegram ${opts[28]}" "Screenfetch ${opts[29]}" 
"Postman ${opts[30]}" "DBeaver-CE ${opts[31]}" "Anydesk ${opts[32]}" "Jitsi ${opts[33]}" "DVBlast ${opts[34]}" "ElectronMail ${opts[35]}"
"PyCharm Community Edition ${opts[36]}" "Gimp Latest ${opts[37]}" "Linux Kernel ${opts[38]}" "Samba ${opts[39]}" "Mysql ${opts[40]}" 
"Mariadb ${opts[41]}" "Nodejs & Npm ${opts[42]}" ".NET SDK ${opts[43]}" "Tinc ${opts[44]}" "Zabbix Server ${opts[45]}" "Done ${opts[46]}")
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
            "FFmpeg ${opts[3]}")
                choice 3
                break
                ;;
            "GCC4.8 - Latest From Source ${opts[4]}")
                choice 4
                break
                ;;
            "G++ ${opts[5]}")
                choice 5
                break
                ;;
            "Cmake ${opts[6]}")
                choice 6
                break
                ;;
            "VLC ${opts[7]}")
                choice 7
                break
                ;;
            "Apache2 ${opts[8]}")
                choice 8
                break
                ;;
            "Monitoring Tools ${opts[9]}")
                choice 9
                break
                ;;
            "Transmission-cli ${opts[10]}")
                choice 10
                break
                ;;
            "Nmap ${opts[11]}")
                choice 11
                break
                ;;
            "Irssi (IRC) ${opts[12]}")
                choice 12
                break
                ;;
            "Timeshift ${opts[13]}")
                choice 13
                break
                ;;
            "Jenkins ${opts[14]}")
                choice 14
                break
                ;;
            "Docker ${opts[15]}")
                choice 15
                break
                ;;
            "Weechat (IRC) ${opts[16]}")
                choice 16
                break
                ;;
            "Quassel (IRC) ${opts[17]}")
                choice 17
                break
                ;;
            "Neofetch ${opts[18]}")
                choice 18
                break
                ;;
            "GNU Emacs ${opts[19]}")
                choice 19
                break
                ;;
            "Kubectl ${opts[20]}")
                choice 20
                break
                ;;
            "Magic Wormhole ${opts[21]}")
                choice 21
                break
                ;;
            "Neovim ${opts[22]}")
                choice 22
                break
                ;;
            "OpenJDK 8-11-17 ${opts[23]}")
                choice 23
                break
                ;;
            "Deluge ${opts[24]}")
                choice 24
                break
                ;;
            "Snap ${opts[25]}")
                choice 25
                break
                ;;
            "WineHQ From Source ${opts[26]}")
                choice 26
                break
                ;;
            "VMware Workstation Pro ${opts[27]}")
                choice 27
                break
                ;;
            "Telegram ${opts[28]}")
                choice 28
                break
                ;;
            "Screenfetch ${opts[29]}")
                choice 29
                break
                ;;
            "Postman ${opts[30]}")
                choice 30
                break
                ;;
            "DBeaver-CE ${opts[31]}")
                choice 31
                break
                ;;
            "Anydesk ${opts[32]}")
                choice 32
                break
                ;;
            "Jitsi ${opts[33]}")
                choice 33
                break
                ;;
            "DVBlast ${opts[34]}")
                choice 34
                break
                ;;
            "ElectronMail ${opts[35]}")
                choice 35
                break
                ;;
            "PyCharm Community Edition ${opts[36]}")
                choice 36
                break
                ;;
            "Gimp Latest ${opts[37]}")
                choice 37
                break
                ;;
            "Linux Kernel ${opts[38]}")
                choice 38
                break
                ;;
            "Samba ${opts[39]}")
                choice 39
                break
                ;;
            "Mysql ${opts[40]}")
                choice 40
                break
                ;;
            "Mariadb ${opts[41]}")
                choice 41
                break
                ;;
            "Nodejs & Npm ${opts[42]}")
                choice 42
                break
                ;;
            ".NET SDK ${opts[43]}")
                choice 43
                break
                ;;
            "Tinc ${opts[44]}")
                choice 44
                break
                ;;
            "Zabbix Server ${opts[45]}")
                choice 45
                break
                ;;
            "Done ${opts[46]}")
                break 2
                ;;
            *) printf '%s\n' 'Please Choose Between 1-46';;
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
sudo yum -y update
sudo yum -y install epel-release
sudo yum -y install wget curl mlocate nano lynx net-tools htop git redhat-lsb-core dnf
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
sudo echo 'export PATH="$PATH:/snap/bin/"' >> /etc/profile
source /etc/profile
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
# 1) PHP 5.4 - 8.1
1)
sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -y
sudo yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y
sudo yum install yum-utils -y
printf "\nPlease Choose Your Desired PHP Version\n\n1-)PHP5.4\n2-)PHP5.5\n3-)PHP5.6\n4-)PHP7.0\n5-)PHP7.1\n6-)PHP7.2\n7-)PHP7.3\n8-)PHP7.4\n9-)PHP8.0\n10-)PHP8.1\n\nPlease Select Your PHP Version:"
read -r phpversion
if [ "$phpversion" = "1" ];then
    sudo yum-config-manager --enable remi-php54
elif [ "$phpversion" = "2" ];then
    sudo yum-config-manager --enable remi-php55
elif [ "$phpversion" = "3" ];then
    sudo yum-config-manager --enable remi-php56
elif [ "$phpversion" = "4" ];then
    sudo yum-config-manager --enable remi-php70
elif [ "$phpversion" = "5" ];then
    sudo yum-config-manager --enable remi-php71
elif [ "$phpversion" = "6" ];then
    sudo yum-config-manager --enable remi-php72
elif [ "$phpversion" = "7" ];then
    sudo yum-config-manager --enable remi-php73
elif [ "$phpversion" = "8" ];then
    sudo yum-config-manager --enable remi-php74
elif [ "$phpversion" = "9" ];then
    sudo yum-config-manager --enable remi-php80
elif [ "$phpversion" = "10" ];then
    sudo yum-config-manager --enable remi-php81
else
    echo "Out of option Please Choose between 1-10"
:
fi
sudo yum install php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo -y
printf "\nPHP installation Has Finished\n\n"
;;

2)
#NGINX

#OpenSSL Installation Section
printf "\nPlease Choose Your Desired OpenSSL Version\n\n1-)OpenSSL 1.0.2k (Official Package)\n2-)OpenSSL Latest(Compile From Source)\n\nPlease Select Your OpenSSL Version:"
read -r opensslversion
if [ "$opensslversion" = "1" ];then
    sudo yum -y install openssl openssl-devel
elif [ "$opensslversion" = "2" ];then
sudo yum install perl gcc -y
openssl_latest=$(lynx -dump https://www.openssl.org/source/ | awk '{print $2}' | grep -iv '.asc\|sha\|fips' | grep -i .tar.gz | tail -n 1)
wget -O /root/Downloads/openssl-latest.tar.gz "$openssl_latest"
sudo mkdir -pv /root/Downloads/openssl-latest
tar -xvf /root/Downloads/openssl-latest.tar.gz -C /root/Downloads/openssl-latest --strip-components 1
cd /root/Downloads/openssl-latest
./config
make -j "$core" && make -j "$core" install
echo "export PATH="/usr/local/ssl/bin:"${PATH}""" >> ~/.bashrc
ln -s /usr/local/lib64/libssl.so.3 /usr/lib64/libssl.so.3
ln -s /usr/local/lib64/libcrypto.so.3 /usr/lib64/libcrypto.so.3
else
    echo "Out of options please choose between 1-2"
    :
fi
#----------------------------------------------------------------------------------------
#Nginx installation section
printf "\nPlease Choose Your Desired Nginx Version\n\n1-)Nginx (Official Package)\n2-)Nginx Latest(Compile From Source)\n\nPlease Select Your Nginx Version:"
read -r nginxversion
if [ "$nginxversion" = "1" ];then
    yum install nginx -y
elif [ "$nginxversion" = "2" ];then
sudo yum install gd gd-devel pcre-devel -y
nginx_latest=$(lynx -dump http://nginx.org/en/download.html | awk '{print $2}' | grep -iv '.asc\|.zip' | grep -i .tar.gz | head -n 1)
mkdir -pv /root/Downloads/nginx-latest
wget -O /root/Downloads/nginx-latest/nginx-latest.tar.gz "$nginx_latest"
tar -xvf /root/Downloads/nginx-latest/nginx-latest.tar.gz -C /root/Downloads/nginx-latest --strip-components 1
cd /root/Downloads/nginx-latest
./configure --prefix=/var/www/html --sbin-path=/usr/sbin/nginx --conf-path=/etc/nginx/nginx.conf \
--http-log-path=/var/log/nginx/access.log --error-log-path=/var/log/nginx/error.log --with-pcre  \
--lock-path=/var/lock/nginx.lock --pid-path=/var/run/nginx.pid --with-http_ssl_module \
--with-http_image_filter_module=dynamic --modules-path=/etc/nginx/modules --with-http_v2_module \
--with-stream=dynamic --with-http_addition_module --with-http_mp4_module
make -j "$core" && make -j "$core" install

echo "[Unit]
Description=The NGINX HTTP and reverse proxy server
After=syslog.target network-online.target remote-fs.target nss-lookup.target
Wants=network-online.target

[Service]
Type=forking
PIDFile=/var/run/nginx.pid
ExecStartPre=/usr/sbin/nginx -t
ExecStart=/usr/sbin/nginx
ExecReload=/usr/sbin/nginx -s reload
ExecStop=/bin/kill -s QUIT $MAINPID
PrivateTmp=true

[Install]
WantedBy=multi-user.target" > /lib/systemd/system/nginx.service
else
    echo "Out of options please choose between 1-2"
    :
fi
#------------------------------------------------------------
sudo systemctl enable nginx
sudo systemctl start nginx
#sudo firewall-cmd --permanent --zone=public --add-service=http 
#sudo firewall-cmd --permanent --zone=public --add-service=https
#sudo firewall-cmd --reload

printf "\nNginx Installation Has Finished\n\n"
;;

3)
#FFMPEG
printf "\nPlease Choose Your Desired FFmpeg Version\n\n1-)FFmpeg 2.8\n2-)FFmpeg Stable (Snap)\n3-)FFmpeg Latest (Snap)\n\nPlease Select Your FFmpeg Version:"
read -r ffmpegversion
if [ "$ffmpegversion" = "1" ];then
    sudo snap remove ffmpeg
    sudo yum install epel-release -y
    sudo rpm -v --import http://li.nux.ro/download/nux/RPM-GPG-KEY-nux.ro
    sudo rpm -Uvh http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm
    sudo yum install ffmpeg ffmpeg-devel -y
elif [ "$ffmpegversion" = "2" ];then
    sudo yum remove -y ffmpeg*
    sudo snap remove ffmpeg
    sudo snap install ffmpeg
    sleep 2
    sudo ln -s /var/lib/snapd/snap /snap
    sudo echo 'export PATH="$PATH:/snap/bin/"' >> /etc/profile
    source /etc/profile
elif [ "$ffmpegversion" = "3" ];then
    sudo yum remove -y ffmpeg*
    sudo snap remove ffmpeg
    sudo snap install ffmpeg --edge
    sudo ln -s /var/lib/snapd/snap /snap
    sudo echo 'export PATH="$PATH:/snap/bin/"' >> /etc/profile
    source /etc/profile
else
    echo "Out of options please choose between 1-3"
fi
printf "\nFFmpeg installation Has Finished\n\n"
;;

4)
#GCC4.8 - Latest From Source
sudo yum groupinstall "Development Tools" -y
printf "\nPlease Choose Your Desired GCC Version\n\n1-)GCC Latest From Source\n2-)GCC 4.8\n\nPlease Select Your GCC Version:"
read -r gccversion
if [ "$gccversion" = "1" ];then
    gcc_latest=$(lynx -dump https://ftp.gnu.org/gnu/gcc/ | awk '/http/{print $2}' | grep -i gcc- | grep -iv .gz | tail -n 1)
    gcc_latest=$(lynx -dump "$gcc_latest" | awk '/http/{print $2}' | grep -i .tar.gz | grep -iv .sig | head -n 1)
    sudo wget -O /root/Downloads/gcc-latest.tar.gz "$gcc_latest"
    sudo mkdir -pv /root/Downloads/gcc-latest
    sudo tar xzvf /root/Downloads/gcc-latest.tar.gz -C /root/Downloads/gcc-latest --strip-components 1
    cd /root/Downloads/gcc-latest
    ./contrib/download_prerequisites
    sudo mkdir -pv gcc-latest-build
    cd gcc-latest-build
    ../configure --enable-languages=c,c++ --disable-multilib
    make -j "$core"
    make install
    printf "\nGCC Latest Installation Has Finished\n\n"
elif [ "$gccversion" = "2" ];then
    sudo yum install gcc -y
    printf "\nGCC 4.8 Installation Has Finished\n\n"
fi
;;

5)
#G++
sudo yum install gcc-c++ -y
;;

6)
#Cmake
printf "\nPlease Choose Your Desired Cmake Version\n\n1-)Cmake (Official Package)\n2-)Cmake Latest (Snap)\n\nPlease Select Your Cmake Version:"
read -r cmakeversion
if [ "$cmakeversion" = "1" ];then
    sudo snap remove cmake
    sudo yum install cmake -y
elif [ "$cmakeversion" = "2" ];then
    sudo yum remove -y cmake
    sudo yum install epel-release -y
    sudo yum install snapd -y
    sudo systemctl enable --now snapd.socket
    sleep 2
    sudo ln -s /var/lib/snapd/snap /snap
    sudo echo 'export PATH="$PATH:/snap/bin/"' >> /etc/profile
    source /etc/profile
    sudo snap install cmake --classic
else
    echo "Out of options please choose between 1-2"
fi
;;

7)
#VLC
sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -y
sudo yum install https://download1.rpmfusion.org/free/el/rpmfusion-free-release-7.noarch.rpm -y
sudo yum install vlc-core -y
sudo sed -i 's/geteuid/getppid/' /usr/bin/vlc
;;

8)

#Apache2
printf "\nPlease Choose Your Desired Apache Version\n\n1-)Apache 2.4.37(From Official Package)\n2-)Apache Latest(Compile From Source)\n\nPlease Select Your Apache Version:"
read -r apacheversion
if [ "$apacheversion" = "1" ];then
    sudo install apache2 -y
elif [ "$apacheversion" = "2" ];then
apache_latest=$(lynx -dump https://dlcdn.apache.org//httpd | awk '{print $2}' | grep -iv '.asc\|.sha' | grep -i .tar.gz | tail -n 1)
yum install apr-devel apr-util apr-util-devel gcc pcre-devel make cmake redhat-rpm-config -y
mkdir -pv /root/Downloads
mkdir -pv /usr/local/apache
wget -O /root/Downloads/httpd-latest.tar.gz "$apache_latest"
mkdir -pv /root/Downloads/httpd-latest
tar -xvf /root/Downloads/httpd-latest.tar.gz -C /root/Downloads/httpd-latest --strip-components 1

wget -O /root/Downloads/apr-1.7.0.tar.gz https://dlcdn.apache.org//apr/apr-1.7.0.tar.gz
mkdir -pv /root/Downloads/apr-1.7.0
tar -xvf /root/Downloads/apr-1.7.0.tar.gz -C /root/Downloads/apr-1.7.0 --strip-components 1
mkdir -pv /root/Downloads/httpd-latest/srclib/apr
cp -rf /root/Downloads/apr-1.7.0/* /root/Downloads/httpd-latest/srclib/apr 

wget -O /root/Downloads/apr-util-1.6.1.tar.gz https://dlcdn.apache.org//apr/apr-util-1.6.1.tar.gz
mkdir -pv /root/Downloads/apr-util-1.6.1
tar -xvf /root/Downloads/apr-util-1.6.1.tar.gz -C /root/Downloads/apr-util-1.6.1 --strip-components 1
mkdir -pv /root/Downloads/httpd-latest/srclib/apr-util
cp -rf /root/Downloads/apr-util-1.6.1/* /root/Downloads/httpd-latest/srclib/apr-util

cd /root/Downloads/httpd-latest
./configure --enable-ssl --enable-so --with-mpm=event --with-included-apr --prefix=/usr/local/apache
make -j "$core" && make -j "$core" install

echo "[Unit]
Description=The Apache HTTP Server

[Service]
Type=forking
ExecStart=/usr/local/apache/bin/apachectl start
ExecReload=/usr/local/apache/bin/apachectl graceful
ExecStop=/usr/local/apache/bin/apachectl stop
PrivateTmp=true


[Install]
WantedBy=multi-user.target" > /etc/systemd/system/httpd.service

echo "pathmunge /usr/local/apache/bin" > /etc/profile.d/httpd.sh
else
    echo "Out of options please choose between 1-2"
fi


sudo systemctl daemon-reload
sudo systemctl enable httpd
sudo systemctl start httpd
sudo systemctl status httpd

#sudo firewall-cmd --zone=public --permanent --add-service=http
#sudo firewall-cmd --zone=public --permanent --add-service=https
#sudo firewall-cmd --reload
printf "\nApache2 Installation Has Finished\n\n"
;;

9)
#Monitoring Tools
sudo yum install htop iftop atop glances monit powertop iotop apachetop -y
;;

10)
#Transmission-cli
sudo yum install transmission-cli transmission-common transmission-daemon -y
sudo systemctl enable transmission-daemon
sudo systemctl start transmission-daemon
sudo firewall-cmd --permanent --zone=public --add-port=9091/tcp
sudo firewall-cmd --reload
;;

11)
#Nmap
printf "\nPlease Choose Your Desired Nmap Version\n\n1-)Nmap (From Official Package)\n2-)Nmap Latest\n\nPlease Select Your Nmap Version:"
read -r nmapversion
if [ "$nmapversion" = "1" ];then
    sudo yum -y install nmap
elif [ "$nmapversion" = "2" ];then
    nmap64=$(lynx -dump https://nmap.org/dist/ | awk '/nmap-7.*\.x86_64.rpm$/{url=$2}END{print url}')
    sudo rpm -Uvh "$nmap64"
else
    echo "Out of options please choose between 1-2"
fi
;;

12)
#Irssi (IRC)
sudo yum install irssi -y
;;

13)
#Timeshift
sudo yum install timeshift -y
;;

14)
#Jenkins
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum install jenkins -y
sudo systemctl start jenkins.service
sudo systemctl enable jenkins.service
sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp
sudo firewall-cmd --reload
;;

15)
#Docker
sudo yum install yum-utils device-mapper-persistent-data lvm2 -y
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install docker-ce docker-ce-cli containerd.io -y
sudo systemctl start docker
sudo systemctl enable docker
;;

16)
#Weechat (IRC)
sudo yum install weechat -y
;;

17)
#Quassel (IRC)
sudo yum install quassel -y
;;

18)
#Neofetch
sudo yum install epel-release dnf -y
curl -o /etc/yum.repos.d/konimex-neofetch-epel-7.repo https://copr.fedorainfracloud.org/coprs/konimex/neofetch/repo/epel-7/konimex-neofetch-epel-7.repo
sudo dnf install neofetch -y
;;

19)
#Emacs
sudo yum install epel-release -y
sudo yum install emacs -y
;;

20)
#Kubectl
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF
sudo yum install kubelet kubeadm kubectl -y
sudo systemctl start kubelet 
sudo systemctl enable kubelet
;;

21)
#Magic Wormhole
sudo yum install python-pip python-devel -y
sudo pip install magic-wormhole
;;

22)
#Neovim
sudo yum install neovim -y
;;

23)
#OpenJDK 8-11-17
printf "\nPlease Choose Your Desired OpenJDK Version\n\n1-)OpenJDK 6\n2-)OpenJDK 7\n3-)OpenJDK 8\n4-)OpenJDK 11\n5-)OpenJDK 17\n\nPlease Select Your OpenJDK Version:"
read -r openjdkversion
if [ "$openjdkversion" = "1" ];then
    sudo yum -y remove java*
    sudo rpm -e jdk-17
    sudo yum -y install java-1.6.0-openjdk java-1.6.0-openjdk-devel
elif [ "$openjdkversion" = "2" ];then
    sudo yum -y remove java*
    sudo rpm -e jdk-17
    sudo yum -y install java-1.7.0-openjdk java-1.7.0-openjdk-devel
elif [ "$openjdkversion" = "3" ];then
    sudo yum -y remove java*
    sudo rpm -e jdk-17
    sudo yum -y install java-1.8.0-openjdk java-1.8.0-openjdk-devel
elif [ "$openjdkversion" = "4" ];then
    sudo yum -y remove java*
    sudo rpm -e jdk-17
    sudo yum -y install java-11-openjdk java-11-openjdk-devel
elif [ "$openjdkversion" = "5" ];then
    sudo yum -y remove java*
    sudo rpm -e jdk-17
    sudo wget -O /root/Downloads/jdk-17_linux-x64_bin.rpm https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.rpm
    sudo rpm -ivh /root/Downloads/jdk-17_linux-x64_bin.rpm
else
    echo "Out of options please choose between 1-5"
fi
;;

24)
#DELUGE
sudo wget -O /root/Downloads/nux-dextop-release-0-5.el7.nux.noarch.rpm http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm
sudo rpm -ivh /root/Downloads/nux-dextop-release-0-5.el7.nux.noarch.rpm
sudo yum install deluge-console -y
;;

25)
#Snap
sudo yum install epel-release -y
sudo yum install snapd -y
;;

26)
#WineHQ From Source
sudo mkdir -pv /root/Downloads/winelatest
winelatest=$(lynx -dump https://dl.winehq.org/wine/source/ | awk '/http/{print $2}' | grep -iv README | grep wine/source | tail -n 1)
winelatest=$(lynx -dump  "$winelatest" | awk '/http/{print $2}' | grep -i tar.xz | grep -iv sign | tail -n 1)
sudo yum groupinstall 'Development Tools' -y
sudo yum install libX11-devel freetype-devel zlib-devel libxcb-devel libxslt-devel libgcrypt-devel libxml2-devel gnutls-devel libpng-devel libjpeg-turbo-devel libtiff-devel gstreamer-devel dbus-devel fontconfig-devel wget -y
wget -O /root/Downloads/winelatest.tar.xz "$winelatest"
tar xvf /root/Downloads/winelatest.tar.xz -C /root/Downloads/winelatest --strip-components 1
cd /root/Downloads/winelatest/
./configure --enable-win64
make -j "$core"
make install
;;

27)
#VMware Workstation Pro
wget -O /root/Downloads/VMware-Workstation-Pro.bundle https://www.vmware.com/go/getworkstation-linux
sudo yum install gcc kernel-devel kernel-headers -y
sudo yum groupinstall 'Development Tools' -y
sudo bash /root/Downloads/VMware-Workstation-Pro.bundle
;;

28)
#Telegram
sudo yum install epel-release -y
sudo yum install snapd -y
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
sleep 2
sudo snap install telegram-desktop
;;

29)
#Screenfetch
sudo mkdir -pv /root/Downloads/
sudo yum install git -y
sudo git clone git://github.com/KittyKatt/screenFetch.git /root/Downloads/screenfetch
sudo cp /root/Downloads/screenfetch/screenfetch-dev /usr/bin/screenfetch
sudo chmod +x /usr/bin/screenfetch
;;

30)
#Postman
sudo yum install epel-release -y
sudo yum install snapd -y
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
sleep 2
sudo snap install postman
;;

31)
#DBeaver-CE
sudo yum install epel-release -y
sudo yum install snapd -y
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
sleep 2
sudo snap install dbeaver-ce
;;

32)
#Anydesk
sudo mkdir -pv /root/Downloads/
anydesk_link=$(lynx -dump https://anydesk.com/en/downloads/thank-you?dv=centos7_64 | awk '/http/{print $2}' | grep -i rpm | head -n 1)
sudo wget -O /root/Downloads/latest-anydesk.rpm "$anydesk_link"
sudo yum install hicolor-icon-theme libatk-1.0.so.0 libgdk-x11-2.0.so.0 libGLU.so.1 libgtk-x11-2.0.so.0 libICE.so.6 libminizip.so.1 libSM.so.6 libXi.so.6 libxkbfile.so.1 libXmu.so.6 libXrandr.so.2 libXt.so.6 libXtst.so.6 atk.x86_64 gtk2.x86_64 mesa-libGLU.x86_64 libICE.x86_64 minizip.x86_64 libSM.x86_64 libxkbfile.x86_64 libXmu.x86_64 libXtst.x86_64 -y
sudo rpm -i /root/Downloads/latest-anydesk.rpm
;;

33)
#Jitsi
sudo mkdir -pv /root/Downloads/
jitsi_link=$(lynx -dump https://desktop.jitsi.org/Main/Download | awk '/http/{print $2}' | grep -i .rpm | head -n 1)
sudo wget -O /root/Downloads/latest-jitsi.rpm "$jitsi_link"
sudo wget -O /root/Downloads/speex-1.2-0.23.rc2.el7.centos.x86_64.rpm https://copr-be.cloud.fedoraproject.org/results/fedpop/speex/epel-7-x86_64/00146973-speex/speex-1.2-0.23.rc2.el7.centos.x86_64.rpm
sudo rpm -i speex-1.2-0.23.rc2.el7.centos.x86_64.rpm
sudo wget -O /root/Downloads/speexdsp-1.2-0.7.rc3.el7.centos.x86_64.rpm https://copr-be.cloud.fedoraproject.org/results/fedpop/speexdsp/epel-7-x86_64/00146970-speexdsp/speexdsp-1.2-0.7.rc3.el7.centos.x86_64.rpm
sudo rpm -i speexdsp-1.2-0.7.rc3.el7.centos.x86_64.rpm
sudo rpm -i /root/Downloads/latest-jitsi.rpm
;;

34)
#DVBlast
sudo mkdir -pv /root/Downloads/
sudo wget -O /root/Downloads/dvblast-3.4-6.el8.x86_64.rpm https://download-ib01.fedoraproject.org/pub/epel/8/Everything/x86_64/Packages/d/dvblast-3.4-6.el8.x86_64.rpm
sudo rpm -ivh /root/Downloads/dvblast-3.4-6.el8.x86_64.rpm
;;

35)
#ElectronMail
sudo yum install epel-release -y
sudo yum install snapd -y
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
sleep 2
sudo snap install electron-mail
;;

36)
#PyCharm Community Edition
sudo yum install epel-release -y
sudo yum install snapd -y
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
sleep 2
sudo snap install pycharm-community --classic
;;

37)
#Gimp Latest
sudo yum install flatpak -y
sudo wget -O /root/Downloads/org.gimp.GIMP.flatpakref https://flathub.org/repo/appstream/org.gimp.GIMP.flatpakref
flatpak install https://flathub.org/repo/appstream/org.gimp.GIMP.flatpakref
;;

38)
#Linux Kernel
printf "\nPlease Choose Your Desired Kernel Version\n\n1-)Mainline Kernel (Latest)\n2-)Longterm Kernel (LTS)\n\nPlease Select Your Linux Kernel Version:"
read -r kernelversion
if [ "$kernelversion" = "1" ];then
    sudo yum --enablerepo=elrepo-kernel install kernel-ml -y
elif [ "$kernelversion" = "2" ];then
    sudo yum --enablerepo=elrepo-kernel install kernel-lt -y
else
    echo "Out of options please choose between 1-2"
fi
grub2-set-default 0
grub2-mkconfig -o /etc/grub2.cfg
sudo yum install bash-completion -y
#sudo yum update kernel -y # To Update Linux Kernel
printf "\nLinux Kernel Installation Has Finished To Apply New Kernel Please Reboot The Server.\n\n"

;;
39)
#Samba
sudo yum install samba samba-client samba-common -y
firewall-cmd --permanent --zone=public --add-service=samba
firewall-cmd --reload
sudo systemctl enable smb.service
sudo systemctl start smb.service
systemctl status smb.service
;;

40)
#Mysql
printf "\nPlease Choose Your Desired Mysql Version\n\n1-)Mysql 8.0\n2-)Mysql 5.7\n3-)Mysql 5.6\n4-)Mysql 5.5\n\nPlease Select Your Mysql Version:"
read -r mysqlversion
if [ "$mysqlversion" = "1" ];then
    sudo dnf remove @mysql -y
    sudo dnf module reset mysql -y && sudo dnf module disable mysql -y
    sudo yum -y erase mysql*
    sudo yum remove mysql-community-server mysql-devel mysql-server -y
    sudo yum -y remove mysql-community-release*
    sudo yum-config-manager --disable mysql57-community
    sudo yum-config-manager --disable mysql56-community
    sudo yum-config-manager --disable mysql55-community
    sudo yum -y install https://dev.mysql.com/get/mysql80-community-release-el7-1.noarch.rpm
    sudo yum -y --enablerepo=mysql80-community install mysql-community-server
    sudo yum -y install mysql-community-server
    sudo systemctl start mysqld
    sudo systemctl enable mysqld
    systemctl status mysqld.service
elif [ "$mysqlversion" = "2" ];then
    sudo yum -y remove mysql-community-server mysql-devel mysql-server
    sudo yum -y erase mysql*
    sudo yum -y install https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm
    sudo yum-config-manager --disable mysql80-community
    sudo yum-config-manager --disable mysql56-community
    sudo yum-config-manager --disable mysql55-community
    sudo yum --enablerepo=mysql57-community install mysql-community-server
    sudo yum -y install mysql-community-server
    sudo systemctl start mysqld
    sudo systemctl enable mysqld
    systemctl status mysqld.service
elif [ "$mysqlversion" = "3" ];then
    sudo yum remove mysql-community-server mysql-devel mysql-server -y
    sudo yum -y erase mysql*
    sudo rpm -Uvh http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
    sudo yum-config-manager --disable mysql80-community
    sudo yum-config-manager --disable mysql57-community
    sudo yum-config-manager --disable mysql55-community
    sudo yum --enablerepo=mysql56-community install mysql-community-server
    sudo yum -y install mysql-community-server
    sudo systemctl start mysqld
    sudo systemctl enable mysqld
    systemctl status mysqld.service
elif [ "$mysqlversion" = "4" ];then
    sudo yum -y remove mysql-community-server mysql-devel mysql-server
    sudo yum -y erase mysql*
    sudo yum install -y http://repo.mysql.com/yum/mysql-5.5-community/el/7/x86_64/mysql-community-release-el7-5.noarch.rpm
    sudo yum-config-manager --disable mysql80-community
    sudo yum-config-manager --disable mysql57-community
    sudo yum-config-manager --disable mysql55-community
    sudo yum -y --enablerepo=mysql55-community install mysql-community-server
    sudo yum -y install mysql-community-server
    sudo systemctl start mysqld
    sudo systemctl enable mysqld
    systemctl status mysqld.service
else
    echo "Out of options please choose between 1-5"
fi
#sudo yum update kernel -y # To Update Linux Kernel
printf "\nMysql Installation Has Finished.\n\n"
;;

41)
#Mariadb
printf "\nPlease Choose Your Desired Mariadb Version\n\n1-)Mariadb 10.3\n2-)Mariadb 10.4\n3-)Mariadb 10.5\n4-)Mariadb 10.6\n\nPlease Select Your Mariadb Version:"
read -r mariadbversion
if [ "$mariadbversion" = "1" ];then
    wget -O /root/Downloads/mariadb_repo_setup https://downloads.mariadb.com/MariaDB/mariadb_repo_setup
    bash /root/Downloads/mariadb_repo_setup --mariadb-server-version=10.3
    sudo dnf install boost-program-options -y
    sudo dnf module reset mariadb -y
    sudo yum -y remove mariadb-libs
    sudo yum -y remove mariadb mariadb-server galera*
    cd /var/lib/ && rm -rfv mysql
    sudo yum install mariadb mariadb-devel MariaDB-server MariaDB-client MariaDB-backup -y
    sudo systemctl enable --now mariadb
    sudo systemctl start mariadb
    systemctl status mariadb
elif [ "$mariadbversion" = "2" ];then
    wget -O /root/Downloads/mariadb_repo_setup https://downloads.mariadb.com/MariaDB/mariadb_repo_setup
    bash /root/Downloads/mariadb_repo_setup --mariadb-server-version=10.4
    sudo dnf install boost-program-options -y
    sudo dnf module reset mariadb -y
    sudo yum -y remove mariadb-libs
    sudo yum -y remove mariadb mariadb-server galera*
    cd /var/lib/ && rm -rfv mysql   
    sudo yum install mariadb mariadb-devel MariaDB-server MariaDB-client MariaDB-backup -y
    sudo systemctl enable --now mariadb
    sudo systemctl start mariadb
    systemctl status mariadb
elif [ "$mariadbversion" = "3" ];then
    wget -O /root/Downloads/mariadb_repo_setup https://downloads.mariadb.com/MariaDB/mariadb_repo_setup
    bash /root/Downloads/mariadb_repo_setup --mariadb-server-version=10.5
    sudo dnf install boost-program-options -y
    sudo dnf module reset mariadb -y
    sudo yum -y remove mariadb-libs
    sudo yum -y remove mariadb mariadb-server galera*
    cd /var/lib/ && rm -rfv mysql   
    sudo yum install mariadb mariadb-devel MariaDB-server MariaDB-client MariaDB-backup -y
    sudo systemctl enable --now mariadb
    sudo systemctl start mariadb
    systemctl status mariadb
elif [ "$mariadbversion" = "4" ];then
    wget -O /root/Downloads/mariadb_repo_setup https://downloads.mariadb.com/MariaDB/mariadb_repo_setup
    bash /root/Downloads/mariadb_repo_setup --mariadb-server-version=10.6
    sudo dnf install boost-program-options -y
    sudo dnf module reset mariadb -y
    sudo yum -y remove mariadb-libs
    sudo yum -y remove mariadb mariadb-server galera*
    cd /var/lib/ && rm -rfv mysql   
    sudo yum install mariadb mariadb-devel MariaDB-server MariaDB-client MariaDB-backup -y
    sudo systemctl enable --now mariadb
    sudo systemctl start mariadb
    systemctl status mariadb
else
    echo "Out of options please choose between 1-4"
fi
;;

42)
#Nodejs & Npm
printf "\nPlease Choose Your Desired Nodejs Version\n\n1-)Nodejs 10 (LTS)\n2-)Nodejs 12 (LTS)\n3-)Nodejs 14 (LTS)\n4-)Nodejs 16 (LTS)\n5-)Nodejs Latest\n6-)Nodejs Latest (LTS)\n\nPlease Select Your Nodejs Version:"
read -r nodejsversion
if [ "$nodejsversion" = "1" ];then
    sudo yum remove -y node*
    sudo yum install -y gcc-c++ make
    curl -fsSL https://rpm.nodesource.com/setup_10.x | bash -
    sudo rm -fr /var/cache/yum/*
    sudo yum clean all    
    sudo yum install -y nodejs
elif [ "$nodejsversion" = "2" ];then
    sudo yum remove -y node*
    sudo yum install -y gcc-c++ make
    sudo curl -fsSL https://rpm.nodesource.com/setup_12.x | bash -
    sudo rm -fr /var/cache/yum/*
    yum clean all    
    sudo yum install -y nodejs
elif [ "$nodejsversion" = "3" ];then
    sudo yum remove -y node*
    sudo yum install -y gcc-c++ make
    sudo curl -fsSL https://rpm.nodesource.com/setup_14.x | bash -
    sudo rm -fr /var/cache/yum/*
    yum clean all    
    sudo yum install -y nodejs
elif [ "$nodejsversion" = "4" ];then
    sudo yum remove -y node*
    sudo yum install -y gcc-c++ make
    curl -fsSL https://rpm.nodesource.com/setup_16.x | bash -
    sudo rm -fr /var/cache/yum/*
    sudo yum clean all
    sudo yum install -y nodejs
elif [ "$nodejsversion" = "5" ];then
    sudo yum remove -y node*
    sudo yum install -y gcc-c++ make
    curl -fsSL https://rpm.nodesource.com/setup_current.x | bash -
    sudo rm -fr /var/cache/yum/*
    sudo yum clean all    
    sudo yum install -y nodejs
elif [ "$nodejsversion" = "6" ];then
    sudo yum remove -y node*
    sudo yum install -y gcc-c++ make
    curl -fsSL https://rpm.nodesource.com/setup_lts.x | bash -
    sudo rm -fr /var/cache/yum/*
    sudo yum clean all    
    sudo yum install -y nodejs
else
    echo "Out of options please choose between 1-6"  
fi
;;
43)
#.NET SDK
printf "\nPlease Choose Your Desired .NET SDK Version\n\n1-).NET SDK 2.1\n2-).NET SDK 2.2\n3-).NET SDK 3.0 \n4-).NET SDK 3.1\n5-).NET SDK 5.0\n6-).NET SDK 6.0\n\nPlease Select Your .NET SDK Version:"
read -r netsdkversion
sudo rpm -Uvh https://packages.microsoft.com/config/centos/7/packages-microsoft-prod.rpm
if [ "$netsdkversion" = "1" ];then
    sudo yum remove dotnet* -y
    sudo yum install dotnet-sdk-2.1 -y
elif [ "$netsdkversion" = "2" ];then
    sudo yum remove dotnet* -y
    sudo yum install dotnet-sdk-2.2 -y
elif [ "$netsdkversion" = "3" ];then
    sudo yum remove dotnet* -y
    sudo yum install dotnet-sdk-3.0 -y
elif [ "$netsdkversion" = "4" ];then
    sudo yum remove dotnet* -y
    sudo yum install dotnet-sdk-3.1 -y
elif [ "$netsdkversion" = "5" ];then
    sudo yum remove dotnet* -y
    sudo yum install dotnet-sdk-5.0 -y
elif [ "$netsdkversion" = "6" ];then
    sudo yum remove dotnet* -y
    sudo yum install dotnet-sdk-6.0 -y
else
    echo "Out of options please choose between 1-6"  
fi
;;
44)
#Tinc
printf "\nPlease Choose Your Desired Tinc Version\n\n1-)Tinc (From Official Repository)\n2-)Tinc Latest Stable(Compile From Source)\n3-)Tinc Latest Pre-Release 1.1(Compile From Source)\n\nPlease Select Your Tinc:"
read -r tincversion
sudo rpm -Uvh https://packages.microsoft.com/config/centos/7/packages-microsoft-prod.rpm
if [ "$tincversion" = "1" ];then
    cd /root/Downloads/tinc-latest && make -j "$core" uninstall
    cd /root/Downloads/tinc-latest-pre && make -j "$core" uninstall
    sudo yum -y remove tinc
    sudo yum -y install tinc
elif [ "$tincversion" = "2" ];then
    cd /root/Downloads/tinc-latest && make -j "$core" uninstall
    cd /root/Downloads/tinc-latest-pre && make -j "$core" uninstall
    sudo yum -y remove tinc
    sudo yum -y install zlib zlib-devel lzo lzo-devel openssl openssl-devel
    tinclatest=$(lynx -dump https://www.tinc-vpn.org/download/ | awk '/http/{print $2}' | grep -iv '.sig\|pre' | grep -i .tar.gz | head -n 1)
    wget -O /root/Downloads/tinc-latest.tar.gz "$tinclatest"
    sudo mkdir -pv /root/Downloads/tinc-latest
    tar -xvf /root/Downloads/tinc-latest.tar.gz -C /root/Downloads/tinc-latest --strip-components 1
    cd /root/Downloads/tinc-latest
    ./configure
    make -j "$core" && make -j "$core" install
    tincd --version
elif [ "$tincversion" = "3" ];then
    cd /root/Downloads/tinc-latest && make -j "$core" uninstall
    cd /root/Downloads/tinc-latest-pre && make -j "$core" uninstall
    sudo yum -y remove tinc
    tinclatestpre=$(lynx -dump https://www.tinc-vpn.org/download/ | awk '/http/{print $2}' | grep -i 'pre' | grep -i .tar.gz | grep -iv .sig | head -n 1)
    wget -O /root/Downloads/tinc-latest-pre.tar.gz "$tinclatestpre"
    sudo mkdir -pv /root/Downloads/tinc-latest-pre
    tar -xvf /root/Downloads/tinc-latest-pre.tar.gz -C /root/Downloads/tinc-latest-pre --strip-components 1
    cd /root/Downloads/tinc-latest-pre
    ./configure
    make -j "$core" && make -j "$core" install
    tincd --version
else
    echo "Out of options please choose between 1-3"
fi
;;
45)
#Zabbix Server
printf "\nPlease Choose Your Desired Zabbix Option\n\n1-)Zabbix Server 4.0 LTS (Mysql & Apache)\n\
2-)Zabbix Server 4.0 LTS (PostgreSQL & Apache)\n3-)Zabbix Server 5.0 LTS (Mysql & Apache)\n\
4-)Zabbix Server 5.0 LTS (Mysql & NGINX)\n5-)Zabbix Server 5.0 LTS (PostgreSQL & Apache)\n\
6-)Zabbix Server 5.0 LTS (PostgreSQL & NGINX)\n\nPlease Select Your Zabbix Option:"
read -r zabbix_option
printf "Please Enter Desired Mysql/PostgreSQL Password:"
read -sr dbpassword
if [ "$zabbix_option" = "1" ];then
    sudo rpm -Uvh https://repo.zabbix.com/zabbix/4.0/rhel/7/x86_64/zabbix-release-4.0-2.el7.noarch.rpm
    sudo yum clean all
    sudo yum -y install zabbix-server-mysql zabbix-web-mysql zabbix-agent
    sudo mysql -uroot -p -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY '12345';"
    sudo systemctl restart mysql.service
    sudo mysql -uroot -p -e "create database zabbix character set utf8 collate utf8_bin;"
    sudo mysql -uroot -p -e "create user zabbix@localhost identified by 'password';"
    sudo mysql -uroot -p -e "grant all privileges on zabbix.* to zabbix@localhost;"
    zcat /usr/share/doc/zabbix-server-mysql*/create.sql.gz | mysql -uzabbix -p zabbix
    sed -i "s/DBPassword=/DBPassword=$dbpassword/g" /etc/zabbix/zabbix_server.conf
    sed -i 's/# php_value date.timezone Europe/Riga/php_value date.timezone UTC/g' /etc/httpd/conf.d/zabbix.conf
    phpconf_date_timezone=$(cat /etc/httpd/conf.d/zabbix.conf | grep -i "php_value date.timezone" | head -n 1)
    sed -i "s/$phpconf_date_timezone/php_value date.timezone UTC/g"
    sudo systemctl restart zabbix-server zabbix-agent httpd
    sudo systemctl enable zabbix-server zabbix-agent httpd
elif [ "$zabbix_option" = "2" ];then
    echo "test"
elif [ "$zabbix_option" = "3" ];then
    echo "test"
elif [ "$zabbix_option" = "4" ];then
    echo "test"
elif [ "$zabbix_option" = "5" ];then
    echo "test"
elif [ "$zabbix_option" = "6" ];then
    echo "test"
else
    echo "Out of options please choose between 1-6"
fi
;;
        esac
    fi
done
