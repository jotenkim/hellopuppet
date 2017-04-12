setxkbmap fi
sudo apt-get update
sudo apt-get -y install puppet git
git clone https://github.com/jotenkim/hellopuppet.git
cd hellopuppet	
bash apply.sh
