COLOR_NORMAL=$(echo -e "\033[m")
COLOR_BLUE=$(echo -e "\033[36m")
COLOR_GREEN=$(echo -e "\033[32m")
COLOR_YELLOW=$(echo -e "\033[33m")
COLOR_GRAY=$(echo -e "\033[37m")
COLOR_RED=$(echo -e "\033[31m")

echoBlue(){
        echo "${COLOR_BLUE}${1}${COLOR_NORMAL}"
}

echoRed(){
        echo "${COLOR_RED}${1}${COLOR_NORMAL}"
}

echoYellow(){
        echo "${COLOR_YELLOW}${1}${COLOR_NORMAL}"
}

echoGreen(){
        echo "${COLOR_GREEN}${1}${COLOR_NORMAL}"
}


echoYellow "###################################################################"
echoGreen "set time via NTP"
sudo ntpdate-debian

echoYellow "###################################################################"
echoGreen "Install debian-keyring"
sudo apt-get install debian-keyring debian-archive-keyring -y

echoYellow "###################################################################"
echoGreen "Update base packages"
sudo apt-get update -y

echoYellow "###################################################################"
echoGreen "Upgrade packages"
sudo apt-get upgrade -y

echoYellow "###################################################################"
echoGreen "  Update sources"
sudo apt-get autoremove -y -f
sudo apt-get clean
sudo apt-get update -y

echoYellow "###################################################################"
echoGreen "  Update mali video drivers"
sudo rm -r xf86-video-fbturbo
git clone https://github.com/ssvb/xf86-video-fbturbo
cd xf86-video-fbturbo
sudo apt-get install git build-essential xorg-dev xutils-dev x11proto-dri2-dev
sudo apt-get install libltdl-dev libtool automake libdrm-dev
autoreconf -vi
./configure --prefix=/usr
sudo make install
sudo cp xorg.conf /etc/X11/xorg.conf
cd ..
sudo rm -r xf86-video-fbturbo

echoYellow "###################################################################"
echoGreen "Install needed packages"
sudo aptitude install -y cython
sudo aptitude install -y uuid-runtime
sudo aptitude install -y libprotobuf-dev
sudo aptitude install -y libprotoc-dev
sudo aptitude install -y protobuf-compiler
sudo aptitude install -y python-setuptools
sudo aptitude install -y libjansson-dev
sudo aptitude install -y liburiparser-dev
sudo aptitude install -y libwebsockets-dev
sudo aptitude install -y libssl-dev
sudo apt install -y libuuid1=2.25.2-6
sudo apt install -y uuid-dev -f
sudo aptitude install libavahi-common3=0.6.31-5 -y
sudo aptitude install libavahi-client-dev -y

sudo easy_install pip
sudo pip install protobuf

sudo aptitude install -y \
    git build-essential libtool \
    pkg-config autotools-dev autoconf automake cmake \
    uuid-dev libpcre3-dev libsodium-dev valgrind
    
git clone git://github.com/zeromq/libzmq.git
cd libzmq
./autogen.sh
# do not specify "--with-libsodium" if you prefer to use internal tweetnacl security implementation (recommended for development)
./configure --with-libsodium
make check
sudo make install
sudo ldconfig
cd ..
sudo rm -r libzmq

git clone git://github.com/zeromq/czmq.git
cd czmq
./autogen.sh && ./configure && make check
sudo make install
sudo ldconfig
cd mc
..
sudo rm -r czmq
sudo apt-get autoremove -y
sudo apt get clean

echoYellow "###################################################################"
echoGreen "  Installing linux cnc...."
