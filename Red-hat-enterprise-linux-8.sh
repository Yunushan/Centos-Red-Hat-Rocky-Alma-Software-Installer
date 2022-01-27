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
options=("PHP ${opts[1]}" "Grub Customizer ${opts[2]}" "Python ${opts[3]}" "WineHQ Latest ${opts[4]}" "FFmpeg ${opts[5]}" 
"Apache ${opts[6]}" "Transmission ${opts[7]}" "Nmap ${opts[8]}" "Nginx ${opts[9]}" "Redis ${opts[10]}" 
"OpenSSL ${opts[11]}" "OpenSSH ${opts[12]}" "GoCD ${opts[13]}" "OpenJDK 8-11-17 ${opts[14]}" "DVBlast 3.4 ${opts[15]}" 
"Linux Kernel ${opts[16]}" "Samba ${opts[17]}" "Mysql ${opts[18]}" "Mysql Router ${opts[19]}" 
"Ruby ${opts[20]}" "Flutter ${opts[21]}" "Zabbix Server ${opts[22]}" "UrBackup Server ${opts[23]}" 
"MariaDB ${opts[24]}" "PostgreSQL ${opts[25]}" "Postman ${opts[26]}" "Docker ${opts[27]}" 
"Jenkins ${opts[28]}" "Nodejs & Npm ${opts[29]}" "Tinc ${opts[30]}" "Irssi ${opts[31]}" "Done ${opts[32]}")
    select opt in "${options[@]}"
    do
        case $opt in
            "PHP ${opts[1]}")
                choice 1
                break
                ;;
            "Grub Customizer ${opts[2]}")
                choice 2
                break
                ;;
            "Python ${opts[3]}")
                choice 3
                break
                ;;
            "WineHQ Latest ${opts[4]}")
                choice 4
                break
                ;;
            "FFmpeg ${opts[5]}")
                choice 5
                break
                ;;
            "Apache ${opts[6]}")
                choice 6
                break
                ;;
            "Transmission ${opts[7]}")
                choice 7
                break
                ;;
            "Nmap ${opts[8]}")
                choice 8
                break
                ;;
            "Nginx ${opts[9]}")
                choice 9
                break
                ;;
            "Redis ${opts[10]}")
                choice 10
                break
                ;;
            "OpenSSL ${opts[11]}")
                choice 11
                break
                ;;
            "OpenSSH ${opts[12]}")
                choice 12
                break
                ;;
            "GoCD ${opts[13]}")
                choice 13
                break
                ;;
            "OpenJDK 8-11-17 ${opts[14]}")
                choice 14
                break
                ;;
            "DVBlast 3.4 ${opts[15]}")
                choice 15
                break
                ;;
            "Linux Kernel ${opts[16]}")
                choice 16
                break
                ;;
            "Samba ${opts[17]}")
                choice 17
                break
                ;;
            "Mysql ${opts[18]}")
                choice 18
                break
                ;;
            "Mysql Router ${opts[19]}")
                choice 19
                break
                ;;
            "Ruby ${opts[20]}")
                choice 20
                break
                ;;
            "Flutter ${opts[21]}")
                choice 21
                break
                ;;
            "Zabbix Server ${opts[22]}")
                choice 22
                break
                ;;
            "UrBackup Server ${opts[23]}")
                choice 23
                break
                ;;
            "MariaDB ${opts[24]}")
                choice 24
                break
                ;;
            "PostgreSQL ${opts[25]}")
                choice 25
                break
                ;;
            "Postman ${opts[26]}")
                choice 26
                break
                ;;
            "Docker ${opts[27]}")
                choice 27
                break
                ;;
            "Jenkins ${opts[28]}")
                choice 28
                break
                ;;
            "Nodejs & Npm ${opts[29]}")
                choice 29
                break
                ;;
            "Tinc ${opts[30]}")
                choice 30
                break
                ;;
            "Irssi ${opts[31]}")
                choice 31
                break
                ;;
            "Done ${opts[32]}")
                break 2
                ;;
            *) printf '%s\n' 'Please Choose Between 1-32';;
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
subscription-manager repos --enable codeready-builder-for-rhel-8-"$(arch)"-rpms
sudo dnf -vy install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
sudo dnf -vy install yum-utils dnf-utils
sudo dnf -vy install --nogpgcheck https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-8.noarch.rpm \
https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-8.noarch.rpm
sudo dnf -vy install wget curl mlocate nano lynx net-tools git iftop htop snapd bash-completion make cmake \
bind-utils iotop powertop atop bzip2 bzip2-devel bzip2-libs
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
export PATH=$PATH:/snap/bin
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
#PHP 7.2 - 8.1
sudo dnf -vy install https://rpms.remirepo.net/enterprise/remi-release-8.rpm
printf "\nPlease Choose Your Desired PHP Version\n\n1-)PHP 7.2\n2-)PHP 7.3\n3-)PHP 7.4\n4-)PHP 8.0\n5-)PHP 8.1\
\n\nPlease Select Your PHP Version:"
read phpversion
if [ "$phpversion" = "1" ];then
    sudo dnf -vy module enable php:remi-7.2
    sudo dnf -vy install php php-cli php-common php-fpm php-mysqlnd php-xml php-xmlrpc php-curl php-gd \
    php-imagick php-mbstring php-opcache php-soap php-zip php-ioncube-loader php-devel
elif [ "$phpversion" = "2" ];then
    sudo dnf -vy module enable php:remi-7.3
    sudo dnf -vy install php php-cli php-common php-fpm php-mysqlnd php-xml php-xmlrpc php-curl php-gd \
    php-imagick php-mbstring php-opcache php-soap php-zip php-ioncube-loader php-devel
elif [ "$phpversion" = "3" ];then
    sudo dnf -vy module enable php:remi-7.4
    sudo dnf -vy install php php-cli php-common php-fpm php-mysqlnd php-xml php-xmlrpc php-curl php-gd \
    php-imagick php-mbstring php-opcache php-soap php-zip php-ioncube-loader php-devel
elif [ "$phpversion" = "4" ];then
    sudo dnf -vy module enable php:remi-8.0
    sudo dnf -vy install php php-cli php-common php-fpm php-mysqlnd php-xml php-xmlrpc php-curl php-gd \
    php-imagick php-mbstring php-opcache php-soap php-zip php-ioncube-loader
elif [ "$phpversion" = "5" ];then
    sudo dnf -vy module enable php:remi-8.1
    sudo dnf -vy install php php-cli php-common php-fpm php-mysqlnd php-xml php-xmlrpc php-curl php-gd \
    php-imagick php-mbstring php-opcache php-soap php-zip php-ioncube-loader php-devel
else
    echo "Out of option Please Choose between 1-5"
:
fi
printf "\nPHP installation Has Finished\n\n"
;;


2)
#Grub Customizer
sudo dnf -vy install lynx gtkmm30-devel libarchive-devel openssl-devel
grub_customizer_link=$(lynx -dump https://launchpad.net/grub-customizer/ | awk '/http/{print $2}' | grep -iv 'asc' | \
grep -i tar.gz | head -n 1)
sudo wget -O /root/Downloads/grub-latest.tar.gz "$grub_customizer_link"
sudo mkdir -pv /root/Downloads/grub-latest
tar xzvf /root/Downloads/grub-latest.tar.gz -C /root/Downloads/grub-latest --strip-components 1
cd /root/Downloads/grub-latest
cmake . && make -j "$core"
sudo make -j "$core" install

;;

3)
#Python
printf "\nPlease Choose Your Desired Python Version\n\n1-)Python 2 (Official Package)\n2-)Python 3.6 (Official Package)\n\
3-)Python 3.8 (Official Package)\n4-)Python 3.9 (Official Package)\n\nPlease Select Your Python Version:"
read python_version
if [ "$python_version" = "1" ];then
    sudo dnf -vy install python2 python2-devel
