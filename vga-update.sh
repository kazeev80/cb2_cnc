git clone https://github.com/ssvb/xf86-video-fbturbo
cd xf86-video-fbturbo
sudo apt-get install git build-essential xorg-dev xutils-dev x11proto-dri2-dev
sudo apt-get install libltdl-dev libtool automake libdrm-dev
autoreconf -vi
./configure --prefix=/usr
make
sudo make install
sudo cp xorg.conf /etc/X11/xorg.conf
