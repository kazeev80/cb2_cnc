sudo apt-get update
sudo apt-get install git build-essential make gcc autoconf libtool debhelper \
dh-autoreconf pkg-config automake xutils-dev libx11-dev libxext-dev libdrm-dev \
x11proto-dri2-dev libxfixes-dev xorg-dev libltdl-dev mesa-utils

mkdir ~/hw_accleration
cd ~/hw_accleration
git clone https://github.com/robclark/libdri2.git
git clone https://github.com/linux-sunxi/libump.git
git clone https://github.com/linux-sunxi/sunxi-mali.git
git clone https://github.com/ssvb/xf86-video-fbturbo.git

cd ~/hw_accleration
cd libdri2
./autogen.sh
./configure --prefix=/usr
make
sudo make install
sudo ldconfig

cd ~/hw_accleration
cd libump
autoreconf -i
./configure
make
make install
sudo ldconfig

cd ~/hw_accleration
cd libump
dpkg-buildpackage -b
sudo dpkg -i ../libump_3.0-0sunxi1_armhf.deb
sudo dpkg -i ../libump-dev_3.0-0sunxi1_armhf.deb
sudo ldconfig


cd ~/hw_accleration
cd sunxi-mali
git submodule init
git submodule update

make config
sudo make install

cd ~/hw_accleration
cd xf86-video-fbturbo
autoreconf -v -i
./configure --prefix=/usr
make
sudo make install


sudo bash -c "echo 'Section \"Screen\"
        Identifier        \"My Screen\"
        Device          \"Allwinner A10/A13 FBDEV\"
        Monitor         \"My Monito\r"
EndSection
 
Section \"Device\"
        Identifier        \"Allwinner A10/A13 FBDEV\"
        Driver          \"fbturbo\"
        Option          \"fbdev\" \"/dev/fb0\"
        Option          \"SwapbuffersWait\" \"true\"
        Option          \"AccelMethod\" \"G2D\"
EndSection
 
Section \"Monitor\"
        Identifier        \"My Monitor\"
        Option          \"DPMS\" \"false\"
EndSection'      > /etc/X11/xorg.conf.d/99-fbturbo.conf"

sudo bash -c "echo 'KERNEL==\"mali\", MODE=\"0660\", GROUP=\"video\"
KERNEL==\"ump\", MODE=\"0660\", GROUP=\"video\"
KERNEL==\"disp\", MODE=\"0660\", GROUP=\"video\"
KERNEL==\"g2d\", MODE=\"0660\", GROUP=\"video\"
KERNEL==\"fb*\", MODE=\"0660\", GROUP=\"video\"
KERNEL==\"cedar_dev\", MODE=\"0660\", GROUP=\"video\"'      > /etc/udev/rules.d/50-mali.rules"


sudo usermod -aG video $USER
