apt-get install git live-build cdebootstrap -y
git clone git://git.kali.org/live-build-config.git
cd live-build-config
./build.sh --distribution kali-rolling --verbose
