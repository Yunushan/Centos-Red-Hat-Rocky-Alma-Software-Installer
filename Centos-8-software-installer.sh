#!/bin/bash

# Variables
cpuarch=$(uname -m)
core=$(nproc)

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
options=("PHP ${opts[1]}" "Nginx ${opts[2]}" "FFMPEG ${opts[3]}" "GCC ${opts[4]}" "G++ ${opts[5]}" "Cmake ${opts[6]}" "VLC ${opts[7]}"
"Apache2 ${opts[8]}" "Monitoring Tools ${opts[9]}" "Transmission-cli ${opts[10]}" "Nmap ${opts[11]}" "Irssi (IRC) ${opts[12]}" "Timeshift ${opts[13]}" 
"Jenkins ${opts[14]}" "Docker ${opts[15]}" "Weechat 2.6 (IRC) ${opts[16]}" "Quassel (IRC) ${opts[17]}" "Neofetch ${opts[18]}" "GNU Emacs ${opts[19]}" 
"Kubectl ${opts[20]}" "Magic Wormhole ${opts[21]}" "Neovim ${opts[22]}" "OpenJDK 8-11-17 ${opts[23]}" "DVBlast3.4 ${opts[24]}" "OpenSSL ${opts[25]}" 
"Gimp ${opts[26]}" "Linux Kernel ${opts[27]}" "Samba ${opts[28]}" "Mysql ${opts[29]}" "MariaDB ${opts[30]}" "Nodejs & Npm ${opts[31]}" ".NET SDK ${opts[32]}"
"OpenSSH Server ${opts[33]}" "Done ${opts[34]}")
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
            "FFMPEG ${opts[3]}")
                choice 3
                break
                ;;
            "GCC ${opts[4]}")
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
            "Weechat 2.6 (IRC) ${opts[16]}")
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
            "DVBlast3.4 ${opts[24]}")
                choice 24
                break
                ;;
            "OpenSSL ${opts[25]}")
                choice 25
                break
                ;;
            "Gimp ${opts[26]}")
                choice 26
                break
                ;;
            "Linux Kernel ${opts[27]}")
                choice 27
                break
                ;;
            "Samba ${opts[28]}")
                choice 28
                break
                ;;
            "Mysql ${opts[29]}")
                choice 29
                break
                ;;
            "MariaDB ${opts[30]}")
                choice 30
                break
                ;;
            "Nodejs & Npm ${opts[31]}")
                choice 31
                break
                ;;
            ".NET SDK ${opts[32]}")
                choice 32
                break
                ;;
            "OpenSSH Server ${opts[33]}")
                choice 33
                break
                ;;
            "Done ${opts[34]}")
                break 2
                ;;
            *) printf '%s\n' 'Please Choose Between 1-34';;
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
while [ $value -lt 600 ]
do
value=$((value+20))
printf "."
sleep 0.05
done
printf "\n"


#Necessary Packages
#sudo yum -y update
sudo yum -y install epel-release
sudo yum -y install dnf-plugins-core
sudo yum config-manager --set-enabled powertools
sudo yum -y install lynx wget curl mlocate nano snapd git make
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
sudo echo 'export PATH="$PATH:/snap/bin/"' >> /etc/profile
source /etc/profile
printf "\n"

# Downloaded tmp files
if [ -d "/root/Downloads" ];then
:
else
sudo mkdir -pv /root/Downloads
fi

# INSTALLATION BY SELECTION

for opt in "${!opts[@]}"
do
    if [[ ${opts[opt]} ]]
    then
        case $opt in 

1)
# 1) PHP
sudo yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
sudo yum -y install https://rpms.remirepo.net/enterprise/remi-release-8.rpm
sudo yum -y install yum-utils 
printf "\nPlease Choose Your Desired PHP Version\n\n1-)PHP5.6\n2-)PHP7.0\n3-)PHP7.1\n4-)PHP7.2\n5-)PHP7.3\n6-)PHP7.4\n7-)PHP8.0\n8-)PHP8.1\n\nPlease Select Your PHP Version:"
read -r phpversion
if [ "$phpversion" = "1" ];then
    sudo yum -y module install php:remi-5.6
elif [ "$phpversion" = "2" ];then
    sudo yum -y module install php:remi-7.0
elif [ "$phpversion" = "3" ];then
    sudo yum -y module install php:remi-7.1
elif [ "$phpversion" = "4" ];then
    sudo yum -y module install php:remi-7.2
elif [ "$phpversion" = "5" ];then
    sudo yum -y module install php:remi-7.3
