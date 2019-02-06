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
echoGreen "  Install cyrillic"
sudo bash -c "echo 'style ter-uni-bold'                     >  /etc/console-cyrillic"
sudo bash -c "echo 'size 16'                               >>  /etc/console-cyrillic"
sudo bash -c "echo 'encoding utf-8'                        >>  /etc/console-cyrillic"
sudo bash -c "echo 'layout ru'                             >>  /etc/console-cyrillic"
sudo bash -c "echo 'options ctrl_shift_toggle win_switch'  >>  /etc/console-cyrillic"
sudo bash -c "echo 'ttys /dev/tty[1-6]'                    >>  /etc/console-cyrillic"

echoYellow "###################################################################"
echoGreen "  locale RU.UTF-8"

echo 'VERBOSE_OUTPUT=no
ACTIVE_CONSOLES="/dev/tty[1-6]"

CHARMAP="UTF-8"

CODESET="guess"
FONTFACE="TerminusBold"
FONTSIZE="8x16"

VIDEOMODE=

XKBMODEL="pc105"
XKBLAYOUT="us,ru"
XKBVARIANT=",winkeys"
XKBOPTIONS="grp:ctrl_shift_toggle,grp:rwin_switch,lv3:ralt_switch,grp_led:scroll"
 '> /etc/default/console-setup

echo 'XKBMODEL="pc105"
XKBLAYOUT="us,ru"
XKBVARIANT=","
XKBOPTIONS="grp:ctrl_shift_toggle,grp:rwin_switch,lv3:ralt_switch,grp_led:scroll"

BACKSPACE="guess"'> /etc/default/keyboard

echo 'style ter-uni-framebuf
size 16
encoding utf-8
layout ru
options ctrl_shift_toggle win_switch
ttys /dev/tty[1-6]"'> /etc/console-cyrillic

sudo cp /etc/locale.gen  /etc/locale.gen.orig
sudo bash -c "cat /etc/locale.gen.orig \
        | sed -e 's/\# ru_RU.UTF-8 UTF-8/ru_RU.UTF-8 UTF-8/' > /etc/locale.gen"
sudo locale-gen
sudo localedef -i ru_RU -f UTF-8 ru_RU.UTF-8
sudo apt-get install -y console-cyrillic
sudo dpkg-reconfigure console-cyrillic

sudo apt-get install -y console-data
sudo dpkg-reconfigure keyboard-configuration

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

echoYellow "###################################################################"
echoGreen "  Installing linux cnc...."
