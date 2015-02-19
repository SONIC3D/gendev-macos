# gendev-macos
Genesis/MegaDrive Development Environment for Mac OS X

This project is based on mattkubilus's gendev project.
Check his wonderful work first,please!
https://code.google.com/p/gendev/

The purpose of my project is to make gendev be able to build and work properly on Mac OSX 
with minimal changes applied.

## Prerequisites
###WGET
Wget is required during the build progress to download several external source packages.
Download, compile and install wget:
```
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
And it should be chmod to make the shell user writable.
```
sudo mkdir -p /opt/toolchains/gen
chmod -R 777 /opt
```
