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
"OpenSSL ${opts[11]}" "Done ${opts[12]}")
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
            "Done ${opts[12]}")
                break 2
                ;;
            *) printf '%s\n' 'Please Choose Between 1-12';;
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
subscription-manager repos --enable codeready-builder-for-rhel-8-$(arch)-rpms
sudo dnf -vy install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
sudo dnf -vy install yum-utils dnf-utils
sudo dnf -vy install --nogpgcheck https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-8.noarch.rpm \
https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-8.noarch.rpm
sudo dnf -vy install wget curl mlocate nano lynx net-tools git iftop htop snapd bash-completion make cmake \
bind-utils iotop powertop atop bzip2 bzip2-devel bzip2-libs
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
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
grub_customizer_link=`lynx -dump https://launchpad.net/grub-customizer/ | awk '/http/{print $2}' | grep -iv 'asc' | \
grep -i tar.gz | head -n 1`
sudo wget -O /root/Downloads/grub-latest.tar.gz $grub_customizer_link
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
    wine_latest=`lynx -dump https://dl.winehq.org/wine/source/ | awk '/http/{print $2}' | grep -iv README | grep wine/source | \
    tail -n 1`
    wine_latest=`lynx -dump  $wine_latest | awk '/http/{print $2}' | grep -i tar.xz | grep -iv sign | tail -n 1`
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
    sudo wget -O /root/Downloads/winelatest.tar.xz $wine_latest
    tar xvf /root/Downloads/winelatest.tar.xz -C /root/Downloads/winelatest --strip-components 1
    cd /root/Downloads/winelatest/
    ./configure --enable-win64
    make -j $core && make -j "$core" install
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
;;

6)
#Apache2
printf "\nPlease Choose Your Desired Apache Version\n\n1-)Apache 2(From Official Package)\n\
2-)Apache Latest(Compile From Source)\n\nPlease Select Your Apache Version:"
read -r apacheversion
if [ "$apacheversion" = "1" ];then
    sudo install apache2 -y
elif [ "$apacheversion" = "2" ];then
    apache_latest=$(lynx -dump https://dlcdn.apache.org//httpd | awk '{print $2}' | grep -iv '.asc\|.sha' | grep -i .tar.gz | tail -n 1)
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
    sudo wget -O /root/Downloads/transmission-latest.tar.xz $transmission_latest
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
    wget -O /root/Downloads/nmap-latest.rpm $nmap_latest_rpm
    sudo rpm -Uvh --nodeps /root/Downloads/nmap-latest.rpm
elif [ "$nmap_version" = "3" ];then
    sudo mkdir -pv /root/Downloads/nmap-latest
    nmap_latest_source=$(lynx -dump https://nmap.org/download.html | awk '/http/{print $2}' | grep -i .tgz | head -n 1)
    wget -O /root/Downloads/nmap-latest.tgz $nmap_latest_source
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
    sudo dnf -vy remove openssl openssl-devel
    sudo rm -rf /root/Downloads/openssl-latest
    sudo dnf -vy group install 'Development Tools'
    sudo dnf -vy install perl gcc
    openssl_latest=$(lynx -dump https://www.openssl.org/source/ | awk '{print $2}' | grep -iv '.asc\|sha\|fips' \
    | grep -i openssl-1 | head -n 1)
    wget -O /root/Downloads/openssl-latest.tar.gz "$openssl_latest"
    sudo mkdir -pv /root/Downloads/openssl-latest
    tar -xvf /root/Downloads/openssl-latest.tar.gz -C /root/Downloads/openssl-latest --strip-components 1
    cd /root/Downloads/openssl-latest
    ./config --prefix=/usr         \
         --openssldir=/etc/ssl \
         --libdir=lib          \
         shared                \
         zlib-dynamic
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
        esac
    fi
done