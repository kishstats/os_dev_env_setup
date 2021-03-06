sudo apt-get update -y

sudo apt-get install vim -y
sudo apt-get install curl -y
sudo apt-get install git -y
sudo apt-get install tree -y
sudo apt-get install exfat-fuse exfat-utils -y
sudo apt-get install ruby -y
sudo apt-get install linkchecker -Y
sudo apt-get -y install gcc make linux-headers-$(uname -r) dkms
sudo apt-get install ntp -y
sudo apt-get install htop -y
sudo apt-get install net-tools -y
sudo apt-get install default-jre -y

sudo apt-get install vlc -y
sudo apt-get install vlc-plugin-access-extra -y
sudo apt-get install keepassxc -y
sudo apt-get install terminator -y

# python
sudo apt-get install python-pip -y
sudo apt-get install python3-pip -y
sudo apt-get install python-virtualenv -y
sudo apt-get install libxml2-dev libxslt-dev python-dev

# atom
sudo add-apt-repository ppa:webupd8team/atom
sudo apt-get update -y
sudo apt-get install atom -y

# visual studio code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get update -y
sudo apt-get install code -y

# nodejs
sudo apt-get install nodejs -y
sudo apt-get install npm -y
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash

# nginx
sudo apt-get install nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx
sudo chown www-data:www-data /usr/share/nginx/html/ -R

# mysql
sudo apt-get install libmysqlclient-dev
sudo apt-get install mysql-server-5.7
sudo systemctl enable mysql
sudo systemctl start mysql
sudo apt-get install mysql-workbench

sudo apt-get install php7.2 php7.2-fpm php7.2-mysql php-common php7.2-cli php7.2-common php7.2-json php7.2-opcache php7.2-readline php7.2-mbstring php7.2-xml php7.2-gd php7.2-curl php7.2-xml -y
sudo systemctl start php7.2-fpm
sudo systemctl enable php7.2-fpm

# MongoDB
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.6 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list
sudo apt-get update -y
sudo apt-get install mongodb-org -y
sudo systemctl stop mongod.service
sudo systemctl start mongod.service
sudo systemctl enable mongod.service

# redis
sudo apt-get install redis-server -y

# virtualbox
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" >> /etc/apt/sources.list.d/virtualbox.list'
sudo apt-get update -y
sudo apt-get install virtualbox-5.2 -y
# vagrant
wget https://releases.hashicorp.com/vagrant/2.1.1/vagrant_2.1.1_x86_64.deb -O /tmp/install.deb
sudo dpkg -i /tmp/install.deb

# docker
wget -qO- https://get.docker.com/ | sh
sudo usermod -aG docker $(whoami)
sudo apt-get install docker-compose

sudo cp ./dotfiles/.vimrc ~

# Insomnia REST Client
# Add to sources
echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" \
    | sudo tee -a /etc/apt/sources.list.d/insomnia.list
# Add public key used to verify code signature
wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc \
    | sudo apt-key add -
# Refresh repository sources and install Insomnia
sudo apt-get update
sudo apt-get install insomnia

## Elasticsearch ##
# Java 8 dependency
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt install oracle-java8-installer
# necessary if multiple versions of Java are installed
sudo update-alternatives --config java

# Actually install Elasticsearch
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list
sudo apt update
sudo apt install elasticsearch
sudo systemctl start elasticsearch
