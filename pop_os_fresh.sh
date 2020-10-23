#!/bin/bash

#apt/flatpak updates
sudo add-apt-repository -y ppa:sebastian-stenzel/cryptomator
sudo apt update -y &&  sudo apt full-upgrade -y
sudo flatpak update
sudo pop-upgrade release update
sudo pop-upgrade release upgrade
sudo dpkg --configure -a
sudo apt full-upgrade -y --fix-broken
sudo apt install -y gnome-tweaks git cryptomator

#screen settings
gsettings set com.system76.hidpi enable false
xrandr --output eDP-1 --mode 1920x1080
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
gsettings set org.gnome.desktop.interface cursor-size 32
gsettings set org.gnome.desktop.interface text-scaling-factor 1.25
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.interface enable-animations false
gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:'
gsettings set org.gnome.desktop.background picture-uri 'file:///usr/share/backgrounds/pop/kate-hazen-unleash-your-robot.png'
# gsettings set org.gnome.mutter center-new-windows 'true'

#gnome-extentions
wget https://addons.mozilla.org/firefox/downloads/latest/chrome-gnome-shell@gnome.org -O ~/chrome-gnome-shell.xpi
firefox ~/chrome-gnome-shell.xpi
rm chrome-gnome-shell.xpi

wget -O gnome-shell-extension-installer "https://github.com/brunelli/gnome-shell-extension-installer/raw/master/gnome-shell-extension-installer"
chmod +x gnome-shell-extension-installer
sudo mv gnome-shell-extension-installer /usr/bin/
gnome-shell-extension-installer 307 277 517 945 779 1036 442 760 1401 1276 --yes --restart-shell

gsettings --schemadir ~/.local/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com/schemas/ set org.gnome.shell.extensions.dash-to-dock animate-show-apps false
gsettings --schemadir ~/.local/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com/schemas/ set org.gnome.shell.extensions.dash-to-dock custom-theme-shrink true

#apps
curl https://rclone.org/install.sh | sudo bash

wget https://go.microsoft.com/fwlink/?LinkID=760868 -O ~/vscode-latest.deb
sudo apt install -y ./vscode-latest.deb
rm vscode-latest.deb

wget https://github.com/Automattic/simplenote-electron/releases/download/v2.0.0/Simplenote-linux-2.0.0-amd64.deb -O ~/simplenote.deb
sudo apt install -y ./simplenote.deb
rm simplenote.deb

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys ACCAF35C
sudo echo "deb http://apt.insync.io/ubuntu focal non-free contrib" | sudo tee -a /etc/apt/sources.list.d/insync.list
sudo apt update -y &&  sudo apt install -y insync

sudo apt-key --keyring /usr/share/keyrings/1password.gpg adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FEF9748469ADBE15DA7CA80AC2D62742012EA22
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password.gpg] https://downloads.1password.com/linux/debian edge main' | sudo tee /etc/apt/sources.list.d/1password.list

sudo apt update && sudo apt install -y tigervnc-viewer htop 1password
# sudo apt-get install -y ubuntu-restricted-extras

#expressvpn
wget https://www.expressvpn.com/expressvpn_release_public_key_0xAFF2A1415F6A3A38.asc
gpg --import expressvpn_release_public_key_0xAFF2A1415F6A3A38.asc
rm expressvpn_release_public_key_0xAFF2A1415F6A3A38.asc
wget https://www.expressvpn.works/clients/linux/expressvpn_3.2.0.8-1_amd64.deb -O ~/expressvpn.deb
sudo apt install -y ./expressvpn.deb
rm expressvpn.deb

#setup autologin
hello=$(whoami)
sudo sed -i 's/#  AutomaticLoginEnable = true[^ ]*/AutomaticLoginEnable=True/' /etc/gdm3/custom.conf
sudo sed -i 's/#  AutomaticLogin = user1[^ ]*/AutomaticLogin='"$hello"'/' /etc/gdm3/custom.conf

#install flatpaks
flatpak install -y flathub org.filezillaproject.Filezilla io.bit3.WhatsAppQT com.obsproject.Studio com.mattermost.Desktop org.telegram com.slack.Slack com.discordapp.Discord org.gimp.GIMP com.skype.Client org.videolan.VLC us.zoom.Zoom

#check/update firmwares
fwupdmgr get-devices
fwupdmgr get-updates
fwupdmgr update

sudo dpkg --configure -a
sudo apt full-upgrade -y --fix-broken
sudo apt update -y &&  sudo apt full-upgrade -y
sudo flatpak update
sudo pop-upgrade release update
sudo pop-upgrade release upgrade

echo "Done - Reboot"

# future
# gsettings --schemadir ~/.local/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com/schemas/ set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
# gsettings set org.gnome.desktop.interface icon-theme 'BigSur'
# gsettings get org.gnome.desktop.screensaver picture-uri 'file:///usr/share/backgrounds/macOS-BS1.jpg'
# curl https://build.opensuse.org/projects/home:manuelschneid3r/public_key |  apt-key add -
# echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_20.04/ /' |  tee /etc/apt/sources.list.d/home:manuelschneid3r.list
# wget -nv https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_20.04/Release.key -O "/etc/apt/trusted.gpg.d/home:manuelschneid3r.asc"
# sudo apt update
# sudo apt install albert -y