elif [ "$python_version" = "2" ];then
    sudo dnf -vy install python36 python36-devel
elif [ "$python_version" = "3" ];then
    sudo dnf -vy install python38 python38-devel
elif [ "$python_version" = "4" ];then
    sudo dnf -vy install python39 python39-devel
else
    echo "Out of option Please Choose between 1-4"
fi
;;

4)
#WineHQ Latest
printf "\nPlease Choose Your Desired Visual Studio Code Version \n\n1-)Visual Studio Code(From Package Manager)\
\n2-)Visual Studio Code (Via Snap)\n\nPlease Select Your Visual Studio Code Version:"
read -r winehq_version
if [ "$winehq_version" = "2" ];then
    sudo dnf -vy install wine wine-common wine-devel winetricks
elif [ "$winehq_version" = "2" ];then
    sudo dnf -vy install --nogpgcheck https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-8.noarch.rpm \
    https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-8.noarch.rpm
    sudo mkdir -pv /root/Downloads/winelatest
    wine_latest=$(lynx -dump https://dl.winehq.org/wine/source/ | awk '/http/{print $2}' | grep -iv README | grep wine/source | \
    tail -n 1)
    wine_latest=$(lynx -dump  "$wine_latest" | awk '/http/{print $2}' | grep -i tar.xz | grep -iv sign | tail -n 1)
    sudo dnf -vy groupinstall 'Development Tools'
    sudo dnf -vy install libX11-devel zlib-devel libxcb-devel libxslt-devel libgcrypt-devel libxml2-devel gnutls-devel \
    libpng-devel libjpeg-turbo-devel libtiff-devel gstreamer1-devel dbus-devel fontconfig-devel freetype-devel mingw64-cpp \
    mingw64-gcc mingw64-gcc-c++ alsa-plugins-pulseaudio.i686 glibc-devel.i686 glibc-devel libgcc.i686 libX11-devel.i686 \
    freetype-devel.i686 libXcursor-devel.i686 libXi-devel.i686 libXext-devel.i686 libXxf86vm-devel.i686 libXrandr-devel.i686 \
    libXinerama-devel.i686 mesa-libGLU-devel.i686 mesa-libOSMesa-devel.i686 libXrender-devel.i686 libpcap-devel.i686 \
    ncurses-devel.i686 libzip libzip-devel libzip-tools lcms2-devel.i686 zlib-devel.i686 libv4l-devel.i686 libgphoto2-devel.i686  \
    cups-devel.i686 libxml2-devel.i686 openldap-devel.i686 libxslt-devel.i686 gnutls-devel.i686 libpng-devel.i686 \
    flac-libs.i686 json-c.i686 libICE.i686 libSM.i686 libXtst.i686 libasyncns.i686 libedit.i686 liberation-narrow-fonts.noarch \
    libieee1284.i686 libogg.i686 libsndfile.i686 libuuid.i686 libva.i686 libvorbis.i686 libwayland-client.i686 \
    libwayland-server.i686 llvm-libs.i686 mesa-dri-drivers.i686 mesa-filesystem.i686 mesa-libEGL.i686 mesa-libgbm.i686 \
    nss-mdns ocl-icd.i686 pulseaudio-libs.i686  sane-backends-libs.i686 tcp_wrappers-libs unixODBC.i686 \
    samba-common-tools.x86_64 samba-libs.x86_64 samba-winbind.x86_64 samba-winbind-clients.x86_64 samba-winbind-modules.x86_64 \
    mesa-libGL-devel.i686 fontconfig-devel.i686 libXcomposite-devel.i686 libtiff-devel.i686 openal-soft-devel.i686 \
    alsa-lib-devel.i686 gsm-devel.i686 libjpeg-turbo-devel.i686 \
    pulseaudio-libs-devel.i686 pulseaudio-libs-devel gtk3-devel.i686 libattr-devel.i686 libva-devel.i686 libexif-devel.i686 \
    libexif.i686 glib2-devel.i686 mpg123-devel.i686 mpg123-devel.x86_64 libcom_err-devel.i686 libcom_err-devel.x86_64 \
    libFAudio-devel.x86_64 gstreamer1-devel gstreamer1-plugins-base gstreamer1-plugins-base-devel.x86_64 \
    gstreamer1-plugins-base-devel.i686 gstreamer1-plugins-bad-free.i686 gstreamer1-plugins-bad-free.x86_64 \
    opencl-filesystem.noarch opencl-headers vkd3d-compiler libvkd3d-utils libvkd3d-utils-devel libvkd3d-devel
    sudo wget -O /root/Downloads/winelatest.tar.xz "$wine_latest"
    tar xvf /root/Downloads/winelatest.tar.xz -C /root/Downloads/winelatest --strip-components 1
    cd /root/Downloads/winelatest/
    ./configure --enable-win64
    make -j "$core" && make -j "$core" install
else
    echo "Out of option Please Choose between 1-2"
fi
;;

5)
#FFmpeg
printf "\nPlease Choose Your Desired FFmpeg Version \n\n1-)FFmpeg (Official Package)\n2-)FFmpeg Latest(Compile From Source)\n\
3-)FFmpeg Latest(Snap)\n\nPlease Select Your FFmpeg Version:"
read -r ffmpeg_version
if [ "$ffmpeg_version" = "2" ];then
    cd /root/Downloads/ffmpeglatest/
    make -j "$core" uninstall
    snap remove ffmpeg
    sudo dnf -vy install ffmpeg ffmpeg-devel ffmpeg-libs
elif [ "$ffmpeg_version" = "2" ];then
    sudo snap remove ffmpeg
    sudo dnf -vy remove ffmpeg ffmpeg-devel ffmpeg-libs
    sudo mkdir -pv /root/Downloads/ffmpeglatest
    ffmpeg_latest=$(lynx -dump https://www.ffmpeg.org/releases/ | awk '/http/{print $2}' | grep -iv '.asc\|md5\|snapshot' | \
    grep -i tar.gz | tail -n 1)
    sudo wget -O /root/Downloads/ffmpeglatest.tar.gz "$ffmpeg_latest"
    tar xvf /root/Downloads/ffmpeglatest.tar.gz -C /root/Downloads/ffmpeglatest --strip-components 1
    cd /root/Downloads/ffmpeglatest/
    ./configure --disable-x86asm
    make -j "$core" && make -j "$core" install
elif [ "$ffmpeg_version" = "3" ];then
    sudo dnf -vy remove ffmpeg ffmpeg-devel ffmpeg-libs
    cd /root/Downloads/ffmpeglatest/
    make -j "$core" uninstall
    sudo snap install ffmpeg
else 
    echo "Out of option Please Choose between 1-3"
fi
;;

6)
#Apache2
printf "\nPlease Choose Your Desired Apache Version\n\n1-)Apache 2(From Official Package)\n\
2-)Apache Latest(Compile From Source)\n\nPlease Select Your Apache Version:"
read -r apacheversion
if [ "$apacheversion" = "1" ];then
    sudo install apache2 -y
elif [ "$apacheversion" = "2" ];then
    apache_latest=$(lynx -dump https://dlcdn.apache.org//httpd | awk '{print $2}' | grep -iv '.asc\|.sha' \
    | grep -i .tar.gz | tail -n 1)
    sudo dnf -vy install apr-devel apr-util apr-util-devel gcc pcre-devel make cmake redhat-rpm-config
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

