ping 8.8.8.8

# didn't need to set the keyboard because it is set to US by default

# EFI creation
# boot partition is of type 'ef'
fdisk

# sda1 - boot
# sda2 - /
mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda2

# mount the drives
# start with / then create boot, home, etc folders
mount /dev/sda2 /mnt
mkdir -p /mnt/boot/
mount /dev/sda1 /mnt/boot

pacstrap /mnt base base-devel grub-efi-x86_64 zsh vim git efibootmgr btrfs-progs

# fstab is used to define how disk partitions, 
# various other block devices, or remote filesystems 
# should be mounted into the filesystem.

# Each filesystem is described in a separate line. 
# These definitions will be converted into systemd mount units dynamically at boot, 
# and when the configuration of the system manager is reloaded. 
# The default setup will automatically fsck and mount filesystems 
# before starting services that need them to be mounted.

genfstab -U /mnt >> /mnt/etc/fstab

# Chroot is an operation that changes the apparent root directory for 
# the current running process and their children. 
# A program that is run in such a modified environment cannot access files
# and commands outside that environmental directory tree. 
# This modified environment is called a chroot jail.

arch-chroot /mnt /bin/bash

# locale defines which language the system uses, and other regional considerations
# such as currency donimation, numerology, and character sets

# uncomment en_US.UTF-8 UTF-8 in /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf

# update your timezone
tzselect
ln -s /usr/share/zoneinfo/US/Mountain /etc/localtime
hwclock --systohc --utc

# set hostname
echo "xnc" > /etc/hostname

# Set password for root
passwd

# add user and set user's password
useradd -m -g users -G wheel -s /bin/zsh jmeline
passwd jmeline

# add user to sudoers
su - && sudo visudo -f /etc/sudoers
## uncomment Wheel

# update linux kernel from linux to linux-lts
pacman -S linux-lts linux-lts-headers

# mkinitcpio is the next generation of initramfs creation. initramfs = initial RAM file system,
# successor of initrd ("initial ramdisk")

# It is a cpio ("copy in and out") archive of the initial file system that gets 
# loaded into memory during the Linux startup process. 
# The Linux kernel copies the contents of the archive into the built-in rootfs 
# file-system-like infrastructure (which is either based on ramfs, or the more 
# regulated tmpfs), and then attempts to run the resulting /init program, before 
# falling back on older methods of initialization; the init program is meant to 
# complete certain tasks before the "real" or final root file system is mounted over 
# rootfs. Thus, initramfs needs to contain all of the device drivers and tools needed 
# to mount the final root file system.

# In computing, initrd (initial ramdisk) is a scheme for loading a temporary root 
# file system into memory, which may be used as part of the Linux startup process. 
# initrd and initramfs refer to two different methods of achieving this. 
# Both are commonly used to make preparations before the real root file 
# system can be mounted. 

# Configure mkinitcpio with modules needed for the initrd image
vim /etc/mkinitcpio.conf
# Add 'ext4' to MODULES
mkinitcpio -p linux-lts

# setup grub
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

umount -R /mnt
reboot

## post installation stuff! To be continued!!!
# virtualbox-guest-utils for VirtualBox Guest utilities with X support

pacman -S xorg-server xorg-server-utils xorg-xinit \
	virtualbox-guest-utils termite 

# for linux kernel choose virtualbox-guest-modules-arch
pacman -S virtualbox-guest-modules-arch 

## or ##
# for linux-lts kernel choose virtualbox-guest-dkms
#	You also need to install linux-headers and linux-lts-headers
pacman -S virtualbox-guest-dkms

sudo systemctl start vboxservice.service
sudo systemctl enable vboxservice.service

## make sure you increase the size of the gpu memory and enable 3D accerlation
## and processor cores so that fullscreen. Restart vm afterwards.

## install goodies and files

# install font
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Sauce Code Pro Black Nerd Font Complete Mono.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/SourceCodePro/Black/complete/Sauce%20Code%20Pro%20Black%20Nerd%20Font%20Complete.ttf

# install prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

ln -sf $(pwd)/zsh/.zshrc ~/.zshrc

# install nvim from source
ln -sf $(pwd)/vim/.vimrc ~/.vimrc
mkdir -p ~/.config/nvim
ln -sf ~/.vimrc ~/.config/nvim/init.vim

# color scheme for termite
sudo pacman -S npm
npm install -g base16-builder

base16-builder -s eighties -t termite -b dark >> ~/.config/termite/config

# install tmux and silver surfer
sudo pacman -S the_silver_searcher tmux
ln -sf $(pwd)/tmux/.tmux.conf ~/.tmux.conf

# install neovim
git clone https://github.com/neovim/neovim
sudo pacman -S base-devel cmake unzip python-neovim lua ninja
cd neovim
make CMAKE_BUILD_TYPE=Release
sudo make install



