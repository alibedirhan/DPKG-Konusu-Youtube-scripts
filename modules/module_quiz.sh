#!/bin/bash

show_module_quiz() {
    # Less içinde bile çalışması için TTY kontrolü
    exec < /dev/tty
    exec > /dev/tty 2>&1
    
    # Ekranı tamamen temizle ve menüyü kaldır
    clear
    printf '\033[H\033[2J\033[3J'
    
    echo "╔══════════════════════════════════════════════════════════════════════════════╗"
    echo "║                        DPKG PAKETLERİ BİLGİ YARIŞMASI                       ║"
    echo "╚══════════════════════════════════════════════════════════════════════════════╝"
    echo
    echo "🎯 15 soruluk interaktif test başlıyor!"
    echo "   Her doğru cevap 1 puan değerindedir."
    echo
    echo "Teste başlamak için Enter tuşuna basın..."
    read -r
    start_quiz
}

start_quiz() {
    QUIZ_SCORE=0
    QUIZ_TOTAL=15
    CURRENT_QUESTION=0
    QUIZ_WRONG=0
    
    # Yanlış soruları kaydet
    declare -g -a WRONG_QUESTIONS=()
    declare -g -a WRONG_USER_ANSWERS=()
    declare -g -a WRONG_CORRECT_ANSWERS=()
    declare -g -a WRONG_EXPLANATIONS=()
    
    clear
    echo "🎯 DPKG BİLGİ YARIŞMASI BAŞLIYOR!"
    echo "═══════════════════════════════════════════"
    echo
    sleep 1
    
    quiz_questions
    show_quiz_results
}