elif [ "$phpversion" = "6" ];then
    sudo yum -y module install php:remi-7.4
elif [ "$phpversion" = "7" ];then
    sudo yum -y module install php:remi-8.0
elif [ "$phpversion" = "8" ];then
    sudo yum -y module install php:remi-8.1
else
    echo "Out of options please choose between 1-8"
    :
sudo yum install php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo -y
fi
printf "\nPHP Installation Has Finished\n\n"
;;

2)
#NGINX

#OpenSSL Installation Section
printf "\nPlease Choose Your Desired OpenSSL Version\n\n1-)OpenSSL 1.1.1k (Official Package)\n2-)OpenSSL 3.0\n3-)OpenSSL Latest(Compile From Source)\n\nPlease Select Your OpenSSL Version:"
read -r opensslversion
if [ "$opensslversion" = "1" ];then
    sudo yum -y install openssl-devel
elif [ "$opensslversion" = "2" ];then
    sudo yum -y install openssl3 openssl3-devel openssl3-libs
elif [ "$opensslversion" = "3" ];then
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
mkdir -pv /root/Downloads/nginx_latest
wget -O /root/Downloads/nginx_latest/nginx_latest.tar.gz "$nginx_latest"
tar -xvf /root/Downloads/nginx_latest/nginx_latest.tar.gz -C /root/Downloads/nginx-latest --strip-components 1
cd /root/Downloads/nginx_latest
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
printf "\nPlease Choose Your Desired FFmpeg Version\n\n1-)FFmpeg Stable\n2-)FFmpeg Latest (Edge)\n\nPlease Select Your FFMPEG Version:"
read -r ffmpegversion
if [ "$ffmpegversion" = "1" ];then
    sudo snap install ffmpeg
    printf "\nFFmpeg Stable Installation Has Finished\n\n"
elif [ "$ffmpegversion" = "2" ];then
    sudo snap install ffmpeg --edge
    printf "\nFFmpeg Latest (Edge) Installation Has Finished\n\n"
else
    echo "Out of option(s) please choose between 1-2"
    :
fi
;;

4)
#GCC8.5 - Latest Compile From Source
printf "\nPlease Choose Your Desired GCC Version\n\n1-)GCC 8.5\n2-)GCC Latest (Compile From Source)\n\nPlease Select Your GCC Version:"
read -r gccversion
if [ "$gccversion" = "1" ];then
    sudo yum -y install gcc 
    printf "\nGCC 8.5 Installation Has Finished\n\n"
elif [ "$gccversion" = "2" ];then
    sudo yum -y install gcc gcc-c++
    gcc_latest=$(lynx -dump https://ftp.gnu.org/gnu/gcc/ | awk '{print $2}' | grep -iv '.tar.gz\|readme\|hpux\|.diff.gz' | tail -n 1)
    gcc_latest=$(lynx -dump "$gcc_latest" | awk '{print $2}' | grep -i .tar.gz | grep -iv .sig | grep -i .tar.gz | head -n 1)
    sudo wget -O /root/Downloads/gcc-latest.tar.gz "$gcc_latest"
    sudo mkdir -pv /root/Downloads/gcc-latest
    tar xvf /root/Downloads/gcc-latest.tar.gz -C /root/Downloads/gcc-latest --strip-components 1
    cd /root/Downloads/gcc-latest
    contrib/download_prerequisites
    sudo mkdir -pv /root/Downloads/gcc-latest/gcc-latest-build
    cd /root/Downloads/gcc-latest/gcc-latest-build
    ../configure --enable-languages=c,c++ --disable-multilib
    make -j "$core"
    make install
    export PATH=/usr/local/bin:$PATH
    export LD_LIBRARY_PATH=/usr/local/lib64:$LD_LIBRARY_PATH
    printf "\nGCC Latest Installation Has Finished\n\n"
fi
;;

5)
#G++
sudo yum -y install gcc-c++ 
printf "\nG++ Installation Has Finished\n\n"
;;

6)
#Cmake
printf "\nPlease Choose Your Desired Installation Version\n\n1-)Cmake (From Official Repository) \n2-)Cmake (snap)(Newer version)\n\nPlease Select Your Cmake Version:"
read -r cmakeversion
if [ "$cmakeversion" = "1" ];then
    sudo yum -y install cmake 
    printf "\nCmake Installation Has Finished\n\n"
elif [ "$cmakeversion" = "2" ];then
    sudo snap install cmake --classic
    printf "\nCmake Installation Has Finished\n\n"
fi
;;

