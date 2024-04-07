lsblk

# nvme0n1
# nvme0n1p1
# nvme0n1p2
drive=/dev/vda
part1=$drive"1"
part2=$drive"2"

sgdisk --zap-all $drive
sgdisk -n 0:0:+512MiB -t 0:ef00 -c 0:efi $drive
sgdisk -n 0:0:0 -t 0:8300 -c 0:root $drive

mkfs.fat -F32 $part1
mkfs.btrfs $part2

mount $part2 /mnt
cd /mnt
btrfs subvolume create @
btrfs subvolume create @home
btrfs subvolume create @var_log
btrfs subvolume create @pkg
btrfs subvolume create @snapshots
btrfs subvolume create @var_tmp
btrfs subvolume create @swap
cd /
umount /mnt

mount -o noatime,compress=zstd,space_cache=v2,discard=async,subvol=@ $part2 /mnt

mkdir -p /mnt/boot/efi
mount $part1 /mnt/boot/efi

mkdir /mnt/home
mount -o noatime,compress=zstd,space_cache=v2,discard=async,subvol=@home $part2 /mnt/home

mkdir -p /mnt/var/log
mount -o noatime,compress=zstd,space_cache=v2,discard=async,subvol=@var_log $part2 /mnt/var/log

mkdir -p /mnt/var/cache/pacman/pkg
mount -o noatime,compress=zstd,space_cache=v2,discard=async,subvol=@pkg $part2 /mnt/var/cache/pacman/pkg

mkdir /mnt/.snapshots
mount -o noatime,compress=zstd,space_cache=v2,discard=async,subvol=@snapshots $part2 /mnt/.snapshots

mkdir -p /mnt/var/tmp
mount -o noatime,compress=zstd,space_cache=v2,discard=async,subvol=@var_tmp $part2 /mnt/var/tmp

mkdir /mnt/swap
mount -o noatime,subvol=@swap $part2 /mnt/swap

lsblk
echo "subvolumes created and mounted to /mnt"
