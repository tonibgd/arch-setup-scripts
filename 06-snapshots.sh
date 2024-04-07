# sudo
pacman -S snapper grub-btrfs inotify-tools compsize
yay -S btrfs-assistant snapper-rollback
umount /.snapshots
rm -r /.snapshots
snapper -c root create-config /
btrfs subvolume delete /.snapshots
mkdir /.snapshots
chmod 750 /.snapshots
mount -a
systemctl enable grub-btrfsd
