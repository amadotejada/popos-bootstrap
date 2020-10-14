
apt update -y &&  apt full-upgrade -y &&  apt autoremove -y &&  apt clean -y &&  apt autoclean -y
flatpak update
pop-upgrade release update
pop-upgrade release upgrade

apt install -y git gnome-tweak-tool gnome-shell-extensions
git clone https://github.com/amadotejada/popos-bootstrap.git ~/macos
mkdir ~/.themes
mkdir ~/.icons
mv ~/macos/themes/* ~/.themes
mv ~/macos/icons/* ~/.icons
mv ~/macos/wallpapers/* /usr/share/backgrounds/

#dependency
apt install -y gnome-tweaks git

wget https://go.microsoft.com/fwlink/?LinkID=760868 -O ~/vscode-latest.deb
apt install -y ./vscode-latest.deb

wget https://github.com/Automattic/simplenote-electron/releases/download/v1.21.1/Simplenote-linux-1.21.1-amd64.deb -O ~/simplenote.deb
apt install -y ./simplenote.deb

wget https://zoom.us/client/latest/zoom_amd64.deb -O ~/zoom-latest.deb
apt install -y ./zoom-latest.deb

wget https://addons.mozilla.org/firefox/downloads/latest/chrome-gnome-shell@gnome.org -O ~/chrome-gnome-shell.xpi
firefox ~/chrome-gnome-shell.xpi

apt install -y vlc slack elegram-desktop mattermost-desktop spotify-client gimp discord caffeine

gsettings set org.gnome.mutter center-new-windows 'true'
gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:'
gsettings set org.gnome.desktop.interface gtk-theme "WhiteSur-dark"
gsettings set org.gnome.desktop.wm.preferences theme "WhiteSur-dark"
gsettings set org.gnome.desktop.interface icon-theme 'BigSur'
gsettings set org.gnome.desktop.interface cursor-theme 'capitaine-cursors-light'
gsettings set org.gnome.desktop.background picture-uri 'file:///usr/share/backgrounds/macOS-BS2.jpg'
gsettings get org.gnome.desktop.screensaver picture-uri 'file:///usr/share/backgrounds/macOS-BS1.jpg'

curl https://build.opensuse.org/projects/home:manuelschneid3r/public_key |  apt-key add -
echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_20.04/ /' |  tee /etc/apt/sources.list.d/home:manuelschneid3r.list
wget -nv https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_20.04/Release.key -O "/etc/apt/trusted.gpg.d/home:manuelschneid3r.asc"
apt update
apt install albert -y

fwupdmgr get-devices
fwupdmgr get-updates
fwupdmgr update

firefox https://extensions.gnome.org/extension/307/dash-to-dock/

read -p "Reboot? (y/n): " prompt
case "$prompt" in
    y) do sudo reboot now ;;
    n) do echo bye ;;
    *) echo "Enter y or n" ;;
esac



