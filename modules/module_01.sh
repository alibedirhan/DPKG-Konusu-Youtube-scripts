#!/bin/bash

show_module_01() {
    cat << 'CONTENT_EOF'


━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📖 Navigasyon: ↑↓ ok tuşları | Space=sayfa aşağı | q=çıkış
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

💡 Komut Kopyalama: SHIFT+Fare ile seç → Ctrl+Shift+C/V

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

╔══════════════════════════════════════════════════════════════════════════════╗
║                     MODÜL 1: DPKG TEMELLERİ VE APT İLE FARKI                 ║
║                          (Yeni Başlayanlar İçin)                             ║
╚══════════════════════════════════════════════════════════════════════════════╝

🟣 DPKG NEDİR?

dpkg (Debian Package), Debian tabanlı Linux sistemlerinde (Ubuntu, Mint, Kali vb.) 
paket yönetiminin temelini oluşturan düşük seviyeli araçtır. 

🤔 BİR ÖRNEK İLE ANLAYALIM:

Bir ev inşa etmeyi düşünün:
• dpkg → İnşaat malzemeleri (tuğla, çimento, demir)
• APT  → Mimar ve müteahhit (her şeyi planlayan, organize eden)

dpkg, paketlerin kurulması/kaldırılması gibi temel işlemleri yapar. ANCAK,
bağımlılıkları otomatik çözmez! APT ise dpkg'yi kullanarak bağımlılıkları da 
yönetir.

╔══════════════════════════════════════════════════════════════════════════════╗
║                         📦 .DEB PAKETİ NEDİR?                                ║
╚══════════════════════════════════════════════════════════════════════════════╝

.deb uzantılı dosyalar, Debian paketleridir. İçlerinde:
✓ Program dosyaları (binary'ler)
✓ Konfigürasyon dosyaları
✓ Kütüphane dosyaları
✓ Dokümantasyon
✓ Paket meta verileri (versiyon, bağımlılıklar, açıklama)

Windows'taki .exe veya .msi dosyalarına benzer, ama çok daha akıllıdır! 🧠

💻 Örnek: Bir .deb paketinin içini görmek
────────────────────────────────────────────────────────────────────────────────
$ dpkg --contents /var/cache/apt/archives/vim_*.deb | head -5

Çıktı örneği:
drwxr-xr-x root/root         0 2024-01-15 10:30 ./
drwxr-xr-x root/root         0 2024-01-15 10:30 ./usr/
drwxr-xr-x root/root         0 2024-01-15 10:30 ./usr/bin/
-rwxr-xr-x root/root   3456789 2024-01-15 10:30 ./usr/bin/vim
drwxr-xr-x root/root         0 2024-01-15 10:30 ./usr/share/
────────────────────────────────────────────────────────────────────────────────

╔══════════════════════════════════════════════════════════════════════════════╗
║                        🔄 APT vs dpkg: NE ZAMAN HANGİSİ?                     ║
╚══════════════════════════════════════════════════════════════════════════════╝

┌─────────────────────────────────────────────────────────────────────────────┐
│                               APT KULLANIN                                   │
├─────────────────────────────────────────────────────────────────────────────┤
│ ✅ Günlük paket kurulumu/kaldırma işlemlerinde                              │
│ ✅ Sistem güncellemelerinde                                                 │
│ ✅ Bağımlılık sorunlarından kaçınmak için                                   │
│ ✅ İnternet deposundan paket indirme                                        │
│                                                                              │
│ Örnek: sudo apt install firefox                                             │
│ → APT otomatik olarak tüm bağımlılıkları indirir ve dpkg ile kurar         │
└─────────────────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────────────────┐
│                              DPKG KULLANIN                                   │
├─────────────────────────────────────────────────────────────────────────────┤
│ ✅ Elinizde .deb dosyası varsa (internetten indirdiyseniz)                 │
│ ✅ Yerel paket kurulumu yaparken                                            │
│ ✅ Paket bilgisi sorgularken (daha hızlı)                                   │
│ ✅ Sistem analizi ve debugging yaparken                                     │
│ ✅ APT depolarında olmayan özel paketler için                               │
│                                                                              │
│ Örnek: sudo dpkg -i google-chrome-stable.deb                                │
│ → Ama dikkat! Eksik bağımlılık varsa hata verir!                           │
└─────────────────────────────────────────────────────────────────────────────┘

🎯 YENİ BAŞLAYANLAR İÇİN ALTIN KURAL:

"Günlük işlerinizde APT kullanın. dpkg'yi yalnızca özel durumlar ve 
 sistem incelemesi için kullanın."

╔══════════════════════════════════════════════════════════════════════════════╗
║                    💡 GERÇEK HAYATTAN BİR SENARYO                            ║
╚══════════════════════════════════════════════════════════════════════════════╝

Diyelim ki Google Chrome'u kurmak istiyorsunuz:

🔴 YANLIŞ YOL (Acemi hatası):
1. Chrome .deb dosyasını indir
2. sudo dpkg -i google-chrome-stable.deb
3. ❌ HATA! Bağımlılıklar eksik...
4. Manuel olarak her bağımlılığı bul ve kur (çok zor!)

🟢 DOĞRU YOL (Profesyonel yaklaşım):
1. Chrome .deb dosyasını indir
2. sudo dpkg -i google-chrome-stable.deb
3. Bağımlılık hatası alırsan: sudo apt install -f
4. ✅ APT eksik bağımlılıkları otomatik kurar!

YA DA daha da iyisi:
1. sudo apt install ./google-chrome-stable.deb
2. ✅ APT hem dosyayı kurar, hem bağımlılıkları çözer!

╔══════════════════════════════════════════════════════════════════════════════╗
║                        🔍 DPKG VERİTABANI NEREDE?                            ║
╚══════════════════════════════════════════════════════════════════════════════╝

dpkg tüm kurulu paketlerin bilgilerini şurada saklar:

📂 /var/lib/dpkg/
   ├── status          → Kurulu paketlerin durumu (ÇOK ÖNEMLİ!)
   ├── info/           → Her paketin detaylı bilgileri
   ├── available       → Mevcut paketler listesi
   └── lock            → dpkg çalışırken kilitleme dosyası

💻 Kurulu paket sayısını öğrenmek:
────────────────────────────────────────────────────────────────────────────────
$ dpkg --list | grep "^ii" | wc -l

Çıktı örneği: 2847
(Yani sistemde 2847 paket kurulu demek!)
────────────────────────────────────────────────────────────────────────────────

💻 status dosyasını incelemek (TEHLİKELİ! Sadece okumak için):
────────────────────────────────────────────────────────────────────────────────
$ less /var/lib/dpkg/status
────────────────────────────────────────────────────────────────────────────────

⚠️  DİKKAT: Bu dosyayı ASLA elle düzenlemeyin! Sisteminiz bozulabilir!

╔══════════════════════════════════════════════════════════════════════════════╗
║                     📊 DPKG DURUM KODLARI (STATUS)                           ║
╚══════════════════════════════════════════════════════════════════════════════╝

dpkg --list çıktısında gördüğünüz harfler ne anlama gelir?

İlk sütun (Desired State - İstenen durum):
  u = Unknown       (Bilinmiyor)
  i = Install       (Kurulsun)
  r = Remove        (Kaldırılsın)
  p = Purge         (Tamamen temizlensin)
  h = Hold          (Tutulsun, güncellenmesin)

İkinci sütun (Current State - Mevcut durum):
  n = Not-installed (Kurulu değil)
  i = Installed     (Kurulu)
  c = Config-files  (Sadece config dosyaları kaldı)
  U = Unpacked      (Açıldı ama yapılandırılmadı)
  F = Failed-config (Yapılandırma başarısız)
  H = Half-installed(Yarım kurulu)

Üçüncü sütun (Error Flag - Hata durumu):
  <boş> = OK
  R = Reinst-required (Yeniden kurulum gerekli)

💻 Örnek: Paket durumlarını anlamak
────────────────────────────────────────────────────────────────────────────────
$ dpkg --list | head -5

Çıktı:
Desired=Unknown/Install/Remove/Purge/Hold
| Status=Not/Inst/Conf-files/Unpacked/halF-conf/Half-inst/trig-aWait/Trig-pend
|/ Err?=(none)/Reinst-required (Status,Err: uppercase=bad)
||/ Name           Version      Architecture Description
+++-==============-============-============-==================================
ii  bash           5.1-6ubuntu1 amd64        GNU Bourne Again SHell
rc  apache2        2.4.52-1     amd64        Apache HTTP Server
────────────────────────────────────────────────────────────────────────────────

📖 Açıklama:
• "ii bash" → İstenen: install, Durum: installed, Hata: yok ✅
• "rc apache2" → İstenen: remove, Durum: config-files (sadece ayarlar kaldı)

╔══════════════════════════════════════════════════════════════════════════════╗
║                        🎓 YENİ KULLANICI İPUÇLARI                            ║
╚══════════════════════════════════════════════════════════════════════════════╝

1. 🔒 dpkg İLE PAKET KURARKEN DİKKAT!
   → Her zaman önce "sudo apt install -f" ile bağımlılıkları kontrol edin

2. 🗑️  PAKET KALDIRIRKEN:
   → "remove" ayarları korur, "purge" her şeyi siler

3. 📦 İNTERNETTEN .DEB İNDİRİRKEN:
   → Güvenilir kaynaklardan indirin (resmi siteler)
   → İndirdikten sonra "sudo apt install ./paket.deb" tercih edin

4. 🔍 BİLGİ ALMAK İÇİN dpkg HIZLIDIR:
   → APT'den daha hızlı sorgu yapar (online depoya bağlanmaz)

5. ⚡ ACELE İŞLEMLERDE dikkat:
   → dpkg kilitlenirse (stuck), /var/lib/dpkg/lock-frontend'i silmeyin!
   → Önce işlemlerin bitmesini bekleyin

╔══════════════════════════════════════════════════════════════════════════════╗
║                          📝 ÖZET: 3 TEMEL NOKTA                              ║
╚══════════════════════════════════════════════════════════════════════════════╝

1️⃣  dpkg = Düşük seviyeli paket yöneticisi (APT'nin altında çalışır)
2️⃣  .deb dosyaları = Debian paket formatı (program + meta veriler)
3️⃣  Günlük işlerde APT kullanın, özel durumlar için dpkg kullanın

─────────────────────────────────────────────────────────────────────────────────

🎯 SONRAKİ MODÜLDE: dpkg'nin temel komutlarını öğreneceğiz!
   (Paket kurma, kaldırma, listeleme...)

💡 İpucu: Sağdaki test terminalinde şu komutu deneyin:
   → dpkg --list | head -10


━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🔙 Ana menüye dönmek için 'q' tuşuna basın
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

CONTENT_EOF
}
