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
echoGreen "set locales"
sudo dpkg-reconfigure locales

echoYellow "###################################################################"
echoGreen "set timezone"
sudo dpkg-reconfigure tzdata

#echoYellow "###################################################################"
#echoGreen "remove pachages"
#sudo aptitude purge x11-common lxde gconf2-common gnome-desktop3-data -y
#sudo aptitude purge lxappearance lxde-common lxde-icon-theme lxinput lxmenu-data lxpanel lxpanel-data lxpolkit lxrandr lxsession lxsession-edit lxshortcut lxtask lxterminal -y
#sudo aptitude purge python python-minimal python2.7 python2.7-minimal python3 python3-minimal python3.2 python3.2-minimal -y
#sudo aptitude purge `sudo dpkg --get-selections | grep "\-dev" | sed s/install//` -y
#sudo aptitude purge `sudo dpkg --get-selections | grep -v "deinstall" | grep sound | sed s/install//` -y
#sudo aptitude purge `sudo dpkg --get-selections | grep -v "deinstall" | grep x11 | sed s/install//` -y
#sudo aptitude purge xkb-data xdg-utils xarchiver weston epiphany-browser-data gconf-service gconf2-common gnome-desktop3-data gnome-icon-theme gnome-icon-theme-symbolic gnome-themes-standard gnome-themes-standard-data libgconf-2-4 libgnome-keyring-common libgnome-keyring0 libsoup-gnome2.4-1 libxml2 gconf-service gconf2-common aspell bash-completion binutils bzip2 ca-certificates cgroup-bin cifs-utils console-setup-linux cups-common dbus debian-reference-common desktop-file-utils dictionaries-common ed fbset file fontconfig fontconfig-config fonts-freefont-ttf freepats fuse gdbserver gir1.2-glib-2.0 gsfonts gstreamer1.0-libav gstreamer1.0-omx gstreamer1.0-plugins-base hicolor-icon-theme init-system-helpers initramfs-tools isc-dhcp-client isc-dhcp-common java-common keyboard-configuration klibc-utils krb5-locales less logrotate lua5.1 luajit make makedev menu menu-xdg mime-support module-init-tools  ncdu ncurses-term  netsurf-common nfs-common openresolv parted pciutils perl pkg-config psmisc qdbus strace tasksel usbutils v4l-utils xz-utils zenity-common libaspell15 libasyncns0 libavahi-client3 libavahi-common-data libavahi-common3 libavahi-glib1 libavahi-gobject0 libavcodec53 libavutil51 libavutil52 libbluetooth3 libbluray1 libboost-iostreams1.46.1 libboost-iostreams1.48.0 libboost-iostreams1.49.0 libboost-iostreams1.50.0 libbsd0 libcap2 libcdio-cdda1 libcdio-paranoia1 libcdio13 libchromaprint0 libck-connector0 libcups2 libcurl3 libcwidget3 libdatrie1 libdca0 libdirac-encoder0 libdrm-nouveau1a libdrm-radeon1 libdrm2 libdvdnav4 libdvdread4 libedit2 libenca0 libept1.4.12 libexif12 libexpat1 libfaad2 libffi5 libfftw3-3 libflac8 libfontenc1 libfreetype6 libfribidi0 libfuse2 libgcrypt11 libgdbm3 libgdk-pixbuf2.0-common libgif4 libgirepository-1.0-1 libgl1-mesa-dri libglapi-mesa libglib2.0-0 libglib2.0-data libgme0 libgnutls26 libgomp1 libgpg-error0 libgphoto2-port0 libgpm2 libgraphite2-2.0.0 libgsm1 libgssapi-krb5-2 libgtk2.0-common libgtop2-7 libgtop2-common libharfbuzz-icu0 libharfbuzz0a libhunspell-1.3-0 libid3tag0 libident libidn11 libilmbase6 libiw30 libjack-jackd2-0 libjasper1 libjavascriptcoregtk-3.0-0 libjbig0 libjpeg8 libjson0 libk5crypto3 libkate1 libkeyutils1 libklibc libkrb5-3 libkrb5support0 liblcms1 libldap-2.4-2 libltdl7  libmagic1 libmimic0 libmms0 libmng1 libmodplug1 libmp3lame0 libmpg123-0 libnettle4 libnewt0.52 libnih-dbus1 libnih1 libnspr4 libnss3 libofa0 libogg0 libopenal-data libopenal1 libopencv-calib3d2.4 libopencv-core2.4 libopencv-features2d2.4 libopencv-flann2.4 libopencv-imgproc2.4 libopencv-ml2.4 libopencv-photo2.4 libopencv-stitching2.4 libopencv-ts2.4 libopencv-video2.4 libopenexr6 libopenjpeg2 libopts25 liborc-0.4-0 libp11-kit0 libpipeline1 libpixman-1-0 librtmp0 libsamplerate0 libsasl2-2 libsasl2-modules libsbc1 libschroedinger-1.0-0 libsecret-1-0 libsecret-common libwebkitgtk-3.0-common libwebp2 libwildmidi-config libwildmidi1 libwnck-3-common libx264-123 libxapian22 libxau6 libxcb-glx0 libxcb-render0 libxcb-shm0 libxcb-util0 libxcb1 libxdmcp6 libxfont1 libxvidcore4 libpng12-0 libpolkit-agent-1-0 libpolkit-backend-1-0 libpolkit-gobject-1-0 libqt4-xml libqtcore4 libqtdbus4 libsigc++-1.2-5c2 libsigc++-2.0-0c2a libsndfile1 libspandsp2 libspeex1 libsqlite3-0 libsrtp0 libswscale2 libsysfs2 libsystemd-login0 libtasn1-3 libthai-data libthai0 libtheora0 libtiff4 libva1 libvorbis0a libvorbisenc2 libvpx1 -y

