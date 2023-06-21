#!/bin/bash
# shellcheck disable=SC2207

red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
plain='\033[0m'

geoip="https://github.com/malikshi/v2ray-rules-dat/releases/latest/download/geoip.dat"
geosite="https://github.com/malikshi/v2ray-rules-dat/releases/latest/download/geosite.dat"
country="https://cdn.jsdelivr.net/gh/Dreamacro/maxmind-geoip@release/Country.mmdb"
ocloc="/etc/openclash/"

file=file.txt
minimumsize=90000
actualsize=$(wc -c <"$file")
if [ $actualsize -ge $minimumsize ]; then
    echo size is over $minimumsize bytes
else
    echo size is under $minimumsize bytes
fi

clear
echo -e "${red}Script Update Geo Data By Malikshi${plain}"
echo -e "${red}----${plain}*${green}----${plain}*${yellow}----${plain}*${red}----${plain}*${green}----${plain}*${yellow}----${plain}*${red}----${plain}"
echo -e ""
echo -e "${green}Memulai Update ${plain}"
echo -e "${yellow}Updating GeoIP ...${plain}"
curl -# ${geoip} -o ${ocloc}GeoIP.dat -s --write-out 'Size File = %{size_download}\n' --output /dev/null
echo -e "${green}Update GeoIP done${plain}"
echo -e ""
echo -e "${yellow}Updating GeoSite ...${plain}"
curl -# ${geosite} -o ${ocloc}GeoSite.dat -s --write-out 'Size File = %{size_download}\n' --output /dev/null
echo -e "${green}Update GeoSite done${plain}"
echo -e ""
echo -e "${yellow}Updating Country ...${plain}"
curl -# ${country} -o ${ocloc}Country.mmdb -s --write-out 'Size File = %{size_download}\n' --output /dev/null
echo -e "${green}Update Country done${plain}"
echo -e ""
echo -e "${red}----${plain}*${green}----${plain}*${yellow}----${plain}*${red}----${plain}*${green}----${plain}*${yellow}----${plain}*${red}----${plain}"
echo -e "${green}Update Geo Data Telah Selesai${plain}"
echo -e "${yellow}Jika Gagal Saat Proses Update Silahkan Coba Kembali${plain}"
echo -e "${red}Recomendasi Matikan Dan Jalankan Kembali OpenClash${plain}"
echo -e "${red}----${plain}*${green}----${plain}*${yellow}----${plain}*${red}----${plain}*${green}----${plain}*${yellow}----${plain}*${red}----${plain}"
