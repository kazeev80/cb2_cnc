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
echoGreen "  Update /etc/apt/sources.list"
sudo cp /etc/apt/sources.list /etc/apt/sources.list.old
sudo bash -c "cat  /etc/apt/sources.list.old > /etc/apt/sources.list"
sudo bash -c "echo 'deb     http://buildbot.linuxcnc.org/ jessie 2.7-sim'                >> /etc/apt/sources.list"
sudo bash -c "echo 'deb-src http://buildbot.linuxcnc.org/ jessie 2.7-sim'                >> /etc/apt/sources.list"
sudo rm /etc/apt/sources.list.old
sudo apt-get autoremove -y -f
sudo apt-get clean
sudo apt-get update -y

echoYellow "###################################################################"
echoGreen "  Installing linux cnc...."
sudo apt-get install linuxcnc -y -f
sudo apt-get autoremove -y -f
sudo apt-get clean