7)
#VLC
sudo yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
sudo yum -y install https://download1.rpmfusion.org/free/el/rpmfusion-free-release-8.noarch.rpm
printf "\nPlease Choose Your Desired VLC Version\n\n1-)VLC\n2-)VLC Core(Terminal Only)\n"
read -r vlcversion
if [ "$vlcversion" = "1" ];then
    sudo yum -y install vlc python-vlc
    sudo sed -i 's/geteuid/getppid/' /usr/bin/vlc
    printf "\nVLC Installation Has Finished\n\n"
elif [ "$vlcversion" = "2" ];then
    sudo yum -y install vlc-core
    sudo sed -i 's/geteuid/getppid/' /usr/bin/vlc
    printf "\nVLC Core Installation Has Finished\n\n"
fi
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
    :
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
sudo yum -y install htop iftop atop powertop iotop apachetop
printf "\nMonitoring Tools Installation Has Finished\n\n"
;;

10)
#Transmission
sudo wget -O /root/Downloads/geekery-release-8-2.noarch.rpm http://geekery.altervista.org/geekery/el8/x86_64/geekery-release-8-2.noarch.rpm
sudo yum -y install /root/Downloads/geekery-release-8-2.noarch.rpm
sudo yum -y install transmission
sudo systemctl start transmission-daemon.service
printf "\nTransmission Installation Has Finished\n\n"
;;

11)
#Nmap
sudo yum -y install nmap
printf "\nNmap Installation Has Finished\n\n"
;;

12)
#Irssi (IRC)
printf "\nPlease Choose Your Desired Irssi Version\n\n1-)Irssi (From Official Repository) \n2-)Irssi (snap)(Newer version)\n\nPlease Select Your Irssi Version:"
read -r irssiversion
if [ "$irssiversion" = "1" ];then
    sudo yum -y install irssi
    printf "\nIrssi (From Official Repository) Installation Has Finished\n\n"
elif [ "$irssiversion" = "2" ];then
    sudo snap install irssi
    printf "\nIrssi (snap)(Newer version) Installation Has Finished\n\n"
fi
;;

13)
#Timeshift
sudo yum install cairo-gobject gtk3 libgee gnutls vte291 -y
wget -O /root/Downloads/timeshift-20.03-1.el7.x86_64.rpm https://download-ib01.fedoraproject.org/pub/epel/7/x86_64/Packages/t/timeshift-20.03-1.el7.x86_64.rpm
sudo rpm -ivh /root/Downloads/timeshift-20.03-1.el7.x86_64.rpm
yum install timeshift -y
printf "\nTimeshift Installation Has Finished\n\n"
;;

14)
#Jenkins
sudo yum -y install java-1.8.0-openjdk
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum -y install jenkins 
sudo systemctl start jenkins.service
sudo systemctl enable jenkins.service
sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp
sudo firewall-cmd --reload
printf "\nJenkins Installation Has Finished\n\n"
;;

15)
#Docker
sudo yum install -y yum-utils
sudo yum install -y https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.6-3.3.el7.x86_64.rpm
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install docker-ce --nobest docker-ce-cli containerd.io -y
systemctl start docker
systemctl enable docker
systemctl status docker
#printf "\nDocker Installation Has Finished\n\n"
;;

16)
#Weechat 2.6 (IRC)
sudo yum -y install cmake make gcc libgcrypt-devel zlib-devel gnutls-devel libcurl-devel perl ncurses-devel ruby-devel tcl-devel
sudo wget -O /root/Downloads/weechat-2.6.tar.gz https://weechat.org/files/src/weechat-2.6.tar.gz
cd /root/Downloads/
sudo mkdir -pv /root/Downloads/weechat-2.6/
tar xvf /root/Downloads/weechat-2.6.tar.gz -C /root/Downloads/weechat-stable/ --strip-components 1
cd /root/Downloads/weechat-2.6/
sudo mkdir -pv build
cd build
sudo cmake ..
sudo make -j8
sudo make install
printf "\nWeechat 2.6 (IRC) Installation Has Finished\n\n"
;;

17)
#Quassel (IRC)
sudo snap install quassel-kalikiana
printf "\nQuassel (IRC) Installation Has Finished\n\n"
;;

18)
#Neofetch
sudo yum -y install dnf-plugins-core
curl -o /etc/yum.repos.d/konimex-neofetch-epel-7.repo https://copr.fedorainfracloud.org/coprs/konimex/neofetch/repo/epel-7/konimex-neofetch-epel-7.repo
sudo yum -y install neofetch
printf "\nNeofetch Installation Has Finished\n\n"
;;

