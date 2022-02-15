#!/bin/bash

set -x

virsh nodedev-reattach pci_0000_2e_00_0
virsh nodedev-reattach pci_0000_2e_00_1


echo 1 > /sys/class/vtconsole/vtcon0/bind
echo 1 > /sys/class/vtconsole/vtcon1/bind

echo "efi-framebuffer.0" > /sys/bus/platform/drivers/efi-framebuffer/bind

systemctl start sddm.service
