pacman -S xorg-server
pacman -S plasma-meta sddm plasma-wayland-session packagekit-qt5 pipewire pipewire-alsa pipewire-pulse pipewire-jack
systemctl enable sddm
# intel/amd: mesa
# gpu drivers
pacman -S nvidia nvidia-lts nvidia-zen
# wayland - nvidia drm
