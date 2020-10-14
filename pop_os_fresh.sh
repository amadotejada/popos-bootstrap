
#screen settings
gsettings set com.system76.hidpi enable false
xrandr --output eDP-1 --mode 1920x1080
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
killall -3 gnome-shell

#apt/flatpak updates
sudo apt update -y &&  sudo apt full-upgrade -y
sudo flatpak update
sudo pop-upgrade release update
sudo pop-upgrade release upgrade

#dependency
sudo apt install -y gnome-tweaks git caffeine

#github files
git clone https://github.com/amadotejada/popos-bootstrap.git ~/macos
mkdir ~/.themes
mkdir ~/.icons
cp -rf ~/macos/themes/* ~/.themes
cp -rf ~/macos/icons/* ~/.icons
cp -rf ~/macos/wallpapers/* /usr/share/backgrounds/

#set theme
gsettings set org.gnome.desktop.interface cursor-size 48
gsettings set org.gnome.desktop.interface text-scaling-factor 1.2
gsettings set org.gnome.desktop.background picture-uri 'file:///usr/share/backgrounds/tony-webster-97532.jpg'
gsettings set org.gnome.mutter center-new-windows 'true'
gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:'
gsettings set org.gnome.desktop.interface gtk-theme "WhiteSur-dark"
gsettings set org.gnome.desktop.wm.preferences theme "WhiteSur-dark"
gsettings set org.gnome.desktop.interface cursor-theme 'capitaine-cursors-light'

# gsettings --schemadir ~/.local/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com/schemas/ set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
# gsettings set org.gnome.desktop.interface icon-theme 'BigSur'
# gsettings get org.gnome.desktop.screensaver picture-uri 'file:///usr/share/backgrounds/macOS-BS1.jpg'

wget https://go.microsoft.com/fwlink/?LinkID=760868 -O ~/vscode-latest.deb
sudo apt install -y ./vscode-latest.deb

wget https://github.com/Automattic/simplenote-electron/releases/download/v1.21.1/Simplenote-linux-1.21.1-amd64.deb -O ~/simplenote.deb
sudo apt install -y ./simplenote.deb

wget https://addons.mozilla.org/firefox/downloads/latest/chrome-gnome-shell@gnome.org -O ~/chrome-gnome-shell.xpi
firefox ~/chrome-gnome-shell.xpi

firefox https://extensions.gnome.org/extension/307/dash-to-dock/

gsettings --schemadir ~/.local/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com/schemas/ set org.gnome.shell.extensions.dash-to-dock animate-show-apps false
gsettings --schemadir ~/.local/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com/schemas/ set org.gnome.shell.extensions.dash-to-dock custom-theme-shrink true

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



echo "Done - Reboot"
