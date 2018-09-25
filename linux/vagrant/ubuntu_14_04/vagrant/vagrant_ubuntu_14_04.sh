echo "Running Vagrant Bash Script"
sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install vim curl git tree ntp htop traceroute -y
sudo apt-get install supervisor -y
sudo apt-get install xfsprogs -y

# python
sudo apt-get install python-dev -y
sudo apt-get install libxml2-dev libxslt-dev -y
sudo apt-get install python-virtualenv -y
sudo apt-get install libssl-dev -y
sudo apt-get install libmysqlclient-dev

# python 2.7.10
sudo mkdir ~/src
sudo wget -O ~/src/Python-2.7.10.tgz https://www.python.org/ftp/python/2.7.10/Python-2.7.10.tgz
sudo tar xvfz ~/src/Python-2.7.10.tgz --directory ~/src
sudo ~/src/Python-2.7.10/configure
sudo make
sudo make altinstall

# nodejs
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
source ~/.nvm/nvm.sh
nvm install 6.10.3
nvm use 6.10.3
npm install --global gulp karma-cli

# servers
sudo apt-get install nginx -y
sudo apt-get install redis-server -y
sudo apt-get install postfix -y
sudo apt-get install mysql-server-5.6 -y