elif [ "$apacheversion" = "3" ];then
    sudo dnf -vy remove apache2
    sudo mkdir -pv /root/Downloads/httpd
    wget -O /root/Downloads/httpd/httpd-2.4.52.tar.bz2 https://dlcdn.apache.org//httpd/httpd-2.4.52.tar.bz2
    sudo dnf -vy install autoconf libuuid-devel lua-devel \
    libxml2-devel python2 python39 python39-devel doxygen apr apr-util apr-util-devel \
    perl make cmake gcc
    rpmbuild -tb httpd-2.4.52.tar.bz2
    sudo dnf -vy install /root/rpmbuild/RPMS/x86_64/httpd-2.4.52-1.x86_64.rpm
    sudo dnf -vy install /root/rpmbuild/RPMS/x86_64/mod_ssl-2.4.52-1.x86_64.rpm
else
    echo "Out of options please choose between 1-2"
fi


sudo systemctl daemon-reload
sudo systemctl enable httpd
sudo systemctl start httpd
sudo dnf -vy install apachetop

#sudo firewall-cmd --zone=public --permanent --add-service=http
#sudo firewall-cmd --zone=public --permanent --add-service=https
#sudo firewall-cmd --reload
printf "\nApache2 Installation Has Finished\n\n"
;;

7)
#Transmission
printf "\nPlease Choose Your Desired Transmission Version\n\n1-)Transmission (From Official Package)\n\
2-)Transmission (Compile From Source)\n\nPlease Select Your Transmission Version:"
read -r transmission_version
if [ "$transmission_version" = "1" ];then
    sudo dnf -vy install transmission transmission-cli transmission-common transmission-daemon
    sudo systemctl start transmission-daemon.service
    sudo systemctl enable transmission-daemon.service
elif [ "$transmission_version" = "2" ];then
    sudo dnf -vy install gcc gcc-c++ m4 make automake libtool gettext openssl-devel pkgconf-pkg-config libcurl \
    libcurl-devel intltool libevent libevent-devel
    transmission_latest=$(lynx -dump https://github.com/transmission/transmission/releases | awk '/http/{print $2}' | \
    grep -i tar.xz | head -n 1)
    sudo mkdir -pv /root/Downloads/transmission-latest
    sudo wget -O /root/Downloads/transmission-latest.tar.xz "$transmission_latest"
    tar -xvf /root/Downloads/transmission-latest.tar.xz -C /root/Downloads/transmission-latest --strip-components 1
    cd /root/Downloads/transmission_latest
    ./configure
    make -j "$core" && make -j "$core" install
else
    echo "Out of options please choose between 1-2"
fi
;;

8)
#Nmap
printf "\nPlease Choose Your Desired Nmap Version\n\n1-)Nmap (From Official Package)\n\
2-)Nmap (From .rpm package)\n3-)Nmap (Compile From Source)\n4-)Nmap (Snap)\n\nPlease Select Your Nmap Version:"
read -r nmap_version
if [ "$nmap_version" = "1" ];then
    sudo dnf -vy install nmap
elif [ "$nmap_version" = "2" ];then
    nmap_latest_rpm=$(lynx -dump https://nmap.org/download.html | awk '/http/{print $2}' | grep -i 'x86_64.rpm' \
    | grep -iv 'ncat\|nping' | head -n 1)
    wget -O /root/Downloads/nmap-latest.rpm "$nmap_latest_rpm"
    sudo rpm -Uvh --nodeps /root/Downloads/nmap-latest.rpm
elif [ "$nmap_version" = "3" ];then
    sudo mkdir -pv /root/Downloads/nmap-latest
    nmap_latest_source=$(lynx -dump https://nmap.org/download.html | awk '/http/{print $2}' | grep -i .tgz | head -n 1)
    wget -O /root/Downloads/nmap-latest.tgz "$nmap_latest_source"
    tar -xvf /root/Downloads/nmap-latest.tgz -C /root/Downloads/nmap-latest --strip-components 1
    cd /root/Downloads/nmap-latest
    ./configure
    make -j "$core" && make -j "$core" install
elif [ "$nmap_version" = "4" ];then
    sudo snap install nmap
else
    echo "Out of options please choose between 1-2"
fi
;;

9)
#NGINX

#OpenSSL Installation Section
printf "\nPlease Choose Your Desired OpenSSL Version\n\n1-)OpenSSL 1.1.1k (Official Package)\n2-)OpenSSL 3.0\n\
3-)OpenSSL Latest(Compile From Source)\n\nPlease Select Your OpenSSL Version:"
read -r opensslversion
if [ "$opensslversion" = "1" ];then
    sudo dnf -vy install openssl-devel
elif [ "$opensslversion" = "2" ];then
    sudo dnf -vy install openssl3 openssl3-devel openssl3-libs
elif [ "$opensslversion" = "3" ];then
    sudo dnf -vy install perl gcc
    openssl_latest=$(lynx -dump https://www.openssl.org/source/ | awk '{print $2}' | grep -iv '.asc\|sha\|fips'\
    | grep -i .tar.gz | tail -n 1)
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
    echo "Out of options please choose between 1-3"
fi
#----------------------------------------------------------------------------------------
#Nginx installation section
printf "\nPlease Choose Your Desired Nginx Version\n\n1-)Nginx (Official Package)\n\
2-)Nginx Latest(Compile From Source)\n\nPlease Select Your Nginx Version:"
read -r nginxversion
if [ "$nginxversion" = "1" ];then
    sudo dnf -vy install nginx
elif [ "$nginxversion" = "2" ];then
    sudo dnf -vy install gd gd-devel pcre-devel
    nginx_latest=$(lynx -dump http://nginx.org/en/download.html | awk '{print $2}' | grep -iv '.asc\|.zip' \
    | grep -i .tar.gz | head -n 1)
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
fi
#------------------------------------------------------------
sudo systemctl enable nginx
sudo systemctl start nginx
#sudo firewall-cmd --permanent --zone=public --add-service=http 
#sudo firewall-cmd --permanent --zone=public --add-service=https
#sudo firewall-cmd --reload

printf "\nNginx Installation Has Finished\n\n"
;;
10)
#Redis
printf "\nPlease Choose Your Desired Redis Version\n\n1-)Redis (Official Package)\n2-)Redis (Snap)\n\
3-)Redis (Compile From Source)\n\nPlease Select Your Redis Version:"
read -r redis_version
if [ "$redis_version" = "1" ];then
    sudo snap remove redis
    cd /root/Downloads/redis-stable
    make -j "$core" uninstall
    sudo dnf -vy install redis redis-devel
    sudo systemctl enable --now redis
    sudo systemctl start redis
    sudo firewall-cmd --add-port=6379/tcp --permanenent
    sudo firewall-cmd --reload
elif [ "$redis_version" = "2" ];then
    sudo dnf -vy remove redis redis-devel
    cd /root/Downloads/redis-stable
    make -j "$core" uninstall
    sudo snap install redis
elif [ "$redis_version" = "3" ];then
    sudo snap remove redis
    sudo dnf -vy remove redis redis-devel
    sudo mkdir -pv /root/Downloads/redis-stable
    wget -O /root/Downloads/redis-stable.tar.gz http://download.redis.io/redis-stable.tar.gz
    tar -xvf /root/Downloads/redis-stable.tar.gz -C /root/Downloads/redis-stable --strip-components 1
    cd /root/Downloads/redis-stable
    make -j "$core" && make -j "$core" install
else
    echo "Out of options please choose between 1-3"
fi
;;

11)
# OpenSSL
#OpenSSL Installation Section
printf "\nPlease Choose Your Desired OpenSSL Version\n\n1-)OpenSSL 1.1.1k (Official Package)\n2-)OpenSSL 3.0\n\
3-)OpenSSL 3 Latest(Compile From Source)\n4-)OpenSSL 1 Latest (Compile From Source)\n\nPlease Select Your OpenSSL Version:"
read -r opensslversion
if [ "$opensslversion" = "1" ];then
    sudo dnf -vy install openssl-devel
elif [ "$opensslversion" = "2" ];then
    sudo dnf -vy install openssl3 openssl3-devel openssl3-libs
