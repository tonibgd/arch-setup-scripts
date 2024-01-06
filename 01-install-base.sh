pacman -Sy --noconfirm archlinux-keyring
# for amd install amd-ucode
pacstrap /mnt base linux linux-headers linux-lts linux-lts-headers linux-zen linux-zen-headers linux-firmware base-devel git vim sudo intel-ucode btrfs-progs networkmanager ntfs-3g firewalld reflector
genfstab -U /mnt >> /mnt/etc/fstab
sed -i 's/subvolid=.*,//g' /mnt/etc/fstab
echo "removed subvolid from /mnt/etc/fstab"
