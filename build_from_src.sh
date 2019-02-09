echo "###################################################################"
echo "  Installing linux cnc...."
git clone https://github.com/machinekit/machinekit.git
cd machinekit
debian/configure -pr
sudo mk-build-deps -ir
cd src
./autogen.sh
./configure
make
sudo make setuid