elif [ "$opensslversion" = "3" ];then
    sudo rm -rf /root/Downloads/openssl-latest
    sudo dnf -vy install perl gcc
    openssl_latest=$(lynx -dump https://www.openssl.org/source/ | awk '{print $2}' | grep -iv '.asc\|sha\|fips'\
    | grep -i .tar.gz | tail -n 1)
    wget -O /root/Downloads/openssl-latest.tar.gz "$openssl_latest"
    sudo mkdir -pv /root/Downloads/openssl-latest
    tar -xvf /root/Downloads/openssl-latest.tar.gz -C /root/Downloads/openssl-latest --strip-components 1
    cd /root/Downloads/openssl-latest
    ./config
    make -j "$core" && make -j "$core" install
    echo "export PATH="/usr/local/ssl/bin:"${PATH}""" >> ~/.bashrc
    ln -s /usr/local/lib64/libssl.so.3 /usr/lib64/libssl.so.3
    ln -s /usr/local/lib64/libcrypto.so.3 /usr/lib64/libcrypto.so.3
elif [ "$opensslversion" = "4" ];then
    #sudo dnf -vy remove openssl openssl-devel
    sudo rm -rf /root/Downloads/openssl-latest
    sudo dnf -vy group install 'Development Tools'
    sudo dnf -vy install perl gcc
    openssl_latest=$(lynx -dump https://www.openssl.org/source/ | awk '{print $2}' | grep -iv '.asc\|sha\|fips' \
    | grep -i openssl-1 | head -n 1)
    wget -O /root/Downloads/openssl-latest.tar.gz "$openssl_latest"
    sudo mkdir -pv /root/Downloads/openssl-latest
    tar -xvf /root/Downloads/openssl-latest.tar.gz -C /root/Downloads/openssl-latest --strip-components 1
    cd /root/Downloads/openssl-latest
    ./config #--prefix=/usr         \
         #--openssldir=/etc/ssl \
         #--libdir=lib          \
         #shared                \
         #zlib-dynamic
    make -j "$core" && make -j "$core" install
    echo "export PATH="/usr/local/ssl/bin:"${PATH}""" >> ~/.bashrc
    source /root/.bashrc
    #ln -s /usr/local/lib64/libssl.so.3 /usr/lib64/libssl.so.3
    #ln -s /usr/local/lib64/libcrypto.so.3 /usr/lib64/libcrypto.so.3
else
    echo "Out of options please choose between 1-2"
fi
printf "\nOpenSSL Installation Has Finished \n\n"
;;

12)
#OpenSSH Server
printf "\nPlease Choose Your Desired OpenSSH Version \n\n1-)OpenSSH Server (Official Package)\n\
2-)OpenSSH Latest (Compile From Source)\n\nPlease Select Your OpenSSH Version:"
read -r opensshversion
if [ "$opensshversion" = "1" ];then
    cd /root/Downloads/openssh-latest
    make -j "$core" uninstall
    sudo dnf -vy install openssh openssh-clients openssh-server 
elif [ "$opensshversion" = "2" ];then
    #sudo dnf -vy remove openssh*
    sudo dnf -vy install gcc zlib zlib-devel compat-openssl10 openssl openssl-devel zlib-devel openssl-devel pam-devel \
    libselinux-devel audit-libs-devel autoconf automake gcc libX11-devel libselinux-devel make ncurses-devel \
    openssl-devel p11-kit-devel perl-generators systemd-devel xauth pam-devel rpm-build zlib-devel
    sudo dnf -vy group install 'Development Tools'
    #sudo mkdir /var/lib/sshd
    #sudo chmod -R 700 /var/lib/sshd/
    #sudo chown -R root:sys /var/lib/sshd/
    #sudo useradd -r -U -d /var/lib/sshd/ -c "sshd privsep" -s /bin/false sshd
    sudo mkdir -pv /root/Downloads/openssh-latest
    opensshlatest=$(lynx -dump https://www.openssh.com/releasenotes.html | awk '/http/{print $2}' | grep -i p1.tar.gz | head -n 1)
    wget -O /root/Downloads/openssh-latest.tar.gz "$opensshlatest"
    tar -xvf /root/Downloads/openssh-latest.tar.gz -C /root/Downloads/openssh-latest --strip-components 1
    cd /root/Downloads/openssh-latest
    ./configure --with-md5-passwords \
                --with-pam \
                --with-selinux \
                --with-privsep-path=/opt/lib/sshd/ \
                --with-openssl-includes=/usr/include \
                --with-openssl-libraries=/usr/lib \
                --without-openssl-header-check  \
                --sysconfdir=/opt/ssh
    make -j "$core" && make -j "$core" install
    systemctl restart sshd
else
    echo "Out of options please choose between 1-2"  
fi
;;

13)
#GoCD
printf "\nPlease Choose Your GoCD Version \n\n1-)GoCD Server\n2-)GoCD Server (Docker)\n3-)GoCD Agent\n\
4-)GoCD Agent (Docker)\n\nPlease Select Your GoCD Version:"
read -r gocd_version
if [ "$gocd_version" = "1" ];then
    sudo dnf -vy install java-1.8.0-openjdk-devel
    java -version
    sudo curl https://download.gocd.org/gocd.repo -o /etc/yum.repos.d/gocd.repo
    sudo dnf -vy install go-server
    sudo systemctl start go-server
    sudo systemctl enable go-server
    sudo mkdir -pv /opt/artifacts
    sudo chown -R go:go /opt/artifacts
elif [ "$gocd_version" = "2" ];then
    sudo dnf -vy install yum-utils procps
    sudo dnf -vy install https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.6-3.3.el7.x86_64.rpm
    sudo yum-config-manager \
        --add-repo \
        https://download.docker.com/linux/centos/docker-ce.repo
    sudo dnf -vy install docker-ce --nobest docker-ce-cli containerd.io
    systemctl start docker
    systemctl enable docker
    docker pull gocd/gocd-server
    docker run -d -p8153:8153 gocd/gocd-server:v21.4.0
elif [ "$gocd_version" = "3" ];then
    sudo curl https://download.gocd.org/gocd.repo -o /etc/yum.repos.d/gocd.repo
    sudo dnf -vy install go-agent
elif [ "$gocd_version" = "4" ];then
    sudo dnf -vy install yum-utils procps
    sudo dnf -vy install https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.6-3.3.el7.x86_64.rpm
    sudo yum-config-manager \
        --add-repo \
        https://download.docker.com/linux/centos/docker-ce.repo
    sudo dnf -vy install docker-ce --nobest docker-ce-cli containerd.io
    systemctl start docker
    systemctl enable docker
    docker pull gocd/gocd-agent-centos-7
else
    echo "Out of options please choose between 1-4"
fi
;;

14)
#OpenJDK 8-11-17 JDK
printf "\nPlease Choose Your Desired OpenJDK Version\n\n1-)OpenJDK 8 \n2-)OpenJDK 11\n\
3-)OpenJDK 17\n\nPlease Select Your OpenJDK Version:"
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

15)
#DVBlast 3.4
sudo dnf -vy install gcc make libev-devel 
#sudo git clone https://github.com/gfto/bitstream.git /root/Downloads/bitstream
#cd /root/Downloads/bitstream/
#make -j "$core" install
sudo wget -O /root/Downloads/dvblast3.4.tar.gz https://github.com/videolan/dvblast/archive/3.4.tar.gz
sudo mkdir -pv /root/Downloads/dvblast3.4
sudo tar xvf /root/Downloads/dvblast3.4.tar.gz -C /root/Downloads/dvblast3.4/ --strip-components 1
cd /root/Downloads/dvblast3.4/
make -j "$core"
make -j "$core" install
printf "\nDVBlast 3.4 Installation Has Finished \n\n"
;;

