#!/bin/bash

DEVICE=/dev/$1
echo "We are about to overwrite $DEVICE"
echo "If you are NOT sure this is the right device press CTRL-C NOW!"
echo "This process will erase the entire device and all data will be lost."
echo "Do NOT continue and press CTRL-C if you are unsure about which device"
echo "is your Neuros LINK usb disc.!"
echo "Flashing in 15 Seconds"
sleep 15

# Restore the grub mbr
echo "Restoring the Master Boot Record"
dd if=/dev/zero of="$DEVICE" bs=512 count=1
dd if=backup.mbr of="$DEVICE"

# Restore the partition table
echo "Restoring the Partition table"
sfdisk $DEVICE < backup.sf

# Restore the boot partition
echo "========== Restoring Boot Partition =============="
partimage -f3 -b restore "$DEVICE"1 boot.partimage.gz
echo "========== Restoring Root Partition =============="
partimage -f3 -b restore "$DEVICE"2 root.partimage.gz

echo "Setup Grub Non interactively"

grub --no-floppy --batch <<EOT 1>/dev/null 2>/dev/null
device (hd0) $DEVICE
root (hd0,0)
setup (hd0)
quit
EOT

echo "Syncing Discs"
sync
echo "\n\nCopy Complete\n"
