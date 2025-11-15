#!/bin/bash

# DPKG Rehber - Ana Script
# Version: 2.2 - Sorunsuz ve optimize edilmiş!
# Başlangıçta welcome açık!

# Renkler
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
PURPLE='\033[0;35m'
NC='\033[0m'
BOLD='\033[1m'

# Dizinler
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MODULES_DIR="$SCRIPT_DIR/modules"
WELCOME_FILE="$SCRIPT_DIR/welcome.sh"
TEMP_DIR="/tmp/dpkg_rehber_$$"
SESSION_NAME="dpkg_$$"

# Bağımlılık kontrolü
check_dependencies() {
    local missing_deps=()
    
    if ! command -v tmux &> /dev/null; then
        missing_deps+=("tmux")
    fi
    
    if ! command -v less &> /dev/null; then
        missing_deps+=("less")
    fi
    
    if [[ ${#missing_deps[@]} -gt 0 ]]; then
        echo -e "${YELLOW}Eksik: ${missing_deps[*]}${NC}"
        sudo apt update -qq && sudo apt install -y "${missing_deps[@]}"
    fi
}

# Modül kontrolü
check_modules() {
    for i in {1..5}; do
        [[ ! -f "$MODULES_DIR/module_0${i}.sh" ]] && echo "Eksik: module_0${i}.sh" && exit 1
    done
    [[ ! -f "$MODULES_DIR/module_quiz.sh" ]] && echo "Eksik: module_quiz.sh" && exit 1
}

# Menü scriptini oluştur
create_menu_script() {
    cat > "$TEMP_DIR/menu.sh" << 'MENU_EOF'
#!/bin/bash

MODULES_DIR="$1"
TEMP_DIR="$2"

while true; do
    clear
    echo -e "\033[0;35m\033[1m"
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║                     DPKG PAKET YÖNETİCİSİ                    ║"
    echo "║                    İNTERAKTİF REHBERİ                        ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
    echo -e "\033[0m"
    echo
    echo "🟣 MODÜLLER:"
    echo
    echo "  [1]  dpkg Temelleri ve APT ile Farkı"
    echo "  [2]  Temel dpkg Komutları"
    echo "  [3]  Paket Bilgi ve Sorgulama"
    echo "  [4]  Gelişmiş dpkg Kullanımı"
    echo "  [5]  dpkg ile Sorun Giderme"
    echo "  [6]  🎯 BİLGİ YARIŞMASI"
    echo
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo
    echo "  [0]  Çıkış"
    echo
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo
    echo -ne "\033[0;36m\033[1mSeçiminiz (0-6, x=tümünü kapat): \033[0m"
    read -r choice
    
    case "$choice" in
        1|2|3|4|5)
            if [[ -f "$MODULES_DIR/module_0${choice}.sh" ]]; then
                # Ekranı tamamen temizle (menüyü kaldır)
                clear
                printf '\033[H\033[2J\033[3J'
                
                # Modülü yükle ve göster
                source "$MODULES_DIR/module_0${choice}.sh"
                
                # Less ile göster (sadece klavye navigasyonu)
                # -R: Renkleri göster
                # --no-init: Ekranı bozmama
                # -X: Çıkışta ekranı temizleme
                show_module_0${choice} | LESS='-R -X --no-init' less
            fi
            ;;
        6)
            if [[ -f "$MODULES_DIR/module_quiz.sh" ]]; then
                # Ekranı tamamen temizle
                clear
                printf '\033[H\033[2J\033[3J'
                
                # Quiz'i yükle ve DOĞRUDAN çalıştır (less kullanma!)
                source "$MODULES_DIR/module_quiz.sh"
                show_module_quiz
            fi
            ;;
        x|X)
            # Tmux oturumunu tamamen kapat
            if [[ -n "${TMUX:-}" ]]; then
                sess="$(tmux display-message -p '#S' 2>/dev/null || true)"
                [[ -n "$sess" ]] && tmux kill-session -t "$sess" || true
            fi
            exit 0
            ;;

        0|q|Q)
            clear
            echo -e "\033[0;32m\033[1mTeşekkürler! 🎉\033[0m"
            exit 0
            ;;
    esac
done
MENU_EOF
    chmod +x "$TEMP_DIR/menu.sh"
}

# Ana fonksiyon
main() {
    mkdir -p "$TEMP_DIR"
    
    clear
    echo -e "${PURPLE}${BOLD}"
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║                     DPKG PAKET YÖNETİCİSİ                    ║"
    echo "║                    İNTERAKTİF REHBERİ                        ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
    
    echo -e "${CYAN}Kontroller yapılıyor...${NC}"
    check_dependencies
    check_modules
    echo -e "${GREEN}✅ Hazır!${NC}"
    echo
    echo -e "${CYAN}${BOLD}DPKG İnteraktif Rehberine Hoş Geldiniz!${NC}"
    echo
    echo -e "• ${GREEN}Sol Panel${NC}: Rehber menüsü ve içerik"
    echo -e "• ${GREEN}Sağ Panel${NC}: Test terminali"
    echo -e "• ${YELLOW}Panel değiştirme${NC}: Fareyle tıklayın veya Ctrl+B sonra ←→"
    echo
    read -p "Başlamak için Enter..." -r
    
    # Menü scriptini oluştur
    create_menu_script
    
    # Eski oturumu temizle
    tmux kill-session -t "$SESSION_NAME" 2>/dev/null || true
    
    # Yeni tmux oturumu
    tmux new-session -d -s "$SESSION_NAME"
    
    # Mouse
    tmux set-option -t "$SESSION_NAME" mouse on
    
    
    # Dikey split
    tmux split-window -h -t "$SESSION_NAME"
    tmux select-pane -R 2>/dev/null || true
    tmux send-keys "export PAGER=less; export LESS='-RFXS'; echo 'ℹ Uzun listelerden çıkış: q (less)'" C-m
    tmux select-pane -L 2>/dev/null || true
    
    # Sol panel: Menü
    tmux send-keys -t "$SESSION_NAME:0.0" "bash '$TEMP_DIR/menu.sh' '$MODULES_DIR' '$TEMP_DIR'" C-m
    
    # Sağ panel: Welcome
    if [[ -f "$WELCOME_FILE" ]]; then
        tmux send-keys -t "$SESSION_NAME:0.1" "bash '$WELCOME_FILE'; exec bash" C-m
    else
        tmux send-keys -t "$SESSION_NAME:0.1" "clear; echo 'Test terminali'; exec bash" C-m
    fi
    
    # Layout
    tmux select-layout -t "$SESSION_NAME" even-horizontal
    
    # Sol paneli seç
    tmux select-pane -t "$SESSION_NAME:0.0"
    
    # Attach!
    tmux attach -t "$SESSION_NAME"
    
    # Temizlik
    tmux kill-session -t "$SESSION_NAME" 2>/dev/null || true
    rm -rf "$TEMP_DIR"
}

# Trap
trap 'rm -rf "$TEMP_DIR" 2>/dev/null; tmux kill-session -t "$SESSION_NAME" 2>/dev/null' EXIT

main "$@"