16)
#Linux Kernel
printf "\nPlease Choose Your Desired Kernel Version\n\n1-)Mainline Kernel (Latest)\n\
2-)Longterm Kernel (LTS)\n\nPlease Select Your Linux Kernel Version:"
read -r kernelversion
if [ "$kernelversion" = "1" ];then
    sudo dnf -vy --enablerepo=elrepo-kernel install kernel-ml
elif [ "$kernelversion" = "2" ];then
    sudo dnf -vy --enablerepo=elrepo-kernel install kernel-lt
else
    echo "Out of options please choose between 1-2"
fi
grub2-set-default 0
grub2-mkconfig -o /etc/grub2.cfg
#grubby --set-default /boot/vmlinuz-5.16.2-1.el8.elrepo.x86_64
#sudo yum update kernel -y # To Update Linux Kernel
printf "\nLinux Kernel Installation Has Finished To Apply New Kernel Please Reboot The Server.\n\n"
;;

17)
#Samba
printf "\nPlease Choose Your Desired Samba Version\n\n1-)Samba Official\n\
2-)Samba From Compile From Source (Latest)\n\nPlease Select Your Samba Version:"
read -r sambaversion
if [ "$sambaversion" = "1" ];then
    sudo dnf -vy samba samba-common samba-client
    systemctl enable smb
    systemctl start smb
elif [ "$sambaversion" = "2" ];then
    sudo dnf -vy install docbook-style-xsl gcc gdb gnutls-devel gpgme-devel jansson-devel \
    keyutils-libs-devel krb5-workstation libacl-devel libaio-devel \
    libarchive-devel libattr-devel libblkid-devel libtasn1 libtasn1-tools \
    libxml2-devel libxslt lmdb-devel openldap-devel pam-devel perl \
    perl-ExtUtils-MakeMaker perl-Parse-Yapp popt-devel python3-cryptography \
    python3-dns python3-gpg python36-devel readline-devel rpcgen systemd-devel \
    tar zlib-devel
    sudo dnf -vy install dnf-plugins-core cups-devel dbus dbus-devel
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
fi
printf "\nSamba Installation Has Finished ."
;;

18)
#Mysql
printf "\nPlease Choose Your Desired Mysql Version\n\n1-)Mysql 8.0\n2-)Mysql 5.7\n3-)Mysql 5.6\n\
4-)Mysql 5.5\n6-)Mysql 8 (Latest)\n\nPlease Select Your Mysql Version:"
read -r mysqlversion
if [ "$mysqlversion" = "1" ];then
    sudo dnf -vy remove @mysql
    sudo dnf -vy module reset mysql && sudo dnf -vy module disable mysql
    echo "" > /etc/yum.repos.d/mysql-community.repo
    sudo dnf config-manager --disable mysql57-community
    sudo dnf config-manager --disable mysql56-community
    sudo dnf config-manager --disable mysql55-community
    if ! command -v mysql &> /dev/null;then
        echo "Installing Mysql"
        sudo dnf -vy module enable mysql
        sudo dnf -vy install mysql-devel mysql-server
    else
        printf "\nDifferent Mysql Version Detected To Install Mysql You Must Uninstall Different Version First (y/n):"
        read -r mysql_uninstall_verify
        if [ "$mysql_uninstall_verify" = "Y" ] || [ "$mysql_uninstall_verify" = "y" ];then
            echo "Uninstalling mysql"
            sudo dnf -vy remove mysql-community-server mysql-devel mysql-server
        else
            :
        fi
    fi
    sudo dnf -vy module enable mysql
    sudo dnf -vy install mysql-devel mysql-server
    systemctl start mysqld
    systemctl enable mysqld
elif [ "$mysqlversion" = "2" ];then
    sudo dnf -vy remove @mysql
    sudo dnf -vy module reset mysql && sudo dnf -vy module disable mysql
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
        sudo dnf -vy module enable mysql
        sudo dnf -vy install mysql-community-server
    else
        printf "\nDifferent Mysql Version Detected To Install Mysql You Must Uninstall Different Version First (y/n):"
        read -r mysql_uninstall_verify
        if [ "$mysql_uninstall_verify" = "Y" ] || [ "$mysql_uninstall_verify" = "y" ];then
            echo "Uninstalling mysql"
            sudo dnf -vy remove mysql-community-server mysql-devel mysql-server
        else
            :
        fi
    fi
    sudo dnf -vy install mysql-community-server
    sudo dnf config-manager --disable mysql80-community
    sudo dnf config-manager --enable mysql57-community
    sudo dnf config-manager --disable mysql56-community
    sudo dnf config-manager --disable mysql55-community
    sudo dnf -vy install mysql-community-server
    systemctl enable --now mysqld.service
    sudo systemctl restart mysqld
    printf "\nMysql 5.7 Installation Has Finished.\n\n"
elif [ "$mysqlversion" = "3" ];then
    sudo dnf -vy remove @mysql 
    sudo dnf -vy module reset mysql && sudo dnf -vy module disable mysql
echo "# Enable to use MySQL 5.6
[mysql56-community]
name=MySQL 5.6 Community Server
baseurl=http://repo.mysql.com/yum/mysql-5.6-community/el/7/$cpuarch/
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-mysql" > /etc/yum.repos.d/mysql-community.repo
    sudo dnf -vy module disable mysql
    sudo dnf config-manager --disable mysql80-community
    sudo dnf config-manager --disable mysql57-community
    sudo dnf config-manager --enable mysql56-community
    sudo dnf config-manager --disable mysql55-community
    if ! command -v mysql &> /dev/null;then
        echo "Installing Mysql"
        sudo dnf -vy install mysql-community-server
    else
        printf "\nDifferent Mysql Version Detected To Install Mysql You Must Uninstall Different Version First (y/n):"
        read -r mysql_uninstall_verify
        if [ "$mysql_uninstall_verify" = "Y" ] || [ "$mysql_uninstall_verify" = "y" ];then
            echo "Uninstalling mysql"
            sudo dnf -vy remove mysql-community-server mysql-devel mysql-server
        else
            :
        fi
    fi
    auditctl -w /etc/shadow -p w
    ausearch -m avc -ts recent
    ausearch -c 'mysqld_safe' --raw | audit2allow -O /root/ -M my-mysqldsafe
    semodule -X 300 -i my-mysqldsafe.pp
    sudo rm -f my-mysqldsafe.te my-mysqldsafe.pp
    sudo dnf -vy install mysql-community-server
    #systemctl start mysqld
    #systemctl enable mysqld
    printf "\nMysql 5.6 Installation Has Finished.\n\n"
elif [ "$mysqlversion" = "4" ];then
echo "# Enable to use MySQL 5.5
[mysql55-community]
name=MySQL 5.5 Community Server
baseurl=http://repo.mysql.com/yum/mysql-5.5-community/el/7/$cpuarch/
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-mysql" > /etc/yum.repos.d/mysql-community.repo
    sudo dnf -vy module disable mysql
    sudo dnf config-manager --disable mysql80-community
    sudo dnf config-manager --disable mysql57-community
    sudo dnf config-manager --disable mysql56-community
    sudo dnf config-manager --enable mysql55-community
    if ! command -v mysql &> /dev/null;then
        echo "Installing Mysql"
        sudo dnf -vy install mysql-community-server
    else
        printf "\nDifferent Mysql Version Detected To Install Mysql You Must Uninstall Different Version First (y/n):"
        read -r mysql_uninstall_verify
        if [ "$mysql_uninstall_verify" = "Y" ] || [ "$mysql_uninstall_verify" = "y" ];then
            echo "Uninstalling mysql"
            sudo dnf -vy remove mysql-community-server mysql-devel mysql-server
            sudo dnf -vy install mysql-community-server
        else
            :
        fi
    fi
