all: clean build

clean:
	lb clean

config:
	lb config
	cp /usr/share/doc/live-build/examples/auto/* auto/
	cp config.org auto/config
	lb config
	echo make >> config/package-lists/my.list.chroot
	echo gcc >> config/package-lists/my.list.chroot

build:
	lb build

run:
	qemu-img create debian.img 750M
	qemu-system-i386 -m size=512 -cdrom live-image-i386.hybrid.iso -hda debian.img -boot d
