#!/bin/bash

check() {
        return 255
}

depends() {
    echo dbus bash
    return 0
}

installkernel() {
    return 0
}

install() {
        inst_simple /etc/customnet/customnet "/usr/bin/customnet"
        inst_simple "$moddir"/customnet.service "$systemdsystemunitdir"/customnet.service
        inst_simple "$moddir"/customnet-wpa.service "$systemdsystemunitdir"/customnet-wpa.service

        inst_binary wpa_supplicant "/sbin/wpa_supplicant"
        inst_binary wpa_cli "/sbin/wpa_cli"
        inst_binary wg
        inst_binary wg-quick
        inst_binary sort

        inst_libdir_file "NetworkManager/1.42.4-2/libnm-device-plugin-wifi.so"

        inst_simple "/usr/share/dbus-1/system-services/fi.w1.wpa_supplicant1.service"
        inst_simple "/usr/share/dbus-1/system.d/wpa_supplicant.conf"

        $SYSTEMCTL -q --root "$initdir" enable customnet.service
}