19)
#Emacs
sudo yum -y install emacs
printf "\nEmacs Installation Has Finished\n\n"
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
sudo yum -y install kubelet kubeadm kubectl 
sudo systemctl start kubelet 
sudo systemctl enable kubelet
printf "\n"
kubectl version
printf "\nKubectl Installation Has Finished\n\n"
;;

21)
#Magic Wormhole
sudo yum -y install python3-pip python3-devel
sudo pip3 install magic-wormhole
printf "\nMagic Wormhole Installation Has Finished \n\n"
;;

22)
#Neovim
printf "\nPlease Choose Your Desired Neovim Version\n\n1-)Neovim Kalikiana (Snap) \n2-)Install Neovim From Source (Newer version)\n\nPlease Select Your Neovim Version:"
read -r neovimversion
if [ "$neovimversion" = "1" ];then
    sudo snap install neovim-kalikiana
    printf "\nNeovim Kalikiana (Snap)\n\n"
elif [ "$neovimversion" = "2" ];then
    sudo yum -y install gcc-c++ automake libtool gcc cmake make
    neovimstable=$(lynx -dump https://github.com/neovim/neovim/releases/ | awk '{print $2}' | grep 'stable\|.tar.gz' | grep -v 'macos\|linux' | head -n 1)
    sudo wget -O /root/Downloads/neovim-stable.tar.gz "$neovimstable"
    sudo mkdir -pv /root/Downloads/neovim-stable/
    tar xvf /root/Downloads/neovim-stable.tar.gz -C /root/Downloads/neovim-stable/ --strip-components 1
    cd /root/Downloads/neovim-stable/
    mkdir -p "$HOME"/opt
    make CMAKE_INSTALL_PREFIX="$HOME"/opt install
    make install
    printf "\n Neovim From Source (Newer version) Installation Has Finished\n\n"
fi
;;

23)
#OpenJDK 8-11-17 JDK
printf "\nPlease Choose Your Desired OpenJDK Version\n\n1-)OpenJDK 8 \n2-)OpenJDK 11\n3-)OpenJDK 17\n\nPlease Select Your OpenJDK Version:"
read -r openjdkversion
if [ "$openjdkversion" = "1" ];then
    sudo yum remove java-11-openjdk-devel -y
    sudo yum remove java-17-openjdk-devel -y
    sudo yum install java-1.8.0-openjdk-devel -y
    printf "\nOpenJDK 8 JDK Installation Has Finished \n\n"
elif [ "$openjdkversion" = "2" ];then
    sudo yum remove java-17-openjdk-devel -y
    sudo yum remove  java-1.8.0-openjdk-devel -y
    sudo yum install java-11-openjdk-devel -y
    printf "\nOpenJDK 11 JDK Installation Has Finished \n\n"
elif [ "$openjdkversion" = "3" ];then
    sudo yum remove  java-1.8.0-openjdk-devel -y
    sudo yum remove java-11-openjdk-devel -y
    sudo yum install java-17-openjdk-devel -y
    printf "\nOpenJDK 17 JDK Installation Has Finished \n\n"
else
    echo "Out of options please choose between 1-3"
    :
fi
;;

24)
#DVBlast 3.4
sudo yum -y install gcc make libev-devel 
sudo git clone https://github.com/gfto/bitstream.git /root/Downloads/bitstream
cd /root/Downloads/bitstream/
make install
sudo wget -O /root/Downloads/dvblast3.4.tar.gz https://github.com/videolan/dvblast/archive/3.4.tar.gz
sudo mkdir -pv /root/Downloads/dvblast3.4
sudo tar xvf /root/Downloads/dvblast3.4.tar.gz -C /root/Downloads/dvblast3.4/ --strip-components 1
cd /root/Downloads/dvblast3.4/
make
make install
printf "\nDVBlast 3.4 Installation Has Finished \n\n"
;;

25)
# OpenSSL
printf "\nPlease Choose Your Desired OpenSSL Version\n\n1-)OpenSSL 1.1.1 (Official Package)\n2-)OpenSSL Latest (Compile From Source)\n\nPlease Select Your OpenSSL Version:"
read -r opensslversion
if [ "$opensslversion" = "1" ];then
    sudo install openssl-devel -y
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
printf "\nOpenSSL Installation Has Finished \n\n"
;;

26)
#Gimp
yum install epel-release -y
yum install snapd -y
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
sudo echo 'export PATH="$PATH:/snap/bin/"' >> /etc/profile
source /etc/profile
snap install gimp
;;

