#arch-chroot /mnt

pcname=Thanatos
localtimezone=Europe/Belgrade
swapsize=8g

# add btrfs to modules: MODULES=(btrfs)
sed -i "s/MODULES=()/MODULES=(btrfs)/g" /etc/mkinitcpio.conf
mkinitcpio -p linux
mkinitcpio -p linux-lts
mkinitcpio -p linux-zen
# uncomment locale in /etc/locale.gen
sed -i '/en_US.UTF-8/s/^#//' /etc/locale.gen
locale-gen

# services
systemctl enable NetworkManager
systemctl enable fstrim.timer
systemctl enable firewalld
systemctl enable reflector.timer

# timezone setup
#timedatectl set-timezone $localtimezone
#systemctl enable systemd-timesyncd

# host setup
hostnamectlctl set-hostname $pcname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "127.0.1.1 $pcname" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts

# swap setup
btrfs filesystem mkswapfile --size $swapsize --uuid clear /swap/swapfile
swapon /swap/swapfile
echo "/swap/swapfile none swap defaults 0 0" >> /etc/fstab

# yay install
#git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si && cd .. && rm -rf yay-bin
