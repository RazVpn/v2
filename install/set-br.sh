#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="RazVpn"
curl https://rclone.org/install.sh | bash
printf "q\n" | rclone config
wget -O /root/.config/rclone/rclone.conf "https://raw.githubusercontent.com/${GitUser}/v2/main/rclone.conf"
git clone  https://github.com/${GitUser}/wondershaper.git
cd wondershaper
make install
cd
rm -rf wondershaper
echo > /home/limit
apt install msmtp-mta ca-certificates bsd-mailx -y
cat<<EOF>>/etc/msmtprc
defaults
tls on
tls_starttls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt

account default
host smtp.gmail.com
port 587
auth on
user serverbackup2023@gmail.com
from serverbackup2023@gmail.com
password tyagwudsykhkqokt
logfile ~/.msmtp.log
EOF
chown -R www-data:www-data /etc/msmtprc
cd /usr/bin
wget -O autobackup "https://raw.githubusercontent.com/${GitUser}/v2/main/system/autobackup.sh"
wget -O backup "https://raw.githubusercontent.com/${GitUser}/v2/main/system/backup.sh"
wget -O bckp "https://raw.githubusercontent.com/${GitUser}/v2/main/system/bckp.sh"
wget -O restore "https://raw.githubusercontent.com/${GitUser}/v2/main/system/restore.sh"
wget -O strt "https://raw.githubusercontent.com/${GitUser}/v2/main/system/strt.sh"
wget -O limit-speed "https://raw.githubusercontent.com/${GitUser}/v2/main/limit-speed.sh"
chmod +x autobackup
chmod +x backup
chmod +x bckp
chmod +x restore
chmod +x strt
chmod +x limit-speed
chmod +x clear-log
cd
rm -f /root/set-br.sh

