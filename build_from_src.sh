echo "###################################################################"
echo "  Installing linux cnc...."
if [ ! -d "machinekit" ]; then
    git clone https://github.com/machinekit/machinekit.git
fi
cd machinekit
debian/configure -pr
sudo mk-build-deps -ir
cd src
./autogen.sh
./configure
make
sudo make setuid