elif [ "$mysqlversion" = "5" ];then
    mysql_community_server=$(lynx -dump https://dev.mysql.com/downloads/file/?id=509898 | awk '/http/{print $2}' \
    | grep -i rpm | head -n 1)
    mysql_community_client=$(lynx -dump https://dev.mysql.com/downloads/file/?id=509895 | awk '/http/{print $2}' \
    | grep -i rpm | head -n 1)
    mysql_community_common=$(lynx -dump https://dev.mysql.com/downloads/file/?id=509896 | awk '/http/{print $2}' \
    | grep -i rpm | head -n 1)
    mysql_community_icu_data_files=$(lynx -dump https://dev.mysql.com/downloads/file/?id=509907 | awk '/http/{print $2}' \
    | grep -i rpm | head -n 1)
    sudo wget -O /root/Downloads/mysql-community-server-latest.rpm "$mysql_community_server"
    sudo wget -O /root/Downloads/mysql-community-client-latest.rpm "$mysql_community_client" 
    sudo wget -O /root/Downloads/mysql-community-common-latest.rpm "$mysql_community_common" 
    sudo wget -O /root/Downloads/mysql-community-icu-data-files-latest.rpm "$mysql_community_icu_data_files"
    sudo rpm -Uvh mysql-community*
    systemctl start mysqld
    systemctl enable mysqld
    printf "\nMysql 8 (Latest) Installation Has Finished.\n\n"
else
    echo "Out of options please choose between 1-5"
fi
;;

19)
#Mysql Router
mysql_community=$(lynx -dump https://dev.mysql.com/downloads/file/?id=508944 | awk '/http/{print $2}' | grep -i .rpm | head -n 1)
sudo wget -O /root/Downloads/mysql80-community-release.rpm "$mysql_community"
sudo rpm -Uvh mysql80-community-release.rpm
sudo dnf -vy install mysql-router
;;

20)
#Ruby
printf "\nPlease Choose Your Ruby Version \n\n1-)Ruby (From Official Package)\n2-)Ruby (Snap)\n\nPlease Select Your Ruby Version:"
read -r ruby_version
if [ "$ruby_version" = "1" ];then
    sudo snap remove ruby
    sudo dnf -vy install ruby
    ruby --version
elif [ "$ruby_version" = "2" ];then
    sudo dnf -vy remove ruby
    sudo snap install ruby --classic
else
    echo "Out of options please choose between 1-4"
fi
;;

21)
sudo snap install flutter --classic
;;

22)
#Zabbix Server
printf "\nPlease Choose Your Desired Zabbix Option\n\n1-)Zabbix Server 4.0 LTS (Mysql & Apache)\n\
2-)Zabbix Server 4.0 LTS (PostgreSQL & Apache)\n3-)Zabbix Server 5.0 LTS (Mysql & Apache)\n\
4-)Zabbix Server 5.0 LTS (Mysql & NGINX)\n5-)Zabbix Server 5.0 LTS (PostgreSQL & Apache)\n\
6-)Zabbix Server 5.0 LTS (PostgreSQL & NGINX)\n\nPlease Select Your Zabbix Option:"
read -r zabbix_option
if [ "$zabbix_option" = "1" ];then
    printf "Please Enter Desired Mysql Password:"
    read -r mysqlpassword
    sudo rpm -Uvh https://repo.zabbix.com/zabbix/4.0/rhel/8/x86_64/zabbix-release-4.0-2.el8.noarch.rpm
    sudo yum clean all
    sudo yum -y install zabbix-server-mysql zabbix-web-mysql zabbix-agent mysql mysql-devel mysql-server httpd httpd-devel
    sudo systemctl start mysqld
    sudo systemctl enable mysqld
    sudo mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY '$mysqlpassword';"
    sudo systemctl restart mysqld.service
    sudo mysql -uroot -p"$mysqlpassword" -e "create database zabbix character set utf8 collate utf8_bin;"
    sudo mysql -uroot -p"$mysqlpassword" -e "create user zabbix@localhost identified by '$mysqlpassword';"
    sudo mysql -uroot -p"$mysqlpassword" -e "grant all privileges on zabbix.* to zabbix@localhost;"
    zcat /usr/share/doc/zabbix-server-mysql*/create.sql.gz | mysql -uzabbix -p"$mysqlpassword" zabbix
    sed -i "s/# DBPassword=/DBPassword=$mysqlpassword/g" /etc/zabbix/zabbix_server.conf
    echo "php_value[date.timezone] = UTC" >> /etc/php-fpm.d/zabbix.conf
    sudo systemctl restart zabbix-server zabbix-agent httpd
    sudo systemctl enable zabbix-server zabbix-agent httpd
elif [ "$zabbix_option" = "2" ];then
    printf "Please Enter Desired PostgreSQL Password:"
    read -r PGPASSWORD
    sudo rpm -Uvh https://repo.zabbix.com/zabbix/4.0/rhel/8/x86_64/zabbix-release-4.0-2.el8.noarch.rpm
    dnf clean all
    sudo yum -y install postgresql postgresql-server postgresql-contrib
    sudo dnf -y install zabbix-server-pgsql zabbix-web-pgsql zabbix-agent httpd httpd-devel
    sudo postgresql-setup --initdb
    sudo systemctl start postgresql
    sudo systemctl enable postgresql
    echo "Please Enter Your Zabbix User Password"
    sudo -u postgres createuser --pwprompt zabbix
    sudo -u postgres createdb -O zabbix zabbix
    zcat /usr/share/doc/zabbix-server-pgsql*/create.sql.gz | sudo -u zabbix psql zabbix
    sed -i "s/DBPassword=/DBPassword=$PGPASSWORD/g" /etc/zabbix/zabbix_server.conf
    echo "php_value[date.timezone] = UTC" >> /etc/php-fpm.d/zabbix.conf
    systemctl restart zabbix-server zabbix-agent httpd php-fpm
    systemctl enable zabbix-server zabbix-agent httpd php-fpm
elif [ "$zabbix_option" = "3" ];then
    printf "Please Enter Desired Mysql Password:"
    read -r mysqlpassword
    sudo rpm -Uvh https://repo.zabbix.com/zabbix/5.0/rhel/8/x86_64/zabbix-release-5.0-1.el8.noarch.rpm
    dnf clean all
    sudo dnf install -y zabbix-server-mysql zabbix-web-mysql zabbix-agent zabbix-apache-conf mysql mysql-devel \
    mysql-server httpd httpd-devel
    sudo systemctl start mysqld
    sudo systemctl enable mysqld
    sudo mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY '$mysqlpassword';"
    sudo systemctl restart mysqld.service
    sudo mysql -uroot -p"$mysqlpassword" -e "create database zabbix character set utf8 collate utf8_bin;"
    sudo mysql -uroot -p"$mysqlpassword" -e "create user zabbix@localhost identified by '$mysqlpassword';"
    sudo mysql -uroot -p"$mysqlpassword" -e "grant all privileges on zabbix.* to zabbix@localhost;"
    zcat /usr/share/doc/zabbix-server-mysql*/create.sql.gz | mysql -uzabbix -p"$mysqlpassword" zabbix
    sed -i "s/# DBPassword=/DBPassword=$mysqlpassword/g" /etc/zabbix/zabbix_server.conf
    echo "php_value[date.timezone] = UTC" >> /etc/php-fpm.d/zabbix.conf
    sudo systemctl restart zabbix-server zabbix-agent httpd
    sudo systemctl enable zabbix-server zabbix-agent httpd
