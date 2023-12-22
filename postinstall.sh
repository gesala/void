#wpa_passphrase ESSID PASSWORD>> /etc/wpa_supplicant/wpa_supplicant-wlp2s0b1.conf 
#cd /var/service/
#ln -s /etc/sv/wpa_supplicant .
#sv status wpa_supplicant
#dhcpcd 
sudo xbps-install xtools void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree
sudo xbps-install broadcom-wl-dkms
xbps-install -Su
xcheckrestart 
xbps-install intel-ucode
xbps-reconfigure --force linux6.5-$(uname -r)
chsh -s /bin/bash root
touch /etc/sv/sshd/down
ln -s /etc/sv/sshd /var/service/
xbps-install socklog-void
ln -s /etc/sv/socklog-unix /var/service/
ln -s /etc/sv/nanoklogd /var/service/
xbps-install cronie
ln -s /etc/sv/crond /var/service
cat >/etc/cron.weekly/fstrim << EOF
#!/bin/bash
fstrim /
EOF
chmod u+x /etc/cron.weekly/fstrim
xbps-install openntpd
ln -s /etc/sv/ntpd /var/service/
#xbps-install tlp
#ln -s /etc/sv/tlp /var/service/
xbps-install thermald
ln -s /etc/sv/thermald /var/service
ln -s /etc/sv/acpid /var/service

git clone https://github.com/AdnanHodzic/auto-cpufreq.git
cd auto-cpufreq && sudo ./auto-cpufreq-installer
cd ..
sudo auto-cpufreq --install


cd $HOME/src
git clone https://github.com/void-linux/void-packages.git
cd void-packages
./xbps-src binary-bootstrap

sudo rm -f /var/service/wpa_supplicant
rm -f /var/service/dhcpcd
ln -s /etc/sv/dbus /var/service
ln -s /etc/sv/NetworkManager /var/service/
#nmcli dev wifi con "ESSID" password PASSWORD  name "XXX"
