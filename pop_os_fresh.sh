#!/bin/bash

#apt/flatpak updates
sudo add-apt-repository -y ppa:sebastian-stenzel/cryptomator
sudo apt update -y
# sudo apt full-upgrade -y
sudo flatpak update
sudo dpkg --configure -a
sudo apt full-upgrade -y --fix-broken
sudo apt install -y gnome-tweaks git cryptomator powertop github-desktop python3-pip vlc neofetch apt-transport-https tigervnc-viewer htop tilix tlp tlp-rdw --no-install-recommends

#fix intel tearing
sudo mkdir /etc/X11/xorg.conf.d/
echo 'Section "Module"
    Load "dri3"
EndSection

Section "Device"
    Identifier  "Intel Graphics"
    Driver      "intel"
    Option      "DRI"   "3"
EndSection' | sudo tee /etc/X11/xorg.conf.d/20-intel-graphics.conf

#desktop settings
# gsettings set org.gnome.desktop.peripherals.touchpad speed 0.7
# gsettings set org.gnome.desktop.peripherals.mouse speed 0.0
# gsettings set org.gnome.desktop.interface text-scaling-factor 1.25
# gsettings set org.gnome.desktop.interface enable-animations false
# gsettings set org.gnome.mutter center-new-windows 'true'
# gsettings set org.gnome.desktop.interface cursor-size 32
# gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:'

gsettings set com.system76.hidpi enable false
xrandr --output eDP-1 --mode 1920x1080
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.background picture-uri 'file:///usr/share/backgrounds/pop/kate-hazen-unleash-your-robot.png'
gsettings set org.gnome.desktop.a11y always-show-universal-access-status true

#gnome-extentions
wget https://addons.mozilla.org/firefox/downloads/latest/chrome-gnome-shell@gnome.org -O ~/chrome-gnome-shell.xpi
firefox ~/chrome-gnome-shell.xpi
rm chrome-gnome-shell.xpi

wget -O gnome-shell-extension-installer "https://github.com/brunelli/gnome-shell-extension-installer/raw/master/gnome-shell-extension-installer"
chmod +x gnome-shell-extension-installer
sudo mv gnome-shell-extension-installer /usr/bin/
gnome-shell-extension-installer 307 517 1036 3933 779 --yes
killall -3 gnome-shell

# 945 powermenu
# 442 drop down terminal
# 760 minimize all
# 277 impatience
# 779 clipboard
# 1401 bluetooth quick
# 1276 night slider

gsettings --schemadir ~/.local/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com/schemas/ set org.gnome.shell.extensions.dash-to-dock animate-show-apps false
gsettings --schemadir ~/.local/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com/schemas/ set org.gnome.shell.extensions.dash-to-dock custom-theme-shrink true

#apps
curl https://rclone.org/install.sh | sudo bash

curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser

wget https://go.microsoft.com/fwlink/?LinkID=760868 -O ~/vscode-latest.deb
sudo apt install -y ./vscode-latest.deb
rm vscode-latest.deb

wget https://github.com/Automattic/simplenote-electron/releases/download/v2.7.0/Simplenote-linux-2.7.0-amd64.deb -O ~/simplenote.deb
sudo apt install -y ./simplenote.deb
rm simplenote.deb

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys ACCAF35C
sudo echo "deb http://apt.insync.io/ubuntu focal non-free contrib" | sudo tee -a /etc/apt/sources.list.d/insync.list
sudo apt update -y && sudo apt install -y insync

# sudo apt-key --keyring /usr/share/keyrings/1password.gpg adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FEF9748469ADBE15DA7CA80AC2D62742012EA22
# echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password.gpg] https://downloads.1password.com/linux/debian edge main' | sudo tee /etc/apt/sources.list.d/1password.list

#bitwarden
wget https://github.com/bitwarden/desktop/releases/download/v1.24.6/Bitwarden-1.24.6-amd64.deb -O ~/bitwarden.deb
sudo apt install -y ./bitwarden.deb
rm bitwarden.deb

#expressvpn
wget https://www.expressvpn.com/expressvpn_release_public_key_0xAFF2A1415F6A3A38.asc
gpg --import expressvpn_release_public_key_0xAFF2A1415F6A3A38.asc
rm expressvpn_release_public_key_0xAFF2A1415F6A3A38.asc
wget https://www.expressvpn.works/clients/linux/expressvpn_3.5.0.33-1_amd64.deb -O ~/expressvpn.deb
sudo apt install -y ./expressvpn.deb
rm expressvpn.deb

#setup autologin
hello=$(whoami)
sudo sed -i 's/#  AutomaticLoginEnable = true[^ ]*/AutomaticLoginEnable=True/' /etc/gdm3/custom.conf
sudo sed -i 's/#  AutomaticLogin = user1[^ ]*/AutomaticLogin='"$hello"'/' /etc/gdm3/custom.conf
sudo sed -i 's/WaylandEnable=false[^ ]*/WaylandEnable=true/' /etc/gdm3/custom.conf

sudo dpkg --configure -a
sudo apt full-upgrade -y --fix-broken
sudo apt update -y && sudo apt full-upgrade -y
sudo flatpak update
echo
flatpak install -y flathub org.filezillaproject.Filezilla io.bit3.WhatsAppQT com.obsproject.Studio com.mattermost.Desktop org.telegram com.slack.Slack com.discordapp.Discord org.gimp.GIMP com.skype.Client us.zoom.Zoom ch.protonmail.protonmail-bridge org.mozilla.Thunderbird com.ulduzsoft.Birdtray org.remmina.Remmina org.signal.Signal org.audacityteam.Audacity com.uploadedlobster.peek com.calibre_ebook.calibre com.spotify.Client fr.handbrake.ghb

#check/update firmwares
fwupdmgr get-devices
fwupdmgr get-updates -y
fwupdmgr update

echo "Done - Reboot"

