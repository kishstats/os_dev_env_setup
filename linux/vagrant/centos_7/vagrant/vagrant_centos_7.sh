echo "Running Vagrant Bash Script"
sudo yum update -y

# utilities
sudo yum install emacs nmap traceroute wget git gzip gzip2 zip unzip telnet net-tools perl openssh-clients man ntp vim tree -y
sudo yum install bind-utils jwhois parted -y
sudo yum install htop iotop apachetop -y
sudo yum groupinstall "Development Tools" -y
sudo yum install zlib-dev openssl-devel sqlite-devel bzip2-devel xz-libs -y

# out-of-box services
sudo yum install httpd -y
sudo yum install mod_ssl -y

# fonts used by jpgraph plugin
sudo yum install liberation-mono-fonts liberation-sans-fonts liberation-serif-fonts -y

sudo ln -sf /usr/share/zoneinfo/UTC /etc/localtime

sudo ntpdate pool.ntp.org
sudo hwclock --systohc

sudo /etc/init.d/ntpd start

sudo systemctl enable ntpd.service

sudo rpm -Uvh http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
sudo yum install mysql mysql-server mysql-devel -y
# fix permissions
sudo chown -R mysql /var/lib/mysql
sudo chgrp -R mysql /var/lib/mysql
sudo systemctl start mysqld
sudo systemctl enable mysqld.service

# php
sudo rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
sudo yum install yum-plugin-replace -y
sudo yum install php56w php56w-cli php56w-common php56w-gd php56w-mcrypt php56w-mysqlnd php56w-pdo -y
sudo yum install php56w-pecl-apc php56w-pecl-xdebug php56w-process php56w-xml php56w-pear php56w-soap -y

sudo touch /etc/httpd/conf.d/vhosts.conf
# TODO add virtual hosts

sudo cat >> /etc/sysconfig/network << EndOfMessage
  HOSTNAME=mysite.local
EndOfMessage

# TODO add site
sudo cat >> /etc/hosts << EndOfMessage
  192.168.33.13   mysite.local
EndOfMessage

hostname mysite.local

# sudo cat >> /etc/php.ini << EndOfMessage
#   date.timezone = "America/Los_Angeles"
# EndOfMessage

# --- for PyQt4
# first install the EPEL repository for 64bit systems
sudo rpm -Uvh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
sudo yum install python-pip -y
sudo pip install --upgrade pip
sudo yum install python-devel -y
sudo yum install libxslt-devel libxml2-devel -y
sudo yum install rpmdevtools gcc gcc-c++ cmake -y
sudo pip install lxml

sudo yum install PyQt4 PyQt4-webkit -y
sudo yum install qt qt-devel qt-webkit-devel qt-demos qt-designer qt4 qt4-designer -y

sudo yum install xorg-x11-server-Xvfb -y
# issue: can't make "generic.orientation" because no QAccelerometer sensors exist
# /usr/bin/xvfb-run: line 181: 22264 Segmentation fault      DISPLAY=:$SERVERNUM XAUTHORITY=$AUTHFILE "$@" 2>&1

sudo yum install python-pyside -y

# Image manipulation dependencies
sudo yum install -y ImageMagick ImageMagick-devel

# ---

# install python 3
mkdir ~/src
mkdir ~/.localpython
wget -O ~/src/Python-3.6.0.tar.xz http://www.python.org/ftp/python/3.6.0/Python-3.6.0.tar.xz
xz -d ~/src/Python-3.6.0.tar.xz
tar -xvf ~/src/Python-3.6.0.tar -C ~/src
make clean
~/src/Python-3.6.0/configure --prefix=/home/vagrant/.localpython
make
make install

# NOT WORKING
cp -R /usr/lib64/python2.7/site-packages/PyQt4 /home/vagrant/.localpython/lib/python3.6/site-packages

sudo cat >> /home/vagrant/.bashrc << EndOfMessage
alias python3="/home/vagrant/.localpython/bin/python3"
alias pip3="/home/vagrant/.localpython/bin/pip3"
EndOfMessage

sudo cat >> /root/.bashrc << EndOfMessage
alias python3="/home/vagrant/.localpython/bin/python3"
alias pip3="/home/vagrant/.localpython/bin/pip3"
EndOfMessage

sudo chown -R vagrant /var/log/httpd
sudo chgrp -R vagrant /var/log/httpd
sudo chmod -R 775 /var/log/httpd

sudo systemctl start httpd.service
sudo systemctl enable httpd.service

sudo /etc/init.d/network restart

# FirewallD - Vagrant box should have this off by default
sudo systemctl enable firewalld
sudo systemctl start firewalld
sudo firewall-cmd --add-service=http --permanent && sudo firewall-cmd --add-service=https --permanent
sudo systemctl restart firewalld

# for php session
sudo chown -R apache /var/lib/php
sudo chgrp -R apache /var/lib/php

## Manual Processes ##
# disable selinux in /etc/selinux/config

## Site Load Errors
# not having the permissions to view root / folder -- check if selinux is disabled

sudo mkdir -p /mysite/logs
sudo chown -R vagrant /mysite
sudo chgrp -R vagrant /mysite

# TODO remove iptables should not be loaded
# sudo systemctl stop iptables.service; sudo systemctl disable iptables.service
# sudo systemctl stop ip6tables.service; sudo systemctl disable ip6tables.service

# Note: should not be a problem if using vagrant-vbguest plugin
# ** fix local setup (if having shared folder mount issues) **
# sudo yum update -y
# sudo yum install gcc kernel-devel make perl -y
# sudo /opt/VBoxGuestAdditions-4.3.8/init/vboxadd setup
# run the command: vagrant reload
# or: vagrant reload --provision

# Caching ISSUE
# Force Clear Commands
# sudo su
# sync; echo 3 > /proc/sys/vm/drop_caches
# exit
