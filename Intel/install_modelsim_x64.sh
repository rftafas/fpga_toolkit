#!/bin/bash
echo -n "Insert modelsim installation path:"
read MODELSIM_PATH

CURRENT_DIR=$(PWD)

sudo apt update
sudo apt upgrade

# Make the vco script writable
FILE=$(MODELSIM_PATH)/vco
if test -f "$FILE"; then
  chmod u+w $(FILE)
else
  echo "$FILE does not exist. Please, point to Modelsim root dir."
  exit 1
fi

# Make a backup of the vco file
cp $(MODELSIM_PATH)/vco $(MODELSIM_PATH)/vco_original

# Edit the vco script manually, or with these commands:
sed -i 's/linux\_rh[[:digit:]]\+/linux/g' $(MODELSIM_PATH)/vco
sed -i 's/MTI_VCO_MODE:-""/MTI_VCO_MODE:-"32"/g' $(MODELSIM_PATH)/vco
sed -i '/dir=`dirname "$arg0"`/a export LD_LIBRARY_PATH=${dir}/lib32' $(MODELSIM_PATH)/vco

sudo dpkg --add-architecture i386
sudo apt update
sudo apt install build-essential
sudo apt install gcc-multilib g++-multilib lib32z1 \
    lib32stdc++6 lib32gcc1 libxt6:i386 libxtst6:i386 expat:i386 \
    fontconfig:i386 libfreetype6:i386 libexpat1:i386 libc6:i386 \
    libgtk-3-0:i386 libcanberra0:i386 libice6:i386 libsm6:i386 \
    libncurses5:i386 zlib1g:i386 libx11-6:i386 libxau6:i386 \
    libxdmcp6:i386 libxext6:i386 libxft2:i386 libxrender1:i386

cd $(MODELSIM_PATH)
mkdir lib32
cd lib32
wget download.savannah.gnu.org/releases/freetype/freetype-2.4.12.tar.bz2
tar xjf freetype-2.4.12.tar.bz2

# Compile libfreetype
cd freetype-2.4.12/
./configure --build=i686-pc-linux-gnu "CFLAGS=-m32" "CXXFLAGS=-m32" "LDFLAGS=-m32"
make clean
make

#copy to directory
cp $(MODELSIM_PATH)/lib32/freetype-2.4.12/objs/.libs/libfreetype.so* $(MODELSIM_PATH)/lib32/

#adds modelsim to PATH
echo 'export MODELSIM_PATH=$(MODELSIM_PATH)' >> ~/.bashrc
echo 'export PATH=$PATH:$(MODELSIM_PATH)' >> ~/.bashrc
echo 'alias modelsim=vsim' >> ~/.bashrc

cd $(CURRENT_DIR)
