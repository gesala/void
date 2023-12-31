# Instalacion baseX y pipewire
sudo xbps-install -Su
sudo xbps-install xorg-minimal xf86-video-intel intel-video-accel xorg-fonts xinit pipewire xdg-user-dirs xdg-utils elogind wireplumber-elogind xf86-input-synaptics xf86-input-mtrack xrandr rtkit pulsemixer
sudo ln -s /etc/sv/elogind /var/service/
sudo ln -s /etc/sv/rtkit /var/service
#Instalacion dwm

sudo xbps-install git feh tmux neovim neofetch gcc dunst libX11-devel libXft-devel libXinerama-devel pkg-config setxkbmap firefox bash-completion font-awesome lsd nerd-fonts picom  noto-fonts-ttf noto-fonts-ttf-extra noto-fonts-emoji ranger scrot nsxiv libXrandr-devel mlocate network-manager-applet pa-applet keepassxc spotify-tui bat spotifyd xbacklight
sudo sh -c 'echo "modprobe -r usbmouse"|tee -a /etc/rc.local'
sudo sh -c 'echo "modprobe -r bcm5974"|tee -a /etc/rc.local'
sudo sh -c 'echo "modprobe bcm5974"|tee -a /etc/rc.local'



curl -sS https://starship.rs/install.sh | sh
mkdir -p ~/.config && touch ~/.config/starship.toml
starship preset pastel-powerline -o ~/.config/starship.toml



echo  'eval "$(starship init bash)"' >> $HOME/.bashrc
