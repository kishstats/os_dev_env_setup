sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install vim curl git tree ntp htop traceroute mlocate net-tools -y

# python
sudo apt-get install python-pip -y
sudo apt-get install python3-pip -y

# php
sudo apt-get install php php-cli php-fpm php-json php-common php-mysql php-zip php-gd php-imagick php-mbstring php-curl php-xml php-pear php-bcmath php-opcache php-readline -y

sudo systemctl enable php-fpm
sudo systemctl start php-fpm

# nodejs
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
source ~/.nvm/nvm.sh
nvm install 14.5.1
nvm use 14.5.1
npm install --global gulp karma-cli

# mysql
debconf-set-selections <<< 'mysql-server mysql-server/root_password password <password here>'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password <password here>'
sudo apt-get install mysql-server -y
sudo systemctl enable mysql
sudo systemctl start mysql

# nginx
sudo apt-get install nginx -y
sudo chown www-data:www-data /usr/share/nginx/html/ -R
sudo systemctl enable nginx
sudo systemctl start nginx