27)
#Linux Kernel
printf "\nPlease Choose Your Desired Kernel Version\n\n1-)Mainline Kernel (Latest)\n2-)Longterm Kernel (LTS)\n\nPlease Select Your Linux Kernel Version:"
read -r kernelversion
if [ "$kernelversion" = "1" ];then
    sudo yum --enablerepo=elrepo-kernel install kernel-ml -y
elif [ "$kernelversion" = "2" ];then
    sudo yum --enablerepo=elrepo-kernel install kernel-lt -y
else
    echo "Out of options please choose between 1-2"
    :
fi
grub2-set-default 0
grub2-mkconfig -o /etc/grub2.cfg
sudo yum install bash-completion -y
#sudo yum update kernel -y # To Update Linux Kernel
printf "\nLinux Kernel Installation Has Finished To Apply New Kernel Please Reboot The Server.\n\n"
;;

28)
#Samba
printf "\nPlease Choose Your Desired Samba Version\n\n1-)Samba Official\n2-)Samba From Compile From Source (Latest)\n\nPlease Select Your Samba Version:"
read -r sambaversion
if [ "$sambaversion" = "1" ];then
    sudo yum samba samba-common samba-client -y
    systemctl enable smb
    systemctl start smb
    systemctl status smb
elif [ "$sambaversion" = "2" ];then
    sudo yum install docbook-style-xsl gcc gdb gnutls-devel gpgme-devel jansson-devel \
      keyutils-libs-devel krb5-workstation libacl-devel libaio-devel \
      libarchive-devel libattr-devel libblkid-devel libtasn1 libtasn1-tools \
      libxml2-devel libxslt lmdb-devel openldap-devel pam-devel perl \
      perl-ExtUtils-MakeMaker perl-Parse-Yapp popt-devel python3-cryptography \
      python3-dns python3-gpg python36-devel readline-devel rpcgen systemd-devel \
      tar zlib-devel -y
    sudo yum install dnf-plugins-core cups-devel -y
    samba_latest=$(lynx -dump https://download.samba.org/pub/samba/ | awk '{print $2}' | grep -i samba-latest.tar.gz | head -n 1)
    wget -O /root/Downloads/samba-latest.tar.gz "$samba_latest"
    sudo mkdir -pv /root/Downloads/samba-latest
    tar -xzvf /root/Downloads/samba-latest.tar.gz -C /root/Downloads/samba-latest --strip-components 1
    cd /root/Downloads/samba-latest
    ./configure --sbindir=/sbin/ \
        --prefix=/usr \
        --enable-fhs \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --with-privatedir=/var/lib/samba/private \
        --with-smbpasswd-file=/etc/samba/smbpasswd \
        --with-piddir=/var/run/samba \
        --with-pammodulesdir=/lib/x86_64-linux-gnu/security \
        --libdir=/usr/lib/x86_64-linux-gnu \
        --with-modulesdir=/usr/lib/x86_64-linux-gnu/samba \
        --datadir=/usr/share \
        --with-lockdir=/var/run/samba \
        --with-statedir=/var/lib/samba \
        --with-cachedir=/var/cache/samba \
        --with-socketpath=/var/run/ctdb/ctdbd.socket \
        --with-logdir=/var/log/ctdb \
        --systemd-install-services \
        --with-systemd \
        --without-ad-dc
    make -j "$core" && make -j "$core" install
    export PATH=/usr/local/samba/bin/:/usr/local/samba/sbin/:$PATH
    ln -s /root/Downloads/samba-latest/bin/default/packaging/systemd/smb.service /etc/systemd/system/smbd.service
else
    echo "Out of options please choose between 1-2"
    :
fi
printf "\nLinux Kernel Installation Has Finished To Apply New Kernel Please Reboot The Server.\n\n"
;;

29)
#Mysql
printf "\nPlease Choose Your Desired Mysql Version\n\n1-)Mysql 8.0\n2-)Mysql 5.7\n3-)Mysql 5.6\n4-)Mysql 5.5\n\nPlease Select Your Mysql Version:"
read -r mysqlversion
if [ "$mysqlversion" = "1" ];then
    sudo dnf remove @mysql -y
    sudo dnf module reset mysql -y && sudo dnf module disable mysql -y
    echo "" > /etc/yum.repos.d/mysql-community.repo
    sudo dnf config-manager --disable mysql57-community
    sudo dnf config-manager --disable mysql56-community
    sudo dnf config-manager --disable mysql55-community
    if ! command -v mysql &> /dev/null;then
        echo "Installing Mysql"
        sudo yum module enable mysql -y
        sudo yum install mysql-devel mysql-server -y
    else
        printf "\nDifferent Mysql Version Detected To Install Mysql You Must Uninstall Different Version First (y/n):"
        read -r mysql_uninstall_verify
        if [ "$mysql_uninstall_verify" = "Y" ] || [ "$mysql_uninstall_verify" = "y" ];then
            echo "Uninstalling mysql"
            sudo yum remove mysql-community-server mysql-devel mysql-server -y
        else
            :
        fi
    fi
    sudo yum module enable mysql -y
    sudo yum install mysql-devel mysql-server -y
    systemctl start mysqld
    systemctl enable mysqld
    systemctl status mysqld
