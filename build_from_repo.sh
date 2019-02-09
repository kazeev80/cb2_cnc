sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 43DDF224
sudo sh -c \
  "echo 'deb http://deb.machinekit.io/debian stretch main' > \
  /etc/apt/sources.list.d/machinekit.list"
sudo apt-get update
sudo apt install machinekit-rt-preempt -y
sudo apt install machinekit-manual-pages -y
sudo apt-get autoremove -y
sudo apt-get clean