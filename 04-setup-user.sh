username=toni

# setup root password
passwd
# create new user
useradd -m -g users -G wheel $username
# setup password
passwd $username
# check if sudo is installed: pacman -S sudo
# uncomment wheel
visudo

