#
# HINT: If makeinfo is missing on Ubuntu, install texinfo package.
#

SUDO?= sudo
MGET?= curl
MAKE?= make
ORIG_USER:=$(shell id -un)
ORIG_GROUP:=$(shell id -gn)
UNAME:=$(shell uname)

BUILDDIR?=$(CURDIR)/build
GENDEV?=/opt/gendev/
TOPDIR=$(CURDIR)

VER=0.3.0

PATH := $(BUILDDIR)/bin:$(PATH)

build: toolchain_build tools_build sgdk_build
	echo "Done"

$(BUILDDIR):
	mkdir -p $@

toolchain_build:
	cd toolchain && make toolchain_build

toolchain_clean:
	cd toolchain && make toolchain_clean

tools_build:
	cd tools && make tools_build

tools_clean:
	cd tools && make tools_clean

sgdk_samples:
	cd sgdk && make sample_clean samples

install:
	if [ -w /opt ]; then \
		mkdir -p $(GENDEV); \
	else \
		$(SUDO) mkdir -p $@; \
		$(SUDO) chown $(ORIG_USER):$(ORIG_GROUP) $@; \
	fi
	echo "export GENDEV=$(GENDEV)" > ~/.gendev
	echo "export PATH=\$$GENDEV/bin:\$$PATH" >> ~/.gendev
	#$(SUDO) chmod 777 $@
	cp -r $(BUILDDIR)/* $(GENDEV)/.

release: txz
	echo "Release"
	# to-do: build pkg for macos?

dist:
	mkdir -p dist

txz: dist/gendev_$(VER).txz
dist/gendev_$(VER).txz: dist pkg_build
	tar -C pkg_build -cJf dist/gendev_$(VER).txz opt

pkg_build:
	mkdir -p pkg_build/opt/gendev
	cp -r $(BUILDDIR)/ pkg_build/opt/gendev/.
	cp -r pkg/* pkg_build/.

sgdk_build:
	cd sgdk && GENDEV=$(BUILDDIR) make install

sgdk_clean:
	- cd sgdk && make clean

clean: tools_clean toolchain_clean sgdk_clean
	-rm -rf $(BUILDDIR)
	-rm -rf pkg_build
	-rm -rf dist

#########################################################
#########################################################
#########################################################

#########################################################
#########################################################
#########################################################

