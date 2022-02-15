#/bin/bash

set -x

systemctl stop sddm.service

echo 0 > /sys/class/vtconsole/vtcon0/bind
echo 0 > /sys/class/vtconsole/vtcon1/bind

echo efi-framebuffer.0 > /sys/bus/platform/drivers/efi-framebuffer/unbind

sleep 3

virsh nodedev-detach pci_0000_2e_00_0
virsh nodedev-detach pci_0000_2e_00_1

modprobe vfio-pci