elif [ "$mysqlversion" = "2" ];then
    sudo dnf remove @mysql -y
    sudo dnf module reset mysql -y && sudo dnf module disable mysql -y
echo "[mysql57-community]
name=MySQL 5.7 Community Server
baseurl=http://repo.mysql.com/yum/mysql-5.7-community/el/7/$cpuarch/
enabled=1
gpgcheck=0

[mysql-connectors-community]
name=MySQL Connectors Community
baseurl=http://repo.mysql.com/yum/mysql-connectors-community/el/7/$cpuarch/
enabled=1
gpgcheck=0

[mysql-tools-community]
name=MySQL Tools Community
baseurl=http://repo.mysql.com/yum/mysql-tools-community/el/7/$cpuarch/
enabled=1
gpgcheck=0" > /etc/yum.repos.d/mysql-community.repo
    if ! command -v mysql &> /dev/null;then
        echo "Installing Mysql"
        sudo yum module enable mysql -y
        sudo yum install mysql-community-server -y
    else
        printf "\nDifferent Mysql Version Detected To Install Mysql You Must Uninstall Different Version First (y/n):"
        read -r mysql_uninstall_verify
        if [ "$mysql_uninstall_verify" = "Y" ] || [ "$mysql_uninstall_verify" = "y" ];then
            echo "Uninstalling mysql"
            sudo yum remove mysql-community-server mysql-devel mysql-server -y
        else
            :
        fi
    fi
    sudo yum install mysql-community-server -y
    sudo dnf config-manager --disable mysql80-community
    sudo dnf config-manager --enable mysql57-community
    sudo dnf config-manager --disable mysql56-community
    sudo dnf config-manager --disable mysql55-community
    sudo yum install mysql-community-server -y
    systemctl enable --now mysqld.service
    sudo systemctl restart mysqld
    printf "\nMysql 5.7 Installation Has Finished.\n\n"
elif [ "$mysqlversion" = "3" ];then
    sudo dnf remove @mysql -y
    sudo dnf module reset mysql -y && sudo dnf module disable mysql -y
echo "# Enable to use MySQL 5.6
[mysql56-community]
name=MySQL 5.6 Community Server
baseurl=http://repo.mysql.com/yum/mysql-5.6-community/el/7/$cpuarch/
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-mysql" > /etc/yum.repos.d/mysql-community.repo
    sudo yum module disable mysql -y
    sudo dnf config-manager --disable mysql80-community
    sudo dnf config-manager --disable mysql57-community
    sudo dnf config-manager --enable mysql56-community
    sudo dnf config-manager --disable mysql55-community
    if ! command -v mysql &> /dev/null;then
        echo "Installing Mysql"
        sudo yum install mysql-community-server -y
    else
        printf "\nDifferent Mysql Version Detected To Install Mysql You Must Uninstall Different Version First (y/n):"
        read -r mysql_uninstall_verify
        if [ "$mysql_uninstall_verify" = "Y" ] || [ "$mysql_uninstall_verify" = "y" ];then
            echo "Uninstalling mysql"
            sudo yum remove mysql-community-server mysql-devel mysql-server -y
        else
            :
        fi
    fi
    auditctl -w /etc/shadow -p w
    ausearch -m avc -ts recent
    ausearch -c 'mysqld_safe' --raw | audit2allow -O /root/ -M my-mysqldsafe
    semodule -X 300 -i my-mysqldsafe.pp
    sudo rm -f my-mysqldsafe.te my-mysqldsafe.pp

    sudo yum install mysql-community-server -y
    #systemctl start mysqld
    #systemctl enable mysqld
    systemctl status mysqld
    printf "\nMysql 5.6 Installation Has Finished.\n\n"
