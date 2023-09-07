wpa_passphrase ESSID PASSWORD>> /etc/wpa_supplicant/wpa_supplicant-wlp2s0b1.conf 
cd /var/service/
ln -s /etc/sv/wpa_supplicant .
sv status wpa_supplicant
dhcpcd 
xbps-install -Su
xbps-install xtools void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree
xbps-install broadcom-wl-dkms
xcheckrestart 
xbps-install -Su
xbps-install intel-ucode
xbps-reconfigure --force linux$(uname -r)
chsh -s /bin/bash root
touch /etc/sv/sshd/down
ln -s /et/sv/sshd /var/service/
xbps-install socklog-void
ln -s /etc/sv/socklog-unix /var/services/
ln -s /etc/sv/nanoklogd /var/services/
xbps-install cronie
ln -s /etc/sv/crond /var/service
cat >/etc/cron.weekly/fstrim << EOF
#!/bin/bash
fstrim /
EOF
chmod u+x /etc/cron.weekly/fstrim
xbps-install openntpd
ln -s /etc/sv/ntpd /var/service/
xbps-install tlp
ln -s /etc/sv/tlp /var/services/
xbps-install NetworkManager python3-dbus
rm -f /var/service/wpa_supplicant
ln -s /etc/sv/dbus /var/service
ln -s /etc/sv/NetworkManager /var/service/
nmcli dev wifi con "ESSID" password PASSWORD  name "XXX"
