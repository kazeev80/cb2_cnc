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
echoGreen "set locales"
sudo dpkg-reconfigure locales

echoYellow "###################################################################"
echoGreen "set timezone"
sudo dpkg-reconfigure tzdata

echoYellow "###################################################################"
echoGreen "  Current version `cat /etc/debian_version`"
echoGreen "  Update to Debian 8"

echoYellow "###################################################################"
echoGreen "  Update /etc/apt/sources.list"
sudo bash -c "echo 'deb http://debian.mirror.yandex.ru/debian/ sid jessie main contrib'              > /etc/apt/sources.list"
sudo bash -c "echo 'deb http://security.debian.org/ jessie/updates sid main contrib'                >> /etc/apt/sources.list"
sudo bash -c "echo 'deb http://debian.mirror.yandex.ru/debian/ sid jessie-updates main contrib'     >> /etc/apt/sources.list"
sudo bash -c "echo 'deb http://packages.cubian.org/ wheezy main non-free'                           >> /etc/apt/sources.list"
sudo apt-get autoremove -y -f
sudo apt-get clean
sudo apt-get update -y

echoYellow "###################################################################"
echoGreen "  Add /etc/apt/preferences.d/00-linux-sunxi"
sudo bash -c "echo 'Package: *'                            > /etc/apt/preferences.d/00-linux-sunxi"
sudo bash -c "echo 'Pin: origin packages.linux-sunxi.org' >> /etc/apt/preferences.d/00-linux-sunxi"
sudo bash -c "echo 'Pin-Priority: 10'                     >> /etc/apt/preferences.d/00-linux-sunxi"

echoGreen "  Add /etc/apt/sources.list.d/linux-sunxi.list"
sudo bash -c "echo 'deb http://packages.linux-sunxi.org/ubuntu/ quantal main'      > /etc/apt/sources.list.d/linux-sunxi.list"
sudo bash -c "echo 'deb-src http://packages.linux-sunxi.org/ubuntu/ quantal main'>> /etc/apt/sources.list.d/linux-sunxi.list"

sudo apt-get clean
sudo apt-get update -y

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

echoYellow "###################################################################"
echo -n "  Current version"
cat /etc/debian_version
echoYellow "###################################################################"

sudo reboot