elif [ "$zabbix_option" = "4" ];then
    printf "Please Enter Desired Mysql Password:"
    read -r mysqlpassword
    sudo rpm -Uvh https://repo.zabbix.com/zabbix/5.0/rhel/8/x86_64/zabbix-release-5.0-1.el8.noarch.rpm
    dnf clean all
    sudo dnf install -y zabbix-server-mysql zabbix-web-mysql zabbix-nginx-conf zabbix-sql-scripts zabbix-agent \
    mysql mysql-devel mysql-server
    sudo systemctl start mysqld
    sudo systemctl enable mysqld
    sudo mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY '$mysqlpassword';"
    sudo systemctl restart mysqld.service
    sudo mysql -uroot -p"$mysqlpassword" -e "create database zabbix character set utf8 collate utf8_bin;"
    sudo mysql -uroot -p"$mysqlpassword" -e "create user zabbix@localhost identified by '$mysqlpassword';"
    sudo mysql -uroot -p"$mysqlpassword" -e "grant all privileges on zabbix.* to zabbix@localhost;"
    zcat /usr/share/doc/zabbix-server-mysql*/create.sql.gz | mysql -uzabbix -p"$mysqlpassword" zabbix
    sed -i "s/# DBPassword=/DBPassword=$mysqlpassword/g" /etc/zabbix/zabbix_server.conf
    echo "php_value[date.timezone] = UTC" >> /etc/php-fpm.d/zabbix.conf
    sudo systemctl restart zabbix-server zabbix-agent httpd
    sudo systemctl enable zabbix-server zabbix-agent httpd
elif [ "$zabbix_option" = "5" ];then
    printf "Please Enter Desired PostgreSQL Password:"
    read -r PGPASSWORD
    sudo rpm -Uvh https://repo.zabbix.com/zabbix/5.0/rhel/8/x86_64/zabbix-release-5.0-1.el8.noarch.rpm
    dnf clean all
    sudo yum -y install postgresql postgresql-server postgresql-contrib
    sudo dnf -y install zabbix-server-pgsql zabbix-web-pgsql zabbix-agent httpd httpd-devel
    sudo postgresql-setup --initdb
    sudo systemctl start postgresql
    sudo systemctl enable postgresql
    echo "Please Enter Your Zabbix User Password"
    sudo -u postgres createuser --pwprompt zabbix
    sudo -u postgres createdb -O zabbix zabbix
    zcat /usr/share/doc/zabbix-server-pgsql*/create.sql.gz | sudo -u zabbix psql zabbix
    sed -i "s/DBPassword=/DBPassword=$PGPASSWORD/g" /etc/zabbix/zabbix_server.conf
    echo "php_value[date.timezone] = UTC" >> /etc/php-fpm.d/zabbix.conf
    systemctl restart zabbix-server zabbix-agent httpd php-fpm
    systemctl enable zabbix-server zabbix-agent httpd php-fpm
elif [ "$zabbix_option" = "6" ];then
    printf "Please Enter Desired PostgreSQL Password:"
    read -r PGPASSWORD
    sudo rpm -Uvh https://repo.zabbix.com/zabbix/5.0/rhel/8/x86_64/zabbix-release-5.0-1.el8.noarch.rpm
    dnf clean all
    sudo yum -y install postgresql postgresql-server postgresql-contrib
    sudo dnf install -y zabbix-server-mysql zabbix-web-mysql zabbix-nginx-conf zabbix-sql-scripts zabbix-agent mysql \
    mysql-devel mysql-server
    sudo postgresql-setup --initdb
    sudo systemctl start postgresql
    sudo systemctl enable postgresql
    echo "Please Enter Your Zabbix User Password"
    sudo -u postgres createuser --pwprompt zabbix
    sudo -u postgres createdb -O zabbix zabbix
    zcat /usr/share/doc/zabbix-server-pgsql*/create.sql.gz | sudo -u zabbix psql zabbix
    sed -i "s/DBPassword=/DBPassword=$PGPASSWORD/g" /etc/zabbix/zabbix_server.conf
    echo "php_value[date.timezone] = UTC" >> /etc/php-fpm.d/zabbix.conf
    systemctl restart zabbix-server zabbix-agent httpd php-fpm
    systemctl enable zabbix-server zabbix-agent httpd php-fpm
else
    echo "Out of options please choose between 1-6"
fi
;;

23)
#UrBackup Server
printf "\nPlease Choose Your UrBackup Version \n\n1-)UrBackup Server (Official Package)\n2-)UrBackup Server (Docker)\n\
3-)UrBackup Server Latest (Compile From Source)\n\nPlease Select Your UrBackup Version:"
read -r urbackup_version
if [ "$urbackup_version" = "1" ];then
    cd /etc/yum.repos.d/
    wget https://download.opensuse.org/repositories/home:uroni/CentOS_8/home:uroni.repo
    sudo dnf -vy install urbackup-server
elif [ "$urbackup_version" = "2" ];then
    sudo dnf -vy install yum-utils
    sudo dnf -vy install https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.6-3.3.el7.x86_64.rpm
    sudo yum-config-manager \
        --add-repo \
        https://download.docker.com/linux/centos/docker-ce.repo
    sudo dnf -vy install docker-ce --nobest docker-ce-cli containerd.io
    systemctl start docker
    systemctl enable docker
    docker run -d --name urbackup-server-1 -v /media/backups:/backups -v /media/database:/var/urbackup -p \
    55413-55415:55413-55415 -p 35623:35623/udp uroni/urbackup-server
elif [ "$urbackup_version" = "3" ];then
    sudo dnf -vy install gcc gcc-c++ zlib zlib-devel libcurl libcurl-devel openssl-devel cryptopp-devel
    urbackup_latest=$(lynx -dump https://hndl.urbackup.org/Server/ | awk '/http/{print $2}' \
    | grep -iv 'dev\|latest\|RC\|beta' | tail -n 1)
    urbackup_latest=$(lynx -dump "$urbackup_latest" | awk '/http/{print $2}' | grep -i tar.gz | head -n 1)
    sudo mkdir -pv /root/Downloads/urbackup-server-latest
    wget -O /root/Downloads/urbackup-server-latest.tar.gz "$urbackup_latest"
    tar -xvf /root/Downloads/urbackup-server-latest.tar.gz -C /root/Downloads/urbackup-server-latest --strip-components 1
    cd /root/Downloads/urbackup-server-latest
    ./configure
    make -j "$core" && make -j "$core" install
    cp urbackup-server.service /etc/systemd/system/
    systemctl enable urbackup-server.service
    cp defaults_server /etc/default/urbackupsrv
    cp logrotate_urbackupsrv /etc/logrotate.d/urbackupsrv
    systemctl start urbackup-server
else
    echo "Out of options please choose between 1-3"
fi
;;

24)
#MariaDB
printf "\nPlease Choose Your Desired MariaDB Version\n\n1-)MariaDB 10.3 (Official Repo)\n2-)MariaDB 10.4\n\
3-)MariaDB 10.5\n4-)MariaDB 10.6\n\nPlease Select Your MariaDB Version:"
read -r mariadbversion
if [ "$mariadbversion" = "1" ];then
    wget -O /root/Downloads/mariadb_repo_setup https://downloads.mariadb.com/MariaDB/mariadb_repo_setup
    bash /root/Downloads/mariadb_repo_setup --mariadb-server-version=10.3
    sudo dnf -vy install boost-program-options
    sudo dnf -vy module reset mariadb
    sudo dnf -vy install mariadb mariadb-devel MariaDB-server MariaDB-client MariaDB-backup
    sudo systemctl enable --now mariadb
    sudo systemctl start mariadb 
elif [ "$mariadbversion" = "2" ];then
    wget -O /root/Downloads/mariadb_repo_setup https://downloads.mariadb.com/MariaDB/mariadb_repo_setup
    sudo bash /root/Downloads/mariadb_repo_setup --mariadb-server-version=10.4
    sudo dnf -vy install boost-program-options
    sudo dnf -vy module reset mariadb
    sudo dnf -vy install MariaDB-server MariaDB-client MariaDB-backup
    sudo systemctl enable --now mariadb
    sudo systemctl start mariadb
