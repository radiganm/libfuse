#!/usr/bin/make -f
## boostrap.mk (for libfuse)
## Mac Radigan

.PHONY: packages-apt install clean
.DEFAULT_GOAL := install

install:
	(mkdir -p build; cd build; meson .. && mesonconf && ninja && sudo ninja install)
	## see https://github.com/libfuse/libfuse/issues/178
	(sudo mv /usr/local/etc/init.d/fuse3 /etc/init.d/ && update-rc.d fuse3 start 34 S . start 41)

clean:
	-rm -rf build

packages-apt:
	sudo apt-get install -y meson
	sudo apt-get install -y ninja

## *EOF*
