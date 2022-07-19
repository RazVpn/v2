#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="coding006"
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
# Valid Script
VALIDITY () {
    today=`date -d "0 days" +"%Y-%m-%d"`
    Exp1=$(curl https://raw.githubusercontent.com/RazVpn/ipv2/main/ip.conf | grep $MYIP | awk '{print $4}')
    if [[ $today < $Exp1 ]]; then
    echo -e "\e[32mYOUR SCRIPT ACTIVE..\e[0m"
    else
    echo -e "\e[31mYOUR SCRIPT HAS EXPIRED!\e[0m";
    echo -e "\e[31mPlease renew your ipvps first\e[0m"
    exit 0
fi
}
IZIN=$(curl https://raw.githubusercontent.com/RazVpn/ipv2/main/ip.conf | awk '{print $5}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo -e "\e[32mPermission Accepted...\e[0m"
VALIDITY
else
echo -e "\e[31mPermission Denied!\e[0m";
echo -e "\e[31mPlease buy script first\e[0m"
exit 0
fi
# PROVIDED
creditt=$(cat /root/provided)
# BANNER COLOUR
banner_colour=$(cat /etc/banner)
# TEXT ON BOX COLOUR
box=$(cat /etc/box)
# LINE COLOUR
line=$(cat /etc/line)
# TEXT COLOUR ON TOP
text=$(cat /etc/text)
# TEXT COLOUR BELOW
below=$(cat /etc/below)
# BACKGROUND TEXT COLOUR
back_text=$(cat /etc/back)
# NUMBER COLOUR
number=$(cat /etc/number)
# TOTAL ACC CREATE VMESS WS
total1=$(grep -c -E "^#vms " "/usr/local/etc/xb/akun-xtls.conf")
# TOTAL ACC CREATE  VLESS WS
total2=$(grep -c -E "^#vls " "/usr/local/etc/xb/akun-xtls.conf")
# TOTAL ACC CREATE  VLESS TCP XTLS
total3=$(grep -c -E "^#vxtls " "/usr/local/etc/xb/akun-xtls.conf")
MYIP=$(wget -qO- ifconfig.me/ip);
source /var/lib/premium-script/ip.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /usr/local/etc/xray/domain)
else
domain=$IP
fi
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#vxtls " "/usr/local/etc/xb/akun-xtls.conf")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo ""
	echo " Delete User Xray Vless Tcp Xtls"
	echo " Select the existing client you want to remove"
	echo " Press CTRL+C to return"
	echo " ==============================="
	echo "     No  Expired   User"
	grep -E "^#vxtls " "/usr/local/etc/xb/akun-xtls.conf" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
harini=$(grep -E "^#vxtls " "/usr/local/etc/xb/akun-xtls.conf" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
uuid=$(grep -E "^#vxtls " "/usr/local/etc/xb/akun-xtls.conf" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
user=$(grep -E "^#vxtls " "/usr/local/etc/xb/akun-xtls.conf" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^#vxtls " "/usr/local/etc/xb/akun-xtls.conf" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
sed -i '/#xray-vless-xtls$/a\#vxtls '"$user $exp $harini $uuid"'\
},{"id": "'""$uuid""'","flow": "'""xtls-rprx-direct""'","level": '"0"',"email": "'""$user""'"' /usr/local/etc/xray/config.json
vlesslink1="vless://${uuid}@${sts}${domain}:$xtls?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-direct&sni=$sni#${user}"
vlesslink2="vless://${uuid}@${sts}${domain}:$xtls?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-splice&sni=$sni#${user}"
sed -i "/^#vxtls $user $exp $harini $uuid/,/^},{/d" /usr/local/etc/xb/akun-xtls.conf
systemctl restart xray
clear
echo " User Xray Vless Tcp Xtls"
echo " Successfully unlocked the user"
echo " =========================="
echo " Client Name : $user"
echo " Expired On  : $exp"
echo " =========================="