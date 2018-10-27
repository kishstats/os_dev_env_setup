sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install vim curl git tree ntp htop traceroute mlocate -y

# python
sudo apt-get install python-pip -y
sudo apt-get install python3-pip -y

sudo add-apt-repository ppa:ondrej/php -y
sudo apt-get update -y
sudo apt-get install php7.2 php7.2-fpm php7.2-mysql php-common php7.2-cli php7.2-common php7.2-json php7.2-opcache php7.2-readline php7.2-mbstring php7.2-xml php7.2-gd php7.2-curl php7.2-imagick -y

sudo systemctl enable php7.2-fpm
sudo systemctl start php7.2-fpm

wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
source ~/.nvm/nvm.sh
nvm install 8.12.0
nvm use 8.12.0
npm install --global gulp karma-cli

sudo apt-get install mysql-server-5.7 -y
sudo systemctl enable mysql
sudo systemctl start mysql

sudo apt-get install nginx -y
sudo chown www-data:www-data /usr/share/nginx/html/ -R
sudo systemctl enable nginx
sudo systemctl start nginx

touch /etc/php/7.2/fpm/conf.d/99-overrides.ini

sudo cat >> /etc/php/7.2/fpm/conf.d/99-overrides.ini << EndOfMessage
upload_max_filesize = 100M
post_max_size = 10M
extension=gd.so
EndOfMessage
