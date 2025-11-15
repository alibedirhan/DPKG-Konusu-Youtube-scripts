#!/bin/bash
clear
PURPLE='\033[0;35m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${PURPLE}╔════════════════════════════════════════╗${NC}"
echo -e "${PURPLE}║${NC}           ${GREEN}TEST TERMİNALİ${NC}            ${PURPLE}║${NC}"
echo -e "${PURPLE}╚════════════════════════════════════════╝${NC}"
echo
echo -e "${YELLOW}💡 Komutları burada test edin:${NC}"
echo
echo -e "${GREEN}📌 Güvenli başlangıç komutları:${NC}"
echo "   dpkg --list | head"
echo "   dpkg --status firefox"
echo "   dpkg --search /bin/ls"
echo "   dpkg --listfiles bash"
echo
echo -e "${CYAN}📊 Bilgi alma komutları:${NC}"
echo "   dpkg-query -l | wc -l"
echo "   dpkg -l 'lib*' | head"
echo
echo -e "${YELLOW}⚠️  Dikkatli kullanın (yeni başlayanlar için):${NC}"
echo "   sudo dpkg -i paket.deb"
echo "   sudo dpkg --remove paket"
echo
echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${CYAN}📋 Kopyalama İpuçları:${NC}"
echo -e "   ${GREEN}•${NC} Komut kopyala: ${YELLOW}SHIFT+Fare${NC} ile seç"
echo -e "   ${GREEN}•${NC} Kopyala: ${YELLOW}Ctrl+Shift+C${NC}"
echo -e "   ${GREEN}•${NC} Yapıştır: ${YELLOW}Ctrl+Shift+V${NC}"
echo -e "   ${GREEN}•${NC} Panel geçiş: ${YELLOW}Fareyle tıkla${NC} (SHIFT olmadan)"
echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo
echo -e "${GREEN}Hazırsınız! Komutlarınızı yazabilirsiniz.${NC}"
echo -e "${CYAN}💡 İpucu: Önce rehberi okuyun, sonra test edin!${NC}"
echo