elif [ "$mysqlversion" = "4" ];then
echo "# Enable to use MySQL 5.5
[mysql55-community]
name=MySQL 5.5 Community Server
baseurl=http://repo.mysql.com/yum/mysql-5.5-community/el/7/$cpuarch/
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-mysql" > /etc/yum.repos.d/mysql-community.repo
    sudo yum module disable mysql -y
    sudo dnf config-manager --disable mysql80-community
    sudo dnf config-manager --disable mysql57-community
    sudo dnf config-manager --disable mysql56-community
    sudo dnf config-manager --enable mysql55-community
    if ! command -v mysql &> /dev/null;then
        echo "Installing Mysql"
        sudo yum install mysql-community-server -y
    else
        printf "\nDifferent Mysql Version Detected To Install Mysql You Must Uninstall Different Version First (y/n):"
        read -r mysql_uninstall_verify
        if [ "$mysql_uninstall_verify" = "Y" ] || [ "$mysql_uninstall_verify" = "y" ];then
            echo "Uninstalling mysql"
            sudo yum remove mysql-community-server mysql-devel mysql-server -y
        else
            :
        fi
    fi
    sudo yum install mysql-community-server -y
    #systemctl start mysqld
    #systemctl enable mysqld
    systemctl status mysqld
    printf "\nMysql 5.5 Installation Has Finished.\n\n"
else
    echo "Out of options please choose between 1-4"
fi
;;
30)
#MariaDB
printf "\nPlease Choose Your Desired MariaDB Version\n\n1-)MariaDB 10.3 (Official Repo)\n2-)MariaDB 10.4\n3-)MariaDB 10.5\n4-)MariaDB 10.6\n\nPlease Select Your MariaDB Version:"
read -r mariadbversion
if [ "$mariadbversion" = "1" ];then
    wget -O /root/Downloads/mariadb_repo_setup https://downloads.mariadb.com/MariaDB/mariadb_repo_setup
    bash /root/Downloads/mariadb_repo_setup --mariadb-server-version=10.3
    sudo dnf install boost-program-options -y
    sudo dnf module reset mariadb -y
    sudo yum install mariadb mariadb-devel MariaDB-server MariaDB-client MariaDB-backup -y
    sudo systemctl enable --now mariadb
    sudo systemctl start mariadb 
elif [ "$mariadbversion" = "2" ];then
    wget -O /root/Downloads/mariadb_repo_setup https://downloads.mariadb.com/MariaDB/mariadb_repo_setup
    sudo bash /root/Downloads/mariadb_repo_setup --mariadb-server-version=10.4
    sudo dnf install boost-program-options -y
    sudo dnf module reset mariadb -y
    sudo yum install MariaDB-server MariaDB-client MariaDB-backup -y
    sudo systemctl enable --now mariadb
    sudo systemctl start mariadb
elif [ "$mariadbversion" = "3" ];then
    wget -O /root/Downloads/mariadb_repo_setup https://downloads.mariadb.com/MariaDB/mariadb_repo_setup
    sudo bash /root/Downloads/mariadb_repo_setup --mariadb-server-version=10.5
    sudo dnf install boost-program-options -y
    sudo dnf module reset mariadb -y
    sudo yum install MariaDB-server MariaDB-client MariaDB-backup -y
    sudo systemctl enable --now mariadb
    sudo systemctl start mariadb
elif [ "$mariadbversion" = "4" ];then
    wget -O /root/Downloads/mariadb_repo_setup https://downloads.mariadb.com/MariaDB/mariadb_repo_setup
    sudo bash /root/Downloads/mariadb_repo_setup --mariadb-server-version=10.6
    sudo dnf install boost-program-options -y
    sudo dnf module reset mariadb -y
    sudo yum install MariaDB-server MariaDB-client MariaDB-backup -y
    sudo systemctl enable --now mariadb
    sudo systemctl start mariadb 
else
    echo "Out of options please choose between 1-4"  
fi
;;
31)
#Nodejs & Npm
printf "\nPlease Choose Your Desired Nodejs Version\n\n1-)Nodejs 10 (Official Repo)\n2-)Nodejs 12\n3-)Nodejs 14\n4-)Nodejs 16\n\nPlease Select Your Nodejs Version:"
read -r nodejsversion
if [ "$nodejsversion" = "1" ];then
    sudo yum remove nodejs -y
    sudo dnf module disable nodejs:12 -y
    sudo dnf module disable nodejs:14 -y
    sudo dnf module disable nodejs:16 -y
    sudo dnf module enable nodejs:10 -y
    sudo yum install nodejs -y
    node --version
