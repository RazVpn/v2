#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="RazVpn"
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
echo -e "\e[32mloading...\e[0m"
clear
# Valid Script
VALIDITY () {
    today=`date -d "0 days" +"%Y-%m-%d"`
    Exp1=$(curl https://raw.githubusercontent.com/${GitUser}/ipv2/main/ip.conf | grep $MYIP | awk '{print $4}')
    if [[ $today < $Exp1 ]]; then
    echo -e "\e[32mYOUR SCRIPT ACTIVE..\e[0m"
    else
    echo -e "\e[31mYOUR SCRIPT HAS EXPIRED!\e[0m";
    echo -e "\e[31mPlease renew your ipvps first\e[0m"
    exit 0
fi
}
IZIN=$(curl https://raw.githubusercontent.com/${GitUser}/ipv2/main/ip.conf | awk '{print $5}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo -e "\e[32mPermission Accepted...\e[0m"
VALIDITY
else
echo -e "\e[31mPermission Denied!\e[0m";
echo -e "\e[31mPlease buy script first\e[0m"
exit 0
fi
echo -e "\e[32mloading...\e[0m"
clear
trgows="$(cat ~/log-install.txt | grep -w "Trojan Go" | cut -d: -f2|sed 's/ //g')"
echo -e "\e[0;34m.-----------------------------------------.\e[0m"
echo -e "\e[0;34m|          \e[1;33mCHANGE PORT ALL TROJAN\e[m         \e[0;34m|\e[0m"
echo -e "\e[0;34m'-----------------------------------------'\e[0m"
echo -e " \e[1;31m>>\e[0m\e[0;32mChange Port For Trojan:\e[0m"
echo -e "  [1]  Change Port Trojan GO $trgows"
echo -e "========================================"
echo -e "  [x]  Back To Menu Change Port"
echo -e "  [y]  Go To Main Menu"
echo -e ""
read -p "   Select From Options [1 or x & y] :  " prot
echo -e ""
case $prot in
1)
read -p "New Port Trojan GO : " tr2
if [ -z $tr2 ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $tr2)
if [[ -z $cek ]]; then
sed -i "s/$trgows/$tr2/g" /etc/trojan-go/config.json
sed -i "s/   - Trojan Go               : $trgows/   - Trojan Go               : $tr2/g" /root/log-install.txt
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $trgows -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $trgows-j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $tr2 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $tr2 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart trojan-go > /dev/null
echo -e "\e[032;1mPort $tr2 modified successfully\e[0m"
else
echo -e "\e[1;31mPort $tr2 is used\e[0m"
fi
;;
x)
clear
change-port
;;
y)
clear
menu
;;
*)
echo "Please enter an correct number"
;;
esac