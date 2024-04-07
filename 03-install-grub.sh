pacman -S grub efibootmgr dosfstools mtools os-prober
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=grub_uefi --recheck
cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo
grub-mkconfig -o /boot/grub/grub.cfg
echo "*** consider /etc/default/grub GRUB_DEFAULT=\"1>2\" ***"
echo "consider: nvidia_drm.modeset=1"