quiz_questions() {
    # Soru 1: dpkg temel komut
    ((CURRENT_QUESTION++))
    ask_question \
        "Soru $CURRENT_QUESTION: .deb paketi kurmak için hangi komut kullanılır?" \
        "a) dpkg -install paket.deb" \
        "b) dpkg -i paket.deb" \
        "c) dpkg -add paket.deb" \
        "d) dpkg -k paket.deb" \
        "b"

    # Soru 2: remove vs purge
    ((CURRENT_QUESTION++))
    ask_question \
        "Soru $CURRENT_QUESTION: Programı kaldırırken ayar dosyalarını da silmek için hangi seçenek kullanılır?" \
        "a) dpkg -r PAKET" \
        "b) dpkg --remove PAKET" \
        "c) dpkg -P PAKET" \
        "d) dpkg --delete PAKET" \
        "c"

    # Soru 3: dpkg vs APT
    ((CURRENT_QUESTION++))
    ask_question \
        "Soru $CURRENT_QUESTION: dpkg ve APT arasındaki temel fark nedir?" \
        "a) APT sadece Ubuntu'da çalışır" \
        "b) dpkg bağımlılıkları otomatik çözmez, APT çözer" \
        "c) dpkg daha hızlıdır" \
        "d) APT eski bir araçtır" \
        "b"

    # Soru 4: Durum kodları
    ((CURRENT_QUESTION++))
    ask_question \
        "Soru $CURRENT_QUESTION: dpkg --list çıktısında 'ii' durum kodu ne anlama gelir?" \
        "a) Install Incomplete (Kurulum yarım)" \
        "b) Install in Progress (Kurulum devam ediyor)" \
        "c) Installed OK (Başarıyla kuruldu)" \
        "d) Install Interrupted (Kurulum kesildi)" \
        "c"

    # Soru 5: True/False - dpkg açılımı
    ((CURRENT_QUESTION++))
    ask_true_false \
        "Soru $CURRENT_QUESTION: dpkg'nin açılımı 'Dynamic Package' midir?" \
        "false"

    # Soru 6: Paket listele
    ((CURRENT_QUESTION++))
    ask_question \
        "Soru $CURRENT_QUESTION: Sistemdeki tüm paketleri listelemek için hangi komut kullanılır?" \
        "a) dpkg --show" \
        "b) dpkg --all" \
        "c) dpkg -l" \
        "d) dpkg --installed" \
        "c"

    # Soru 7: Dosya sorgulama
    ((CURRENT_QUESTION++))
    ask_question \
        "Soru $CURRENT_QUESTION: Bir dosyanın hangi pakete ait olduğunu öğrenmek için hangi komut kullanılır?" \
        "a) dpkg -L DOSYA" \
        "b) dpkg -S DOSYA" \
        "c) dpkg --find DOSYA" \
        "d) dpkg -F DOSYA" \
        "b"

    # Soru 8: Paket durumu
    ((CURRENT_QUESTION++))
    ask_question \
        "Soru $CURRENT_QUESTION: Bir paketin detaylı bilgisini (status) görmek için hangi komut kullanılır?" \
        "a) dpkg -i PAKET" \
        "b) dpkg -s PAKET" \
        "c) dpkg -l PAKET" \
        "d) dpkg -S PAKET" \
        "b"

    # Soru 9: True/False - dpkg veritabanı
    ((CURRENT_QUESTION++))
    ask_true_false \
        "Soru $CURRENT_QUESTION: dpkg veritabanı /var/lib/dpkg/ dizininde saklanır." \
        "true"

    # Soru 10: Bağımlılık hatası çözümü
    ((CURRENT_QUESTION++))
    ask_question \
        "Soru $CURRENT_QUESTION: dpkg bağımlılık hatası verince ilk yapılması gereken nedir?" \
        "a) Paketi zorla kur: dpkg --force-all" \
        "b) Eksik bağımlılıkları çöz: sudo apt install -f" \
        "c) dpkg'yi yeniden başlat" \
        "d) Paketi sil ve tekrar dene" \
        "b"

    # Soru 11: Paket dosyalarını görme
    ((CURRENT_QUESTION++))
    ask_question \
        "Soru $CURRENT_QUESTION: Bir paketin kurduğu dosyaları listelemek için hangi komut kullanılır?" \
        "a) dpkg -f PAKET" \
        "b) dpkg -c PAKET" \
        "c) dpkg -L PAKET" \
        "d) dpkg --files PAKET" \
        "c"

    # Soru 12: True/False - rc durum kodu
    ((CURRENT_QUESTION++))
    ask_true_false \
        "Soru $CURRENT_QUESTION: 'rc' durum kodu, paketin kaldırıldığını ama config dosyalarının kaldığını gösterir." \
        "true"

    # Soru 13: Yarım kalmış kurulum
    ((CURRENT_QUESTION++))
    ask_question \
        "Soru $CURRENT_QUESTION: Yarım kalmış paket kurulumlarını tamamlamak için hangi komut kullanılır?" \
        "a) dpkg --fix" \
        "b) dpkg --complete" \
        "c) dpkg --configure -a" \
        "d) dpkg --finish" \
        "c"

    # Soru 14: .deb içeriğini görme
    ((CURRENT_QUESTION++))
    ask_question \
        "Soru $CURRENT_QUESTION: Bir .deb dosyasının içeriğini KURMADAN görmek için hangi komut kullanılır?" \
        "a) dpkg -L paket.deb" \
        "b) dpkg --contents paket.deb" \
        "c) dpkg -i --test paket.deb" \
        "d) dpkg --show paket.deb" \
        "b"

    # Soru 15: dpkg lock hatası
    ((CURRENT_QUESTION++))
    ask_question \
        "Soru $CURRENT_QUESTION: dpkg lock hatası aldığınızda İLK yapmanız gereken nedir?" \
        "a) Lock dosyalarını hemen silin" \
        "b) Bilgisayarı yeniden başlatın" \
        "c) Çalışan apt/dpkg işlemlerini kontrol edin" \
        "d) dpkg'yi yeniden kurun" \
        "c"
}

