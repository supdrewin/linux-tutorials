#!/usr/bin/env bash

#
# This script is written by Supdrewin
# Tue Apr 5 01:20:35 PM UTC 2022
#

echo "--country China" >>/etc/xdg/reflector/reflector.conf

systemctl restart reflector &
PID=$!

DISK=$(find /dev -name 'sd[a-z]' | head -1)
EXIT_FAILURE=1

[[ $DISK ]] || {
        echo "not SATA disk found"
        exit $EXIT_FAILURE
}

echo "g
n


+260M
t
1
n



w" | fdisk "$DISK"

mkfs.ext4 "${DISK}2"
mkfs.fat -F32 "${DISK}1"

mount "${DISK}2" /mnt && mkdir /mnt/boot
mount "${DISK}1" /mnt/boot

while ps $PID >/dev/null; do
        echo -n wait...
        sleep 1
done

pacstrap /mnt base linux linux-firmware networkmanager
genfstab -U /mnt >>/mnt/etc/fstab

UUID=$(cat </mnt/etc/fstab | grep -A1 "${DISK}2" | tail -1)
echo "root=${UUID%/*}" >/mnt/etc/kernel/cmdline

arch-chroot /mnt bash -c "$(sed -n 54,75p "$0")"
umount -R /mnt && exit $?

ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc

echo "en_US.UTF-8 UTF-8" >>/etc/locale.gen
locale-gen

echo "LANG=en_US.UTF-8" >/etc/locale.conf
echo "archvm" >/etc/hostname

echo "root
root" | passwd

mkdir -p /boot/efi/boot && objcopy \
        --add-section .osrel="/usr/lib/os-release" --change-section-vma .osrel=0x20000 \
        --add-section .cmdline="/etc/kernel/cmdline" --change-section-vma .cmdline=0x30000 \
        --add-section .splash="/usr/share/systemd/bootctl/splash-arch.bmp" --change-section-vma .splash=0x40000 \
        --add-section .linux="/boot/vmlinuz-linux" --change-section-vma .linux=0x2000000 \
        --add-section .initrd="/boot/initramfs-linux.img" --change-section-vma .initrd=0x3000000 \
        "/usr/lib/systemd/boot/efi/linuxx64.efi.stub" "/boot/efi/boot/bootx64.efi"

systemctl enable NetworkManager
echo "Installation finished!"