elif [ "$nodejsversion" = "2" ];then
    sudo yum remove nodejs -y
    sudo dnf module disable nodejs:10 -y
    sudo dnf module disable nodejs:14 -y
    sudo dnf module disable nodejs:16 -y
    sudo dnf module enable nodejs:12 -y
    sudo yum install nodejs -y
    node --version
elif [ "$nodejsversion" = "3" ];then
    sudo yum remove nodejs -y
    sudo dnf module disable nodejs:10 -y
    sudo dnf module disable nodejs:12 -y
    sudo dnf module disable nodejs:16 -y
    sudo dnf module enable nodejs:14 -y
    sudo yum install nodejs -y
    node --version
elif [ "$nodejsversion" = "4" ];then
    sudo yum remove nodejs -y
    sudo dnf module disable nodejs:10 -y
    sudo dnf module disable nodejs:12 -y
    sudo dnf module disable nodejs:14 -y
    sudo dnf module enable nodejs:16 -y
    sudo yum install nodejs -y
    node --version
else
    echo "Out of options please choose between 1-4"  
fi
;;
32)
#.NET SDK
printf "\nPlease Choose Your Desired .NET SDK Version\n\n1-).NET SDK 2.1\n2-).NET SDK 3.0\n3-).NET SDK 3.1\n4-).NET SDK 5.0\n5-).NET SDK 6.0\n\nPlease Select Your Nodejs Version:"
read -r netsdkversion
if [ "$netsdkversion" = "1" ];then
    sudo yum remove dotnet* -y
    sudo yum install dotnet-sdk-2.1 -y
elif [ "$netsdkversion" = "2" ];then
    sudo yum remove dotnet* -y
    sudo yum install dotnet-sdk-3.0 -y
elif [ "$netsdkversion" = "3" ];then
    sudo yum remove dotnet* -y
    sudo yum install dotnet-sdk-3.1 -y
elif [ "$netsdkversion" = "4" ];then
    sudo yum remove dotnet* -y
    sudo yum install dotnet-sdk-5.0 -y
elif [ "$netsdkversion" = "5" ];then
    sudo yum remove dotnet* -y
    sudo yum install dotnet-sdk-6.0 -y
else
    echo "Out of options please choose between 1-4"  
fi
;;

33)
#OpenSSH Server
printf "\nPlease Choose Your Desired OpenSSH Version \n\n1-)OpenSSH Server (Official Package)\n2-)OpenSSH Latest (Compile From Source)\n\nPlease Select Your OpenSSH Version:"
read -r opensshversion
if [ "$opensshversion" = "1" ];then
    cd /root/Downloads/openssh-latest
    make -j "$core" uninstall
    sudo yum -y install openssh openssh-clients openssh-server 
elif [ "$opensshversion" = "2" ];then
    #sudo yum -y remove openssh*
    sudo yum -y install gcc zlib zlib-devel compat-openssl10 openssl openssl-devel
    sudo mkdir -pv /root/Downloads/openssh-latest
    opensshlatest=$(lynx -dump https://www.openssh.com/releasenotes.html | awk '/http/{print $2}' | grep -i p1.tar.gz | head -n 1)
    wget -O /root/Downloads/openssh-latest.tar.gz $opensshlatest
    tar -xvf /root/Downloads/openssh-latest.tar.gz -C /root/Downloads/openssh-latest --strip-components 1
    cd /root/Downloads/openssh-latest
    ./configure --prefix=/usr                            \
            --sysconfdir=/etc/ssh                    \
            --with-md5-passwords                     \
            --with-privsep-path=/var/lib/sshd        \
            --with-default-path=/usr/bin             \
            --with-superuser-path=/usr/sbin:/usr/bin \
            --with-pid-dir=/run
    make -j "$core" && make -j "$core" install
    install -v -m755    contrib/ssh-copy-id /usr/bin
    install -v -m644    contrib/ssh-copy-id.1 /usr/share/man/man1
    install -v -m755 -d /usr/share/doc/openssh-8.8p1
    install -v -m644    INSTALL LICENCE OVERVIEW README* /usr/share/doc/openssh-8.8p1
    chmod 600 ~/.ssh/id_rsa
    chmod 600 /etc/ssh/ssh_host_rsa_key
    chmod 600 /etc/ssh/ssh_host_ecdsa_key
    chmod 600 /etc/ssh/ssh_host_ed25519_key
    echo "PermitRootLogin yes" >> /etc/ssh/ssh_config
    #make install-sshd
else
    echo "Out of options please choose between 1-2"  
fi
;;
        esac
    fi
done