echoYellow "###################################################################"
echoGreen "  Current version `cat /etc/debian_version`"
echoGreen "  Update to Debian 8"

echoYellow "###################################################################"
echoGreen "  Update /etc/apt/sources.list"
sudo bash -c "echo 'deb http://debian.mirror.yandex.ru/debian/ jessie main contrib'              > /etc/apt/sources.list"
sudo bash -c "echo 'deb http://security.debian.org/ jessie/updates main contrib'                >> /etc/apt/sources.list"
sudo bash -c "echo 'deb http://debian.mirror.yandex.ru/debian/ jessie-updates main contrib'     >> /etc/apt/sources.list"
sudo bash -c "echo 'deb http://packages.cubian.org/ wheezy main non-free'                           >> /etc/apt/sources.list"
sudo apt-get update -y
sudo apt-get autoremove -y -f
sudo apt-get clean
sudo apt-get update -y

#echoYellow "###################################################################"
#echoGreen "  Add /etc/apt/preferences.d/00-linux-sunxi"
#sudo bash -c "echo 'Package: *'                            > /etc/apt/preferences.d/00-linux-sunxi"
#sudo bash -c "echo 'Pin: origin packages.linux-sunxi.org' >> /etc/apt/preferences.d/00-linux-sunxi"
#sudo bash -c "echo 'Pin-Priority: 10'                     >> /etc/apt/preferences.d/00-linux-sunxi"

#echoGreen "  Add /etc/apt/sources.list.d/linux-sunxi.list"
#sudo bash -c "echo 'deb http://packages.linux-sunxi.org/ubuntu/ quantal main'      > /etc/apt/sources.list.d/linux-sunxi.list"
#sudo bash -c "echo 'deb-src http://packages.linux-sunxi.org/ubuntu/ quantal main'>> /etc/apt/sources.list.d/linux-sunxi.list"

#sudo apt-get clean
#sudo apt-get update -y

echoYellow "###################################################################"
echoGreen "  udev update"
sudo  touch /etc/udev/kernel-upgrade
sudo apt-get install udev -y
sudo apt-get autoremove -y -f
sudo apt-get clean

echoYellow "###################################################################"
echoGreen "  Upgrade packages"
sudo apt-get upgrade -y
sudo apt-get autoremove -y -f
sudo apt-get clean

echoYellow "###################################################################"
echoGreen "  Dist upgrade"
# 5.6. Upgrading installs the new default init system for Jessie
# https://www.debian.org/releases/jessie/amd64/release-notes/ch-information.ru.html#systemd-upgrade-default-init-system
# не даем установить systemd-sysv
sudo bash -c "echo 'Package: systemd-sysv'            >  /etc/apt/preferences.d/local-pin-init"
sudo bash -c "echo 'Pin: release o=Debian'           >>  /etc/apt/preferences.d/local-pin-init"
sudo bash -c "echo 'Pin-Priority: -1'                >>  /etc/apt/preferences.d/local-pin-init"

sudo apt-get autoremove -y -f
sudo apt-get clean
sudo apt-get dist-upgrade -f -y
sudo apt-get autoremove -y -f
sudo apt-get clean

echoYellow "###################################################################"
echoGreen "  Отключить IPV6 http://e-kzn.ru/adminu/kak-otkliuchit-ipv6-v-debian.html"
echo "disable IPv6"
sudo bash -c "echo net.ipv6.conf.all.disable_ipv6=1 > /etc/sysctl.d/disableipv6.conf"

echoYellow "###################################################################"
echoGreen "  Устанавливаем RDP клиент"
sudo apt-get install xrdp -y -f

echoYellow "###################################################################"
echoGreen "  Устанавливаем VIM"
sudo apt-get install vim -y -f
sudo apt-get install htop -y -f

echoYellow "###################################################################"
echo -n "  Current version"
cat /etc/debian_version
echoYellow "###################################################################"

#sudo reboot
