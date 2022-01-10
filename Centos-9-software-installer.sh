#!/bin/bash

# Variables
cpuarch=`uname -m`
core=`nproc`
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
options=("PHP ${opts[1]}" "Grub Customizer ${opts[2]}" "Snap ${opts[3]}" "Python 2.7.18 ${opts[4]}" 
"WineHQ Latest ${opts[5]}" "Htop ${opts[6]}" "FFmpeg ${opts[7]}" "Done ${opts[8]}")
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
            "Snap ${opts[3]}")
                choice 3
                break
                ;;
            "Python 2.7.18 ${opts[4]}")
                choice 4
                break
                ;;
            "WineHQ Latest ${opts[5]}")
                choice 5
                break
                ;;
            "Htop ${opts[6]}")
                choice 6
                break
                ;;
            "FFmpeg ${opts[7]}")
                choice 7
                break
                ;;
            "Done ${opts[8]}")
                break 2
                ;;
            *) printf '%s\n' 'Please Choose Between 1-8';;
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
sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm -y
sudo yum install yum-utils -y
sudo yum install wget curl mlocate nano lynx net-tools git -y
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
#PHP 7.4 - 8.1
sudo yum install http://rpms.remirepo.net/enterprise/remi-release-9.rpm -y
printf "\nPlease Choose Your Desired PHP Version\n\n1-)PHP7.4\n2-)PHP8.0\n3-)PHP8.1\n\nPlease Select Your PHP Version:"
read phpversion
if [ "$phpversion" = "1" ];then
    sudo yum install php74 php74-php-pecl-mysql php74-php-ioncube-loader php74-php-pecl-memcache php74-php-pecl-memcached -y
elif [ "$phpversion" = "2" ];then
    sudo yum install php80 php80-php-pecl-mysql php80-php-pecl-memcache php80-php-pecl-memcached -y
elif [ "$phpversion" = "3" ];then
    sudo yum install php81 php81-php-pecl-mysql php81-php-pecl-memcache php81-php-pecl-memcached -y
else
    echo "Out of option Please Choose between 1-3"
:
fi
printf "\nPHP installation Has Finished\n\n"
;;


2)
#Grub Customizer
sudo yum install lynx gtkmm30-devel libarchive-devel openssl-devel -y
grub_customizer_link=`lynx -dump https://launchpad.net/grub-customizer/ | awk '/http/{print $2}' | grep -iv 'asc' | grep -i tar.gz | head -n 1`
sudo wget -O /root/Downloads/grub-latest.tar.gz $grub_customizer_link
sudo mkdir -pv /root/Downloads/grub-latest
tar xzvf /root/Downloads/grub-latest.tar.gz -C /root/Downloads/grub-latest --strip-components 1
cd /root/Downloads/grub-latest
cmake . && make
sudo make install

;;

3)
#Snap From Source Code
sudo yum install gcc valgrind xfsprogs-devel selinux-policy-devel autoconf automake libtool glib2-devel libcap-devel libseccomp-devel libudev-devel -y
sudo yum groupinstall 'Development Tools' -y 
sudo wget -O /root/Downloads/python3-docutils-0.16-6.el9.noarch.rpm https://www.rpmfind.net/linux/centos-stream/9-stream/CRB/x86_64/os/Packages/python3-docutils-0.16-6.el9.noarch.rpm
sudo rpm -ivh /root/Downloads/python3-docutils-0.16-6.el9.noarch.rpm
sudo dnf --enablerepo=crb install glibc-static -y
sudo wget -O /root/Downloads/go1.17.5.linux-amd64.tar.gz https://go.dev/dl/go1.17.5.linux-amd64.tar.gz
sudo mkdir -pv /root/Downloads/go-latest
rm -rf /usr/local/go && tar -C /usr/local -xzvf /root/Downloads/go1.17.5.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
source ~/.bash_profile
rpmbuild -bb --build-in-place packaging/fedora/snapd.spec
#sudo wget -O /root/Downloads/Python-2.7.18.tgz https://www.python.org/ftp/python/2.7.18/Python-2.7.18.tgz
#tar xzvf /root/Downloads/Python-2.7.18.tgz
#cd /root/Downloads/Python-2.7.18
#./configure --prefix=/usr/local --enable-optimizations
#make -j$core && make -j$core altinstall
;;

4)
#Python 2.7.18
sudo wget -O /root/Downloads/Python-2.7.18.tgz https://www.python.org/ftp/python/2.7.18/Python-2.7.18.tgz
tar xzvf /root/Downloads/Python-2.7.18.tgz
cd /root/Downloads/Python-2.7.18
./configure --prefix=/usr/local --enable-optimizations
make -j$core && make -j$core altinstall
;;

5)
#WineHQ Latest
sudo mkdir -pv /root/Downloads/winelatest
wine_latest=`lynx -dump https://dl.winehq.org/wine/source/ | awk '/http/{print $2}' | grep -iv README | grep wine/source | tail -n 1`
wine_latest=`lynx -dump  $wine_latest | awk '/http/{print $2}' | grep -i tar.xz | grep -iv sign | tail -n 1`
sudo yum groupinstall 'Development Tools' -y
sudo yum install libX11-devel zlib-devel libxcb-devel libxslt-devel libgcrypt-devel libxml2-devel gnutls-devel libpng-devel libjpeg-turbo-devel libtiff-devel gstreamer1-devel dbus-devel fontconfig-devel freetype-devel -y
sudo wget -O /root/Downloads/winelatest.tar.xz $wine_latest
tar xvf /root/Downloads/winelatest.tar.xz -C /root/Downloads/winelatest --strip-components 1
cd /root/Downloads/winelatest/
./configure --enable-win64
make -j $core
make install
;;

6)
#Htop
sudo yum install ncurses-devel automake autoconf gcc -y
git clone https://github.com/htop-dev/htop.git /root/Downloads/htop
cd /root/Downloads/htop
./autogen.sh && ./configure && make -j $core && make -j $core install
;;

7)
#FFmpeg
sudo mkdir -pv /root/Downloads/ffmpeglatest
ffmpeg_latest=`lynx -dump https://www.ffmpeg.org/releases/ | awk '/http/{print $2}' | grep -iv '.asc\|md5\|snapshot' | grep -i tar.gz | tail -n 1`
sudo wget -O /root/Downloads/ffmpeglatest.tar.gz $ffmpeg_latest
tar xvf /root/Downloads/ffmpeglatest.tar.gz -C /root/Downloads/ffmpeglatest --strip-components 1
cd /root/Downloads/ffmpeglatest/
./configure --disable-x86asm
make -j $core && make -j $core install
;;
        esac
    fi
done