ask_question() {
    local question="$1"
    local option_a="$2"
    local option_b="$3"
    local option_c="$4"
    local option_d="$5"
    local correct="$6"
    
    clear
    show_progress_bar
    
    echo
    echo "$question"
    echo
    echo "$option_a"
    echo "$option_b"
    echo "$option_c"
    echo "$option_d"
    echo
    echo -n "Cevabınız (a/b/c/d): "
    
    read -r answer
    answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]')
    
    echo
    if [[ "$answer" == "$correct" ]]; then
        echo "✅ DOĞRU!"
        ((QUIZ_SCORE++))
        sleep 0.5
    else
        echo "❌ YANLIŞ! Doğru cevap: $correct"
        ((QUIZ_WRONG++))
        
        # Yanlış soruyu kaydet
        WRONG_QUESTIONS+=("$question")
        
        # Kullanıcının cevabını bul
        local user_answer_text=""
        case "$answer" in
            a) user_answer_text="$option_a" ;;
            b) user_answer_text="$option_b" ;;
            c) user_answer_text="$option_c" ;;
            d) user_answer_text="$option_d" ;;
            *) user_answer_text="Geçersiz cevap" ;;
        esac
        WRONG_USER_ANSWERS+=("$user_answer_text")
        
        # Doğru cevabı bul
        local correct_answer_text=""
        case "$correct" in
            a) correct_answer_text="$option_a" ;;
            b) correct_answer_text="$option_b" ;;
            c) correct_answer_text="$option_c" ;;
            d) correct_answer_text="$option_d" ;;
        esac
        WRONG_CORRECT_ANSWERS+=("$correct_answer_text")
        
        # Açıklama
        local explanation=$(get_explanation "$CURRENT_QUESTION")
        WRONG_EXPLANATIONS+=("$explanation")
        
        sleep 1
    fi
}

ask_true_false() {
    local question="$1"
    local correct="$2"
    
    clear
    show_progress_bar
    
    echo
    echo "$question"
    echo
    echo "a) Doğru"
    echo "b) Yanlış"
    echo
    echo -n "Cevabınız (a=doğru, b=yanlış): "
    
    read -r answer
    answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]')
    
    local user_answer=""
    if [[ "$answer" == "a" ]]; then
        user_answer="true"
    else
        user_answer="false"
    fi
    
    echo
    if [[ "$user_answer" == "$correct" ]]; then
        echo "✅ DOĞRU!"
        ((QUIZ_SCORE++))
        sleep 0.5
    else
        echo "❌ YANLIŞ! Doğru cevap: $correct"
        ((QUIZ_WRONG++))
        
        # Yanlış soruyu kaydet
        WRONG_QUESTIONS+=("$question")
        
        # Kullanıcının cevabı
        local user_text=""
        if [[ "$answer" == "a" ]]; then
            user_text="a) Doğru"
        else
            user_text="b) Yanlış"
        fi
        WRONG_USER_ANSWERS+=("$user_text")
        
        # Doğru cevap
        local correct_text=""
        if [[ "$correct" == "true" ]]; then
            correct_text="a) Doğru"
        else
            correct_text="b) Yanlış"
        fi
        WRONG_CORRECT_ANSWERS+=("$correct_text")
        
        # Açıklama
        local explanation=$(get_explanation "$CURRENT_QUESTION")
        WRONG_EXPLANATIONS+=("$explanation")
        
        sleep 1
    fi
}

