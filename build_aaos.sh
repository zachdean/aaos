# set android build env
sudo apt-get update
sudo apt-get install -y repo
sudo apt-get install -y git-core gnupg flex bison build-essential zip curl zlib1g-dev libc6-dev-i386 libncurses5 x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig

# install additional packages
sudo apt-get install -y bc coreutils dosfstools e2fsprogs fdisk kpartx mtools ninja-build pkg-config python3-pip
sudo pip3 install meson mako jinja2 ply pyyaml

# init repo
repo init -u https://android.googlesource.com/platform/manifest -b android-13.0.0_r35 --depth=1
git clone https://github.com/grapeup/aaos_local_manifest.git .repo/local_manifests

repo sync

. build/envsetup.sh
lunch aosp_rpi4-userdebug
make bootimage systemimage vendorimage

./rpi4-mkimg.sh