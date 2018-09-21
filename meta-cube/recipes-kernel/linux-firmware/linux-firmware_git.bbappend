PACKAGES += "${PN}-cube-shared"

DESCRIPTION_${PN}-cube-shared = "Creates a link for /lib/firmware to \
/opt/container/dom0/rootfs/lib/firmware. This is intended to be used in \
conjunction with dom0-ctl-core. This package is only effective if no \
other linux-firmware(-*) packages are installed."

ALLOW_EMPTY_${PN}-cube-shared = "1"

pkg_postinst_${PN}-cube-shared () {
    # Be a nop if any other linux-firmware(-*) pkgs are found
    if [ ! -e $D/lib/firmware ]; then
        ln -sfr $D/opt/container/dom0/rootfs/lib/firmware $D/lib/firmware
    fi
}