show_progress_bar() {
    if [[ "$QUIZ_TOTAL" -eq 0 ]]; then
        QUIZ_TOTAL=15
    fi
    
    local percentage=$((CURRENT_QUESTION * 100 / QUIZ_TOTAL))
    local filled=$((CURRENT_QUESTION * 50 / QUIZ_TOTAL))
    local empty=$((50 - filled))
    
    if [[ $empty -lt 0 ]]; then
        empty=0
    fi
    
    echo "╔════════════════════════════════════════════════════════════════════════════════╗"
    echo "║                           DPKG BİLGİ YARIŞMASI                                ║"
    echo "╠════════════════════════════════════════════════════════════════════════════════╣"
    printf "║ Soru: %d/%d                        İlerleme: %%%d              ║\n" "$CURRENT_QUESTION" "$QUIZ_TOTAL" "$percentage"
    printf "║ ["
    
    for ((i=0; i<filled; i++)); do
        printf "#"
    done
    for ((i=0; i<empty; i++)); do
        printf "-"
    done
    
    printf "]           ║\n"
    
    if (( CURRENT_QUESTION > 1 && CURRENT_QUESTION <= QUIZ_TOTAL )); then
        local prev_question=$((CURRENT_QUESTION - 1))
        local success_rate=0
        if [[ "$prev_question" -gt 0 ]]; then
            success_rate=$((QUIZ_SCORE * 100 / prev_question))
        fi
        echo "║                                                                                ║"
        echo "║ 📊 Şu ana kadarki performans:                                                  ║"
        printf "║    ✅ Doğru: %-6d ❌ Yanlış: %-6d                                   ║\n" "$QUIZ_SCORE" "$QUIZ_WRONG"
        printf "║    📈 Başarı oranı: %%%d                                                       ║\n" "$success_rate"
    elif (( CURRENT_QUESTION == QUIZ_TOTAL )); then
        echo "║                                                                                ║"
        echo "║ 🏁 SON SORU! Testi neredeyse tamamladınız...                                   ║"
    fi
    echo "╚════════════════════════════════════════════════════════════════════════════════╝"
}

show_current_score() {
    local success_rate=0
    if [[ "$CURRENT_QUESTION" -gt 0 ]]; then
        success_rate=$((QUIZ_SCORE * 100 / CURRENT_QUESTION))
    fi
    
    echo
    echo "┌─────────────────────────────────────┐"
    echo "│           GÜNCEL DURUM              │"
    echo "├─────────────────────────────────────┤"
    printf "│ ✅ Doğru cevaplar: %-6d         │\n" "$QUIZ_SCORE"
    printf "│ ❌ Yanlış cevaplar: %-6d        │\n" "$QUIZ_WRONG"
    printf "│ 📝 Toplam yanıtlanan: %-6d      │\n" "$CURRENT_QUESTION"
    printf "│ 📊 Başarı oranı: %%%d              │\n" "$success_rate"
    echo "└─────────────────────────────────────┘"
}

get_explanation() {
    local question_num="$1"
    local explanation=""
    
    case $question_num in
        1)
            explanation="dpkg -i (veya --install) .deb paket kurulumunda kullanılır. Örnek: sudo dpkg -i google-chrome.deb"
            ;;
        2)
            explanation="-P (veya --purge) hem programı hem ayar dosyalarını siler. -r (--remove) sadece programı siler, ayarları korur."
            ;;
        3)
            explanation="dpkg düşük seviye araçtır, bağımlılıkları çözmez. APT ise dpkg'yi kullanarak bağımlılıkları otomatik yönetir."
            ;;
        4)
            explanation="'ii' = İlk i: install (istenen), İkinci i: installed (mevcut durum). Yani paket başarıyla kurulu ve sorunsuz çalışıyor."
            ;;
        5)
            explanation="dpkg = 'Debian Package' (Debian Paketi). Dynamic Package değil!"
            ;;
        6)
            explanation="dpkg -l (veya --list) tüm paketleri durum kodlarıyla listeler. Filtreleme: dpkg -l | grep '^ii'"
            ;;
        7)
            explanation="dpkg -S (veya --search) dosya yolundan paketi bulur. Örnek: dpkg -S /bin/bash → bash: /bin/bash"
            ;;
        8)
            explanation="dpkg -s (veya --status) paketin detaylı durumunu gösterir. Versiyon, bağımlılıklar, kurulu boyut, açıklama vb."
            ;;
        9)
            explanation="/var/lib/dpkg/ dizini dpkg'nin veritabanını içerir. status dosyası kurulu paketlerin durumunu tutar. (ASLA elle düzenleme!)"
            ;;
        10)
            explanation="apt install -f (fix-broken) eksik bağımlılıkları otomatik bulup kurar. --force-all tehlikelidir!"
            ;;
        11)
            explanation="dpkg -L (veya --listfiles) paketin kurduğu tüm dosyaları listeler. Örnek: dpkg -L bash"
            ;;
        12)
            explanation="'rc' = remove edildi (r) ama config files var (c). Tamamen temizlemek için: sudo dpkg -P PAKET"
            ;;
        13)
            explanation="dpkg --configure -a tüm yarım yapılandırılmış paketleri düzeltir. Kurulum kesintilerinden sonra çok kullanışlı!"
            ;;
        14)
            explanation="dpkg --contents (veya -c) .deb içeriğini kurmadan gösterir. Paketi kurmadan önce ne içerdiğini görmek için kullanışlı!"
            ;;
        15)
            explanation="Lock hatası genellikle başka bir işlem çalışıyor demektir. Önce ps aux | grep apt ile kontrol edin. İşlem bitene BEKLEYİN!"
            ;;
        *)
            explanation="Açıklama mevcut değil."
            ;;
    esac
    
    echo "$explanation"
}

