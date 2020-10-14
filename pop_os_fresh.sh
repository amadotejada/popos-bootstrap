
sudo apt update -y &&  sudo apt full-upgrade -y &&  sudo apt autoremove -y &&  sudo apt clean -y &&  sudo apt autoclean -y
sudo flatpak update
sudo pop-upgrade release update
sudo pop-upgrade release upgrade

#dependency
sudo apt install -y gnome-tweaks git caffeine

git clone https://github.com/amadotejada/popos-bootstrap.git ~/macos
mkdir ~/.themes
mkdir ~/.icons
cp -rf ~/macos/themes/* ~/.themes
cp -rf ~/macos/icons/* ~/.icons
cp -rf ~/macos/wallpapers/* /usr/share/backgrounds/

gsettings set org.gnome.mutter center-new-windows 'true'
gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:'
gsettings set org.gnome.desktop.interface gtk-theme "WhiteSur-dark"
gsettings set org.gnome.desktop.wm.preferences theme "WhiteSur-dark"
gsettings set org.gnome.desktop.interface cursor-theme 'capitaine-cursors-light'
# gsettings set org.gnome.desktop.interface icon-theme 'BigSur'
# gsettings set org.gnome.desktop.background picture-uri 'file:///usr/share/backgrounds/macOS-BS2.jpg'
# gsettings get org.gnome.desktop.screensaver picture-uri 'file:///usr/share/backgrounds/macOS-BS1.jpg'

wget https://go.microsoft.com/fwlink/?LinkID=760868 -O ~/vscode-latest.deb
sudo apt install -y ./vscode-latest.deb

wget https://github.com/Automattic/simplenote-electron/releases/download/v1.21.1/Simplenote-linux-1.21.1-amd64.deb -O ~/simplenote.deb
sudo apt install -y ./simplenote.deb

wget https://addons.mozilla.org/firefox/downloads/latest/chrome-gnome-shell@gnome.org -O ~/chrome-gnome-shell.xpi
firefox ~/chrome-gnome-shell.xpi

sudo flatpak -y install mattermost telegram slack discord app/org.gimp.GIMP/x86_64/stable app/org.videolan.VLC/x86_64/stable us.zoom.Zoom
#vscode com.visualstudio.code

# curl https://build.opensuse.org/projects/home:manuelschneid3r/public_key |  apt-key add -
# echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_20.04/ /' |  tee /etc/apt/sources.list.d/home:manuelschneid3r.list
# wget -nv https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_20.04/Release.key -O "/etc/apt/trusted.gpg.d/home:manuelschneid3r.asc"
# sudo apt update
# sudo apt install albert -y

fwupdmgr get-devices
fwupdmgr get-updates
fwupdmgr update

firefox https://extensions.gnome.org/extension/307/dash-to-dock/

echo "\nDone - Reboot"
