#!/bin/bash

#screen settings
gsettings set com.system76.hidpi enable false
xrandr --output eDP-1 --mode 1920x1080
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
gsettings set org.gnome.desktop.interface cursor-size 48
gsettings set org.gnome.desktop.interface text-scaling-factor 1.2
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.interface enable-animations false
killall -3 gnome-shell

#apt/flatpak updates
sudo add-apt-repository -y ppa:sebastian-stenzel/cryptomator
sudo apt update -y &&  sudo apt full-upgrade -y
sudo flatpak update
sudo pop-upgrade release update
sudo pop-upgrade release upgrade
sudo dpkg --configure -a
sudo apt full-upgrade -y --fix-broken

#dependency
sudo apt install -y gnome-tweaks git cryptomator

#github files
git clone https://github.com/amadotejada/popos-bootstrap.git ~/macos
mkdir ~/.themes
mkdir ~/.icons
sudo cp -rf ~/macos/themes/* ~/.themes
sudo cp -rf ~/macos/icons/* ~/.icons
sudo cp -rf ~/macos/wallpapers/* /usr/share/backgrounds/

#set theme
gsettings set org.gnome.desktop.background picture-uri 'file:///usr/share/backgrounds/pop/tony-webster-97532.jpg'
gsettings set org.gnome.mutter center-new-windows 'true'
gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:'
gsettings set org.gnome.desktop.interface gtk-theme "WhiteSur-dark"
gsettings set org.gnome.desktop.wm.preferences theme "WhiteSur-dark"
gsettings set org.gnome.desktop.interface cursor-theme 'capitaine-cursors-light'

wget https://go.microsoft.com/fwlink/?LinkID=760868 -O ~/vscode-latest.deb
sudo apt install -y ./vscode-latest.deb
rm vscode-latest.deb

wget https://github.com/Automattic/simplenote-electron/releases/download/v1.21.1/Simplenote-linux-1.21.1-amd64.deb -O ~/simplenote.deb
sudo apt install -y ./simplenote.deb
rm simplenote.deb

wget https://addons.mozilla.org/firefox/downloads/latest/chrome-gnome-shell@gnome.org -O ~/chrome-gnome-shell.xpi
firefox ~/chrome-gnome-shell.xpi
rm chrome-gnome-shell.xpi

firefox https://extensions.gnome.org/extension/307/dash-to-dock/ https://extensions.gnome.org/extension/277/impatience/ https://extensions.gnome.org/extension/517/caffeine/ https://extensions.gnome.org/extension/945/cpu-power-manager/ https://extensions.gnome.org/extension/779/clipboard-indicator/ https://extensions.gnome.org/extension/1036/extensions/ https://extensions.gnome.org/extension/744/hide-activities-button/ https://extensions.gnome.org/extension/750/openweather/ https://extensions.gnome.org/extension/905/refresh-wifi-connections/ https://extensions.gnome.org/extension/1031/topicons/ https://extensions.gnome.org/extension/442/drop-down-terminal/ https://extensions.gnome.org/extension/760/minimize-all/ 

gsettings --schemadir ~/.local/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com/schemas/ set org.gnome.shell.extensions.dash-to-dock animate-show-apps false
gsettings --schemadir ~/.local/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com/schemas/ set org.gnome.shell.extensions.dash-to-dock custom-theme-shrink true

#expressvpn
wget https://www.expressvpn.com/expressvpn_release_public_key_0xAFF2A1415F6A3A38.asc
gpg --import expressvpn_release_public_key_0xAFF2A1415F6A3A38.asc
rm expressvpn_release_public_key_0xAFF2A1415F6A3A38.asc
wget https://www.expressvpn.works/clients/linux/expressvpn_3.1.0.34-1_amd64.deb -O ~/expressvpn.deb
sudo apt install -y ./expressvpn.deb
rm expressvpn.deb

#setup autologin
hello=$(whoami)
sudo sed -i 's/#  AutomaticLoginEnable = true[^ ]*/AutomaticLoginEnable=True/' /etc/gdm3/custom.conf
sudo sed -i 's/#  AutomaticLogin = user1[^ ]*/AutomaticLogin='"$hello"'/' /etc/gdm3/custom.conf

#install flatpaks
flatpak install -y flathub io.bit3.WhatsAppQT com.obsproject.Studio com.mattermost.Desktop org.telegram com.slack.Slack com.discordapp.Discord org.gimp.GIMP org.videolan.VLC us.zoom.Zoom

#check/update firmwares
fwupdmgr get-devices
fwupdmgr get-updates
fwupdmgr update

echo "Done - Reboot"

#future
# gsettings --schemadir ~/.local/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com/schemas/ set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
# gsettings set org.gnome.desktop.interface icon-theme 'BigSur'
# gsettings get org.gnome.desktop.screensaver picture-uri 'file:///usr/share/backgrounds/macOS-BS1.jpg'
# curl https://build.opensuse.org/projects/home:manuelschneid3r/public_key |  apt-key add -
# echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_20.04/ /' |  tee /etc/apt/sources.list.d/home:manuelschneid3r.list
# wget -nv https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_20.04/Release.key -O "/etc/apt/trusted.gpg.d/home:manuelschneid3r.asc"
# sudo apt update
# sudo apt install albert -y
