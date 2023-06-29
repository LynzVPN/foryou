#!/bin/bash
MYIP=$(curl -sS ifconfig.me)
echo "Checking VPS"
clear
BURIQ () {
    curl -sS https://raw.githubusercontent.com/LynzVPN/permission/main/ipmini > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/LynzVPN/permission/main/ipmini | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/LynzVPN/permission/main/ipmini | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}
red='\e[1;31m'
green='\e[1;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION

if [ "$res" = "Expired" ]; then
Exp="\e[36mExpired\033[0m"
else
Exp=$(curl -sS https://raw.githubusercontent.com/LynzVPN/permission/main/ipmini | grep $MYIP | awk '{print $3}')
fi
# Color Validation
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[32m'
blue='\e[34m'
PURPLE='\e[35m'
cyan='\e[36m'
Lred='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
BGreen='\e[1;32m'
BYellow='\e[1;33m'
BBlue='\e[1;34m'
BPurple='\e[1;35m'
BCyan='\e[1;36m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
# VPS Information
#Domain
domain=$(cat /etc/xray/domain)
#Status certificate
modifyTime=$(stat $HOME/.acme.sh/${domain}_ecc/${domain}.key | sed -n '7,6p' | awk '{print $2" "$3" "$4" "$5}')
modifyTime1=$(date +%s -d "${modifyTime}")
currentTime=$(date +%s)
stampDiff=$(expr ${currentTime} - ${modifyTime1})
days=$(expr ${stampDiff} / 86400)
remainingDays=$(expr 90 - ${days})
tlsStatus=${remainingDays}
if [[ ${remainingDays} -le 0 ]]; then
	tlsStatus="expired"
fi
# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"
# Download
#Download/Upload today
dtoday="$(vnstat -i eth0 | grep "today" | awk '{print $2" "substr ($3, 1, 1)}')"
utoday="$(vnstat -i eth0 | grep "today" | awk '{print $5" "substr ($6, 1, 1)}')"
ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload yesterday
dyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $2" "substr ($3, 1, 1)}')"
uyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $5" "substr ($6, 1, 1)}')"
tyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload current month
dmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $3" "substr ($4, 1, 1)}')"
umon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $6" "substr ($7, 1, 1)}')"
tmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $9" "substr ($10, 1, 1)}')"
# user
Exp2=$"$exp2"
Name=$"$user"
# Getting CPU Information
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"
#ISP=$(curl -s ipinfo.io/org?token=ce3da57536810d | cut -d " " -f 2-10 )
#CITY=$(curl -s ipinfo.io/city?token=ce3da57536810d )
#WKT=$(curl -s ipinfo.io/timezone?token=ce3da57536810d )
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
DATE2=$(date -R | cut -d " " -f -5)
IPVPS=$(curl -s ifconfig.me )
LOC=$(curl -s ifconfig.co/country )
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
fram=$( free -m | awk 'NR==2 {print $4}' )
clear 
echo -e "\e[0;36m╒════════════════════════════════════════════════╕\033[0m"
echo -e " \E[44;1;39m                Server Information              \E[0m"
echo -e "\e[0;36m╘════════════════════════════════════════════════╛\033[0m"
echo -e "\e[0m OS            \e[0m: "`hostnamectl | grep "Operating System" | cut -d ' ' -f5-`	
echo -e "\e[0m Uptime        \e[0m: $uptime"
echo -e "\e[0m Public IP     \e[0m: $IPVPS"
echo -e "\e[0m Country       \e[0m: $LOC"
#echo -e "\e[1;32m ASN           \e[0m: $ISP"
#echo -e "\e[1;32m CITY          \e[0m: $CITY"
echo -e "\e[0m DOMAIN        \e[0m: $domain"	
echo -e "\e[0m DATE & TIME   \e[0m: $DATE2"
echo -e "\e[0m RAM USED   \e[0m   : $uram MB"	
echo -e "\e[0m RAM TOTAL  \e[0m   : $tram MB"
echo -e "\e[0;36m╒════════════════════════════════════════════════╕\033[0m"
echo -e "\e[0m\033[0m ${BOLD}\e[0;36mXXX\e[0m SSH \e[0;36m XXX \e[0mVMESS  \e[0;36mXXX  \e[0mVLESS  \e[0;36mXXX  \e[0mTROJAN\e[0;36m XXX $NC "
echo -e "  ${BIBlue}   \033[0m \e[0m     $ssh1         $vma           $vla           $tra              \e[0m"
echo -e "\e[0;36m╘════════════════════════════════════════════════╛\033[0m"
echo -e "\e[0;36m╒════════════════════════════════════════════════╕\033[0m"
echo -e " \E[44;1;39m                     Menu                       \E[0m"
echo -e "\e[0;36m╘════════════════════════════════════════════════╛\033[0m"
echo -e "\e[0;36m〔 1 〕\e[0mMenu SSH"
echo -e "\e[0;36m〔 2 〕\e[0mMenu Vmess"
echo -e "\e[0;36m〔 3 〕\e[0mMenu Vless"
echo -e "\e[0;36m〔 4 〕\e[0mMenu Trojan"
echo -e "\e[0;36m〔 5 〕\e[0mMenu Shadowsocks"
echo -e "\e[0;36m〔 6 〕\e[0mMenu Setting"
echo -e "\e[0;36m〔 7 〕\e[0mStatus Service"
echo -e "\e[0;36m〔 8 〕\e[0mClear RAM Cache"
echo -e "\e[0;36m〔 9 〕\e[0mReboot VPS"
echo -e   ""
echo -e "\e[0;36m〔 x 〕\e[0mExit Script"
echo -e "\e[0;36m╒════════════════════════════════════════════════╕\033[0m"
echo -e "  \e[0;36mVersion       \e[0m:  V.3 Tunnel"
echo -e "  \e[0;36mUser       \e[0m   :\033[1;36m $Name \e[0m"
echo -e "  \e[0;36mExpiry script\e[0m : ${NC}$Exp${NC} "
echo -e "\e[0;36m╘════════════════════════════════════════════════╛\033[0m"
echo -e   ""
read -p " Select menu :  "  opt
echo -e   ""
case $opt in
1) clear ; m-sshovpn ;;
2) clear ; m-vmess ;;
3) clear ; m-vless ;;
4) clear ; m-trojan ;;
5) clear ; m-ssws ;;
6) clear ; m-system ;;
7) clear ; running ;;
8) clear ; clearcache ;;
9) clear ; reboot ;;
x) exit ;;
*) echo "Anda salah tekan " ; sleep 1 ; menu ;;
esac
