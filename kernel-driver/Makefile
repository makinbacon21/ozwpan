# -----------------------------------------------------------------------------
# Copyright (c) 2011 Ozmo Inc
# Released under the GNU General Public License Version 2 (GPLv2).
# -----------------------------------------------------------------------------

# Kernel source directory
KVERSION ?= $(shell uname -r)
KSRC ?= /lib/modules/$(KVERSION)/build
KMOD_SRC ?= $(CURDIR)
KMOD_OPTIONS = CONFIG_USB_WPAN_HCD=m

all:
	$(MAKE) -C $(KSRC) M=$(KMOD_SRC) $(KMOD_OPTIONS) modules EXTRA_CFLAGS="$(EXTRA_CFLAGS)"

clean:
	$(MAKE) -C $(KSRC) M=$(KMOD_SRC) clean

install:
	$(MAKE) -C $(KSRC) M=$(KMOD_SRC) modules_install

.PHONY: all clean install load unload reload test

load:
	insmod $(KMOD_SRC)/ozwpan.ko

unload:
	-rmmod ozwpan

reload: unload load

test: all reload

# Kernel module build configuration
obj-$(CONFIG_USB_WPAN_HCD) += ozwpan.o
ozwpan-y := \
	ozmain.o \
	ozpd.o \
	ozusbsvc.o \
	ozusbsvc1.o \
	ozhcd.o \
	ozeltbuf.o \
	ozproto.o \
	ozcdev.o \
	ozurbparanoia.o