show_quiz_results() {
    clear
    echo "╔══════════════════════════════════════════════════════════════════════════════╗"
    echo "║                        🎉 TEST TAMAMLANDI! 🎉                                ║"
    echo "╚══════════════════════════════════════════════════════════════════════════════╝"
    echo
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "📊 SONUÇLARINIZ:"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo
    printf "   ✅ Doğru cevap sayısı: %d\n" "$QUIZ_SCORE"
    printf "   ❌ Yanlış cevap sayısı: %d\n" "$QUIZ_WRONG"
    printf "   📝 Toplam soru sayısı: %d\n" "$QUIZ_TOTAL"
    
    local final_percentage=0
    if [[ "$QUIZ_TOTAL" -gt 0 ]]; then
        final_percentage=$((QUIZ_SCORE * 100 / QUIZ_TOTAL))
    fi
    printf "   📈 Başarı oranı: %%%-3d\n" "$final_percentage"
    echo
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    
    if (( QUIZ_SCORE >= 13 )); then
        echo
        cat << 'EXPERT_BADGE'
    ⭐⭐⭐ DPKG UZMANI ⭐⭐⭐
   ╭─────────────────────────────────╮
   │                                 │
   │    🏆 MÜKEMMEL PERFORMANS! 🏆    │
   │                                 │
   │  dpkg paket yönetiminde uzman   │
   │     seviyesindesiniz!           │
   │                                 │
   │      Sizi tebrik ederiz!        │
   │                                 │
   ╰─────────────────────────────────╯
EXPERT_BADGE
        echo
        echo "🌟 TEBRİKLER! dpkg konusunda gerçek bir uzman olduğunuzu kanıtladınız!"
        
    elif (( QUIZ_SCORE >= 10 )); then
        echo
        echo "🚀 İLERİ SEVİYE! Çok iyi bir performans!"
        echo
        echo "   ┌──────────────────────────────────┐"
        echo "   │  dpkg konusunda ileri seviye     │"
        echo "   │  bilgiye sahipsiniz. Az bir      │"
        echo "   │  pratikle uzman olabilirsiniz!   │"
        echo "   └──────────────────────────────────┘"
        
    elif (( QUIZ_SCORE >= 7 )); then
        echo
        echo "📈 ORTA SEVİYE! İyi iş çıkardınız!"
        echo
        echo "   ┌──────────────────────────────────┐"
        echo "   │  İyi bir temel bilginiz var.     │"
        echo "   │  Biraz daha pratik yaparak       │"
        echo "   │  kendinizi geliştirebilirsiniz.  │"
        echo "   └──────────────────────────────────┘"
        
    elif (( QUIZ_SCORE >= 4 )); then
        echo
        echo "📖 TEMEL SEVİYE"
        echo
        echo "   ┌──────────────────────────────────┐"
        echo "   │  Temel bilgileriniz var ama      │"
        echo "   │  modülleri tekrar gözden         │"
        echo "   │  geçirmenizi öneririz.           │"
        echo "   └──────────────────────────────────┘"
        
    else
        echo
        echo "📚 DAHA FAZLA ÇALIŞMA GEREKİYOR"
        echo
        echo "   ┌──────────────────────────────────┐"
        echo "   │  Modülleri baştan okuyarak       │"
        echo "   │  dpkg konusunu pekiştirmeniz     │"
        echo "   │  faydalı olacaktır.              │"
        echo "   └──────────────────────────────────┘"
    fi
    
    echo
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "📚 ÖĞRENİM ÖNERİLERİ:"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    
    if (( QUIZ_SCORE < 7 )); then
        echo
        echo "   🔹 Modül 1: dpkg Temelleri - Yeniden okuyun"
        echo "   🔹 Modül 2: Temel Komutlar - Pratik yapın"
        echo "   🔹 Sağ panelde komutları test edin"
        echo "   🔹 dpkg vs APT farkını iyice kavrayın"
        echo
    elif (( QUIZ_SCORE < 10 )); then
        echo
        echo "   🔹 Modül 3: Paket Sorgulama - Detaylı inceleyin"
        echo "   🔹 Modül 4: Gelişmiş Kullanım - Pekiştirin"
        echo "   🔹 Modül 5: Sorun Giderme - Pratik yapın"
        echo "   🔹 Gerçek paketler üzerinde denemeler yapın"
        echo
    else
        echo
        echo "   🔹 Diğer paket yöneticilerini öğrenebilirsiniz (yum, pacman)"
        echo "   🔹 Kendi .deb paketinizi oluşturmayı deneyin"
        echo "   🔹 dpkg-deb araçlarını derinlemesine keşfedin"
        echo "   🔹 Sistem yöneticiliği konularında ilerleyebilirsiniz"
        echo
    fi
    
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo
    echo "🎬 Seçenekler:"
    echo "   [1] Testi tekrarla"
    if [[ ${#WRONG_QUESTIONS[@]} -gt 0 ]]; then
        echo "   [2] Yanlış sorular ve çözümleri (${#WRONG_QUESTIONS[@]} soru)"
        echo "   [3] Ana menüye dön"
    else
        echo "   [2] Ana menüye dön"
    fi
    echo
    echo -n "Seçiminiz: "
    
    read -r choice
    case $choice in
        1)
            start_quiz
            ;;
        2)
            if [[ ${#WRONG_QUESTIONS[@]} -gt 0 ]]; then
                show_wrong_answers
                show_quiz_results
            else
                return
            fi
            ;;
        3)
            return
            ;;
        *)
            return
            ;;
    esac
}

show_wrong_answers() {
    clear
    echo "╔══════════════════════════════════════════════════════════════════════════════╗"
    echo "║                    📝 YANLIŞ SORULAR VE ÇÖZÜMLER                            ║"
    echo "╚══════════════════════════════════════════════════════════════════════════════╝"
    echo
    
    local count=1
    for i in "${!WRONG_QUESTIONS[@]}"; do
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        echo "Soru ${count}: ${WRONG_QUESTIONS[$i]}"
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        echo
        echo "❌ Sizin cevabınız:"
        echo "   ${WRONG_USER_ANSWERS[$i]}"
        echo
        echo "✅ Doğru cevap:"
        echo "   ${WRONG_CORRECT_ANSWERS[$i]}"
        echo
        echo "💡 Açıklama:"
        echo "   ${WRONG_EXPLANATIONS[$i]}"
        echo
        ((count++))
    done
    
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo
    echo "Sonuç ekranına dönmek için Enter'a basın..."
    read -r
}

# Script doğrudan çalıştırılırsa quiz'i başlat
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    show_module_quiz
fi
