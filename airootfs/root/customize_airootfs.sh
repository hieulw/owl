#!/bin/bash

set -e -u

sed -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
locale-gen

ln -sf /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime
hwclock --systohc

usermod -s /usr/bin/zsh root
cp -aT /etc/skel/ /root/
chmod 700 /root
#useradd -m -p "" -g users -G wheel -s /usr/bin/zsh guest
#chown -R guest:users /home/guest
chown -R root:root /etc/sudoers /etc/sudoers.d /root

#sed -i 's/#\(PermitRootLogin \).\+/\1yes/' /etc/ssh/sshd_config
sed -i "s/#Server/Server/g" /etc/pacman.d/mirrorlist
sed -i 's/#\(Storage=\)auto/\1volatile/' /etc/systemd/journald.conf
sed -i 's/\(autodetect\ modconf\)/plymouth\ \1/' /etc/mkinitcpio.conf
#sed -i 's/#\(HandleSuspendKey=\)suspend/\1ignore/' /etc/systemd/logind.conf
#sed -i 's/#\(HandleHibernateKey=\)hibernate/\1ignore/' /etc/systemd/logind.conf
#sed -i 's/#\(HandleLidSwitch=\)suspend/\1ignore/' /etc/systemd/logind.conf

echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf

systemctl enable pacman-init.service
systemctl set-default multi-user.target