elif [ "$mariadbversion" = "3" ];then
    wget -O /root/Downloads/mariadb_repo_setup https://downloads.mariadb.com/MariaDB/mariadb_repo_setup
    sudo bash /root/Downloads/mariadb_repo_setup --mariadb-server-version=10.5
    sudo dnf -vy install boost-program-options
    sudo dnf -vy module reset mariadb
    sudo dnf -vy install MariaDB-server MariaDB-client MariaDB-backup
    sudo systemctl enable --now mariadb
    sudo systemctl start mariadb
elif [ "$mariadbversion" = "4" ];then
    wget -O /root/Downloads/mariadb_repo_setup https://downloads.mariadb.com/MariaDB/mariadb_repo_setup
    sudo bash /root/Downloads/mariadb_repo_setup --mariadb-server-version=10.6
    sudo dnf -vy install boost-program-options
    sudo dnf -vy module reset mariadb
    sudo dnf -vy install MariaDB-server MariaDB-client MariaDB-backup
    sudo systemctl enable --now mariadb
    sudo systemctl start mariadb 
else
    echo "Out of options please choose between 1-4"  
fi
;;

25)
#PostgreSQL
printf "\nPlease Choose Your Desired PostgreSQL Version\n\n1-)PostgreSQL 9.6\n2-)PostgreSQL 10\n3-)PostgreSQL 11\n\
4-)PostgreSQL 12\n5-)PostgreSQL 13\n6-)PostgreSQL 14\n\nPlease Select Your PostgreSQL Version:"
read -r postgresql_version
sudo dnf -vy install https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm
sudo dnf -vy module disable postgresql
sudo dnf clean all
if [ "$postgresql_version" = "1" ];then
    sudo dnf -y install postgresql96-server postgresql96
    sudo /usr/pgsql-96/bin/postgresql-96-setup initdb
    sudo systemctl enable postgresql-96
    sudo systemctl start postgresql-96
elif [ "$postgresql_version" = "2" ];then
    sudo dnf -y install postgresql10-server postgresql10
    sudo /usr/pgsql-10/bin/postgresql-10-setup initdb
    sudo systemctl enable postgresql-10
    sudo systemctl start postgresql-10
elif [ "$postgresql_version" = "3" ];then
    sudo dnf -y install postgresql11-server postgresql11
    sudo /usr/pgsql-11/bin/postgresql-11-setup initdb
    sudo systemctl enable postgresql-11
    sudo systemctl start postgresql-11
elif [ "$postgresql_version" = "4" ];then
    sudo dnf -y install postgresql12-server postgresql12
    sudo /usr/pgsql-12/bin/postgresql-12-setup initdb
    sudo systemctl enable postgresql-12
    sudo systemctl start postgresql-12
elif [ "$postgresql_version" = "5" ];then
    sudo dnf -y install postgresql13-server postgresql13
    sudo /usr/pgsql-13/bin/postgresql-13-setup initdb
    sudo systemctl enable postgresql-13
    sudo systemctl start postgresql-13
elif [ "$postgresql_version" = "6" ];then
    sudo dnf -y install postgresql14-server postgresql14
    sudo /usr/pgsql-14/bin/postgresql-14-setup initdb
    sudo systemctl enable postgresql-14
    sudo systemctl start postgresql-14
else
    echo "Out of options please choose between 1-6"
fi
;;

26)
#Postman
printf "\nPlease Choose Your Desired Postman Version \n\n1-)Postman (Snap)\n2-)Postman (From .tar.gz File)\n\n\
Please Select Your Postman Version:"
read -r postman_version
if [ "$postman_version" = "1" ];then
    sudo snap install postman
elif [ "$postman_version" = "2" ];then
    sudo mkdir -pv /root/Downloads/postman-latest
    wget -O /root/Downloads/postman-latest.tar.gz https://dl.pstmn.io/download/latest/linux64
    tar xvf /root/Downloads/postman-latest.tar.gz -C /root/Downloads/postman-latest --strip-components 1
    sudo ln -s /root/Downloads/Postman /usr/local/bin/postman
else
    echo "Out of options please choose between 1-2"
fi
;;

27)
#Docker
sudo dnf -vy install yum-utils
sudo dnf -vy install https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.6-3.3.el7.x86_64.rpm
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
sudo dnf -vy install docker-ce --nobest docker-ce-cli containerd.io
systemctl start docker
systemctl enable docker
#printf "\nDocker Installation Has Finished\n\n"
;;

28)
#Jenkins
sudo dnf -vy install java-1.8.0-openjdk
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo dnf -vy install jenkins 
sudo systemctl start jenkins.service
sudo systemctl enable jenkins.service
sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp
sudo firewall-cmd --reload
printf "\nJenkins Installation Has Finished\n\n"
;;

29)
printf "\nPlease Choose Your Desired Nodejs Version\n\n1-)Nodejs 10 (Official Repo)\n2-)Nodejs 12\n\
3-)Nodejs 14\n4-)Nodejs 16\n\nPlease Select Your Nodejs Version:"
read -r nodejsversion
if [ "$nodejsversion" = "1" ];then
    sudo dnf -vy remove nodejs
    sudo dnf -vy module disable nodejs:12
    sudo dnf -vy module disable nodejs:14
    sudo dnf -vy module disable nodejs:16
    sudo dnf -vy module enable nodejs:10
    sudo dnf -vy install nodejs
    node --version
elif [ "$nodejsversion" = "2" ];then
    sudo yum remove nodejs -y
    sudo dnf -vy module disable nodejs:10
    sudo dnf -vy module disable nodejs:14
    sudo dnf -vy module disable nodejs:16
    sudo dnf -vy module enable nodejs:12
    sudo dnf -vy install nodejs
    node --version
elif [ "$nodejsversion" = "3" ];then
    sudo dnf -vy remove nodejs 
    sudo dnf -vy module disable nodejs:10
    sudo dnf -vy module disable nodejs:12
    sudo dnf -vy module disable nodejs:16
    sudo dnf -vy module enable nodejs:14
    sudo dnf -vy install nodejs
    node --version
elif [ "$nodejsversion" = "4" ];then
    sudo dnf -vy remove nodejs
    sudo dnf -vy module disable nodejs:10
    sudo dnf -vy module disable nodejs:12
    sudo dnf -vy module disable nodejs:14
    sudo dnf -vy module enable nodejs:16
    sudo dnf -vy install nodejs
    node --version
else
    echo "Out of options please choose between 1-4"  
fi
;;

30)
#Tinc
printf "\nPlease Choose Your Desired Tinc Version\n\n1-)Tinc (From Official Repository)\n2-)Tinc Latest Stable(Compile From Source)\n3-)Tinc Latest Pre-Release 1.1(Compile From Source)\n\nPlease Select Your Tinc:"
read -r tincversion
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
elif [ "$tincversion" = "4" ];then
    cd /root/Downloads/tinc-latest && make -j "$core" uninstall
    cd /root/Downloads/tinc-latest-pre && make -j "$core" uninstall
    sudo yum -y remove tinc
    sudo snap install tinc-vpn
    tinc-vpn.tincd --version
else
    echo "Out of options please choose between 1-4"
fi
;;

31)
#Irssi (IRC)
printf "\nPlease Choose Your Desired Irssi Version\n\n1-)Irssi (From Official Repository) \n2-)Irssi (snap)(Newer version)\n\nPlease Select Your Irssi Version:"
read -r irssiversion
if [ "$irssiversion" = "1" ];then
    sudo snap remove irssi
    sudo dnf -vy install irssi
    printf "\nIrssi (From Official Repository) Installation Has Finished\n\n"
elif [ "$irssiversion" = "2" ];then
    sudo dnf -vy remove irssi
    sudo snap install irssi
    printf "\nIrssi (snap)(Newer version) Installation Has Finished\n\n"
fi
;;
        esac
    fi
done