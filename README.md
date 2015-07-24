# gendev-macos
Genesis/MegaDrive Development Environment for Mac OS X

This project is based on mattkubilus's gendev project.
Check his wonderful work first,please!
https://code.google.com/p/gendev/

The purpose of my project is to make gendev be able to build and work properly on Mac OSX 
with minimal changes applied.

## Prerequisites
###OS and Build tools
Mac OS X 10.8.5 with XCode 5.x command line tools is the reference build environment for
current version.That means it should be successfully built under Clang 5.x.

*I have not test building it with toolchain in MacPorts.So if you have MacPorts installed 
and got failed in building.I suggest you install a clean OS X in a Virtual Machine and get
a copy of XCode command line tool from https://developer.apple.com/downloads/

**Recently I have received error reports on building this toolchain under OS X Yosemite
with XCode 6.x command line tools.I will update this toolchain build script soon.Actually 
I think several files in gcc should be patched to adopt Clang 6.x.

###WGET
Wget is required during the build progress to download several external source packages.
```
#Download, compile and install wget:
curl -O http://ftp.gnu.org/gnu/wget/wget-1.16.tar.gz
tar -xzf wget-1.16.tar.gz
cd wget-1.16
./configure --with-ssl=openssl
make
sudo make install
cd .. && rm -rf wget*
```

###Build path accessibility
The path /opt/toolchains/gen/ may required to be created manually with root permission.
And it should be chmoded to make the shell user writable.
```
sudo mkdir -p /opt/toolchains/gen
sudo chmod -R 777 /opt
```

## Basic Instructions:
```
git clone http://github.com/SONIC3D/gendev-macos.git
cd gendev-macos
make
```