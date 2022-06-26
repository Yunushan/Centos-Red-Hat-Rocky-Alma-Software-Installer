#!/bin/bash

#3-Snap From Source Code
sudo dnf -vy install gcc valgrind xfsprogs-devel selinux-policy-devel autoconf automake libtool glib2-devel libcap-devel \
libseccomp-devel libudev-devel
sudo dnf -vy groupinstall 'Development Tools'
sudo wget -O /root/Downloads/python3-docutils-0.16-6.el9.noarch.rpm \
https://www.rpmfind.net/linux/centos-stream/9-stream/CRB/x86_64/os/Packages/python3-docutils-0.16-6.el9.noarch.rpm
sudo rpm -ivh /root/Downloads/python3-docutils-0.16-6.el9.noarch.rpm
sudo dnf -vy --enablerepo=crb install glibc-static
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