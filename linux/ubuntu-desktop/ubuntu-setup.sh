sudo apt-get update -y

sudo apt-get install vim -y
sudo apt-get install curl -y
sudo apt-get install git -y
sudo apt-get install tree -y
sudo apt-get install exfat-fuse exfat-utils -y

sudo apt-get install vlc -y
sudo apt-get install keepassxc -y
sudo apt-get install terminator -y

# python
sudo apt-get install python-pip -y
sudo apt-get install python3-pip -y

# atom
sudo add-apt-repository ppa:webupd8team/atom
sudo apt-get update -y
sudo apt-get install atom -y

# nodejs
sudo apt-get install nodejs -y
sudo apt-get install npm -y
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash

# nginx
sudo apt-get install nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx
sudo chown www-data:www-data /usr/share/nginx/html/ -R

sudo apt-get install mysql-server -y
sudo systemctl enable mysql
sudo systemctl start mysql

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
