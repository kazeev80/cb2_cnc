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
echoGreen "Remove packeges"
sudo apt-get -y --force-yes autoremove

echoGreen "Remove ajenti"
sudo apt-get remove -y --force-yes ajenti

echoGreen "Remove mc"
sudo apt-get -y remove mc mc-data

echoGreen "Remove python"
sudo apt-get remove -y python python-dbus python-dbus-dev python-gi python-minimal python-support python2.7 python2.7-minimal

sudo apt-get remove -y gsfonts-x11 libfontenc1 libx11-data \
		       libxau6  libxdmcp6 libxfont1

sudo apt-get remove -y gsfonts-x11 libx11-6 libx11-xcb1 x11-common x11-utils

echoGreen "Remove java"
sudo apt-get remove -y --force-yes java-common oracle-java7-jdk oracle-java7-jre

sudo apt-get -y --force-yes autoremove
sudo apt-get clean

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
# http://linuxforum.ru/post/413228

sudo bash -c "sh ./prepare-cubian/script/mykeyboardconf.sh"

sudo cp /etc/locale.gen  /etc/locale.gen.orig
sudo bash -c "cat /etc/locale.gen.orig \
        | sed -e 's/\# ru_RU.UTF-8 UTF-8/ru_RU.UTF-8 UTF-8/' > /etc/locale.gen"
sudo locale-gen
sudo localedef -i ru_RU -f UTF-8 ru_RU.UTF-8
sudo apt-get install -y console-cyrillic
sudo dpkg-reconfigure console-cyrillic

sudo apt-get install -y console-data
sudo dpkg-reconfigure keyboard-configuration
