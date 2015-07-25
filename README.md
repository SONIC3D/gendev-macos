# gendev-macos
Genesis/MegaDrive Development Environment for Mac OS X

This project is based on mattkubilus's gendev project.
Check his wonderful work first,please!
https://code.google.com/p/gendev/

The purpose of my project is to make gendev be able to build and work properly on Mac OSX 
with minimal changes applied.

## Prerequisites
###OS and Build tools
Mac OS X Yosemite 10.10.3 with Command Line Tools for XCode 6.4 is the reference build 
environment for current release.That means it should be built with Apple LLVM 6.1.0(clang-
602.0.53).

4.9G disk storage space is required for temporary obj files and target files generation.

*I have not test building it with toolchain in MacPorts.So if you have MacPorts installed 
and got failed in building.I suggest you install a clean OS X in a Virtual Machine and get
a copy of XCode command line tool from https://developer.apple.com/downloads/

### WGET
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

## How to use the toolchain
Make proper exports for the toolchain before compile any genesis/32x project:
```
  export GENDEV=/opt/toolchains/gen
  export PATH=$GENDEV/sh-elf/bin:$GENDEV/m68k-elf/bin:$GENDEV/bin:$PATH
```
Check mattkubilus's gendev project site at the beginning of this file and the url below 
for further information:
  http://gendev.spritesmind.net/forum/viewtopic.php?t=889
