pacman -S xorg-server
# plasma-wayland-session
pacman -S plasma-meta sddm packagekit-qt5 pipewire pipewire-alsa pipewire-pulse pipewire-jack
systemctl enable sddm
# intel/amd: mesa
# gpu drivers
pacman -S nvidia nvidia-lts nvidia-zen nvidia-utils
# wayland - nvidia drm
