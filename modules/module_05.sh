#!/bin/bash

show_module_05() {
    cat << 'CONTENT_EOF'

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📖 Navigasyon: ↑↓ ok tuşları | Space=sayfa aşağı | q=çıkış
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

💡 Komut Kopyalama: SHIFT+Fare ile seç → Ctrl+Shift+C/V

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

╔══════════════════════════════════════════════════════════════════════════════╗
║                  MODÜL 5: DPKG İLE SORUN GİDERME                             ║
║                  (Gerçek Hatalar ve Çözümler!)                               ║
╚══════════════════════════════════════════════════════════════════════════════╝

🟣 GİRİŞ

dpkg ile çalışırken karşılaşabileceğiniz yaygın sorunlar ve çözümleri!
Bu modül size "sistem bozuldu ne yapacağım?" anındaki kurtarıcınız olacak! 🚑

╔══════════════════════════════════════════════════════════════════════════════╗
║               🔒 1. DPKG KİLİTLENME SORUNU (LOCK)                            ║
╚══════════════════════════════════════════════════════════════════════════════╝

EN YAYGIN HATA:

────────────────────────────────────────────────────────────────────────────────
E: Could not get lock /var/lib/dpkg/lock-frontend
E: Unable to acquire dpkg frontend lock
────────────────────────────────────────────────────────────────────────────────

📖 NEDEN OLUYOR?

dpkg aynı anda sadece bir işlem yapabilir. Eğer başka bir apt/dpkg işlemi
çalışıyorsa, kilit dosyası oluşturulur ve diğer işlemler bekler.

🎯 ÇÖZÜM ADIMLARI (SIRASINA GÖRE DENEYIN):

────────────────────────────────────────────────────────────────────────────────
ADIM 1: Çalışan işlemleri kontrol edin
────────────────────────────────────────────────────────────────────────────────
$ ps aux | grep -i apt
$ ps aux | grep -i dpkg

Çıktıda aktif bir apt veya dpkg işlemi varsa, BİTMESİNİ BEKLEYİN! ⏰
Özellikle "unattended-upgrade" çalışıyor olabilir (otomatik güncelleme).
────────────────────────────────────────────────────────────────────────────────

────────────────────────────────────────────────────────────────────────────────
ADIM 2: Zombie işlemleri temizleyin
────────────────────────────────────────────────────────────────────────────────
Eğer dpkg takılı kalmışsa:

$ sudo killall apt apt-get dpkg

⚠️  DİKKAT: Bunu sadece işlemin gerçekten takılı kaldığından eminseniz yapın!
────────────────────────────────────────────────────────────────────────────────

────────────────────────────────────────────────────────────────────────────────
ADIM 3: Kilit dosyalarını manuel silme (SON ÇARE!)
────────────────────────────────────────────────────────────────────────────────
$ sudo rm /var/lib/dpkg/lock-frontend
$ sudo rm /var/lib/dpkg/lock
$ sudo rm /var/cache/apt/archives/lock

Sonra:
$ sudo dpkg --configure -a
$ sudo apt update
────────────────────────────────────────────────────────────────────────────────

🚨 ÖNEMLİ UYARI:
Aktif bir işlem çalışırken kilit dosyalarını SİLMEYİN! Sistem bozulabilir!

╔══════════════════════════════════════════════════════════════════════════════╗
║           💔 2. BOZUK BAĞIMLILIK SORUNU (BROKEN DEPENDENCIES)                ║
╚══════════════════════════════════════════════════════════════════════════════╝

HATA ÖRNEĞİ:

────────────────────────────────────────────────────────────────────────────────
dpkg: dependency problems prevent configuration of package-name:
 package-name depends on library-name (>= 1.2.3); however:
  Package library-name is not installed.
────────────────────────────────────────────────────────────────────────────────

📖 NEDEN OLUYOR?

• Paketi dpkg -i ile kurdunuz ama bağımlılıkları yoktu
• Paket yarı kurulmuş kaldı
• Sistem güncelleme sırasında kesinti oldu

🎯 ÇÖZÜM:

────────────────────────────────────────────────────────────────────────────────
YÖNTEM 1: APT'nin otomatik onarımı (EN KOLAY)
────────────────────────────────────────────────────────────────────────────────
$ sudo apt install -f

Bu komut eksik bağımlılıkları otomatik bulup kurar! ✨

Alternatif:
$ sudo apt --fix-broken install
────────────────────────────────────────────────────────────────────────────────

────────────────────────────────────────────────────────────────────────────────
YÖNTEM 2: Sorunu yaratan paketi kaldırma
────────────────────────────────────────────────────────────────────────────────
$ sudo dpkg --remove --force-remove-reinstreq PAKET

Sonra:
$ sudo apt install -f
────────────────────────────────────────────────────────────────────────────────

────────────────────────────────────────────────────────────────────────────────
YÖNTEM 3: Yarı yapılandırılmış paketleri düzeltme
────────────────────────────────────────────────────────────────────────────────
$ sudo dpkg --configure -a

Bu komut "half-configured" durumundaki tüm paketleri düzeltir!
────────────────────────────────────────────────────────────────────────────────

🎯 GERÇEK SENARYO: Google Chrome kurulumu bozuldu

────────────────────────────────────────────────────────────────────────────────
$ sudo dpkg -i google-chrome.deb
... dependency errors ...

$ sudo apt install -f
The following packages will be installed:
  libappindicator1 libindicator7 ...
Do you want to continue? [Y/n] Y
... installing dependencies ...
✅ google-chrome successfully configured!
────────────────────────────────────────────────────────────────────────────────

╔══════════════════════════════════════════════════════════════════════════════╗
║             ⚠️  3. PAKET YARIM KURULMUŞ (HALF-INSTALLED)                     ║
╚══════════════════════════════════════════════════════════════════════════════╝

HATA BELİRTİLERİ:

────────────────────────────────────────────────────────────────────────────────
$ dpkg -l | grep "^iH"
iH  apache2   2.4.52-1  amd64  Apache HTTP Server
────────────────────────────────────────────────────────────────────────────────

"iH" = Half-installed (yarım kurulmuş)

🎯 ÇÖZÜM ADIMLARI:

────────────────────────────────────────────────────────────────────────────────
1. Paketi yeniden yapılandırma
────────────────────────────────────────────────────────────────────────────────
$ sudo dpkg --configure apache2

Eğer bu çalışmazsa:
────────────────────────────────────────────────────────────────────────────────

────────────────────────────────────────────────────────────────────────────────
2. Paketi kaldırıp yeniden kurma
────────────────────────────────────────────────────────────────────────────────
$ sudo dpkg --remove --force-remove-reinstreq apache2
$ sudo apt install apache2
────────────────────────────────────────────────────────────────────────────────

────────────────────────────────────────────────────────────────────────────────
3. Tüm yarım kalmış paketleri toplu düzeltme
────────────────────────────────────────────────────────────────────────────────
$ sudo dpkg --configure -a
$ sudo apt install -f
────────────────────────────────────────────────────────────────────────────────

╔══════════════════════════════════════════════════════════════════════════════╗
║              📊 4. DPKG STATUS DOSYASI BOZULMUŞ                              ║
╚══════════════════════════════════════════════════════════════════════════════╝

EN KORKUTUCU HATA:

────────────────────────────────────────────────────────────────────────────────
dpkg: error: parsing file '/var/lib/dpkg/status' near line 1234
────────────────────────────────────────────────────────────────────────────────

📖 NEDEN OLUYOR?

• Disk doldu ve status dosyası bozuldu
• Güç kesintisi
• Sistem çökmesi

🎯 ÇÖZÜM (ADIM ADIM):

────────────────────────────────────────────────────────────────────────────────
ADIM 1: Yedek dosyayı kontrol edin
────────────────────────────────────────────────────────────────────────────────
$ sudo ls -lh /var/lib/dpkg/status*

Çıktı:
-rw-r--r-- 1 root root  45M /var/lib/dpkg/status
-rw-r--r-- 1 root root  45M /var/lib/dpkg/status-old

Status-old dosyası yedektir! 💾
────────────────────────────────────────────────────────────────────────────────

────────────────────────────────────────────────────────────────────────────────
ADIM 2: Bozuk dosyayı yedeğiyle değiştirin
────────────────────────────────────────────────────────────────────────────────
$ sudo cp /var/lib/dpkg/status /var/lib/dpkg/status-broken-backup
$ sudo cp /var/lib/dpkg/status-old /var/lib/dpkg/status
────────────────────────────────────────────────────────────────────────────────

────────────────────────────────────────────────────────────────────────────────
ADIM 3: Veritabanını onarın
────────────────────────────────────────────────────────────────────────────────
$ sudo dpkg --configure -a
$ sudo apt update
$ sudo apt install -f
────────────────────────────────────────────────────────────────────────────────

🚨 SON ÇARE: Available dosyasından yeniden oluşturma

────────────────────────────────────────────────────────────────────────────────
$ sudo dpkg --clear-avail
$ sudo apt-cache dumpavail | sudo dpkg --merge-avail
────────────────────────────────────────────────────────────────────────────────

╔══════════════════════════════════════════════════════════════════════════════╗
║                  🔍 5. PAKET DOSYALARI EKSİK/BOZUK                           ║
╚══════════════════════════════════════════════════════════════════════════════╝

PROBLEM: Bir program çalışmıyor, dosyaları eksik görünüyor.

🎯 TANI:

────────────────────────────────────────────────────────────────────────────────
$ dpkg -L bash | xargs ls -l

Eğer "No such file" hatası alırsanız, dosyalar silindi demektir!
────────────────────────────────────────────────────────────────────────────────

🎯 ÇÖZÜM:

────────────────────────────────────────────────────────────────────────────────
YÖNTEM 1: Paketi yeniden kurma (tercih edilen)
────────────────────────────────────────────────────────────────────────────────
$ sudo apt install --reinstall bash
────────────────────────────────────────────────────────────────────────────────

────────────────────────────────────────────────────────────────────────────────
YÖNTEM 2: dpkg ile manuel yeniden kurma
────────────────────────────────────────────────────────────────────────────────
$ cd /var/cache/apt/archives/
$ sudo dpkg -i bash_*.deb
────────────────────────────────────────────────────────────────────────────────

────────────────────────────────────────────────────────────────────────────────
YÖNTEM 3: Tüm sistemi kontrol etme
────────────────────────────────────────────────────────────────────────────────
$ dpkg -l | grep "^ii" | awk '{print $2}' > installed.txt

$ for pkg in $(cat installed.txt); do
    dpkg -L $pkg | xargs ls -l > /dev/null 2>&1 || echo "BROKEN: $pkg"
done
────────────────────────────────────────────────────────────────────────────────

╔══════════════════════════════════════════════════════════════════════════════╗
║                   🛡️  6. ACIL DURUM KOMUTLARI                                ║
╚══════════════════════════════════════════════════════════════════════════════╝

Sistem çok bozuk, neredeyse boot bile olmuyor? İşte kurtarma komutları:

────────────────────────────────────────────────────────────────────────────────
1. Tüm paket yönetimini sıfırlama
────────────────────────────────────────────────────────────────────────────────
$ sudo dpkg --configure -a
$ sudo apt-get clean
$ sudo apt-get update
$ sudo apt-get upgrade
$ sudo apt-get dist-upgrade
────────────────────────────────────────────────────────────────────────────────

────────────────────────────────────────────────────────────────────────────────
2. Zorla onarım (dikkatli kullanın!)
────────────────────────────────────────────────────────────────────────────────
$ sudo dpkg --force-all --configure -a

⚠️  Bu komutu yalnızca son çare olarak kullanın!
────────────────────────────────────────────────────────────────────────────────

────────────────────────────────────────────────────────────────────────────────
3. Sorunlu paketi zorla kaldırma
────────────────────────────────────────────────────────────────────────────────
$ sudo dpkg --remove --force-remove-reinstreq PAKET
$ sudo dpkg --purge --force-all PAKET
────────────────────────────────────────────────────────────────────────────────

────────────────────────────────────────────────────────────────────────────────
4. Log dosyalarını inceleyin
────────────────────────────────────────────────────────────────────────────────
$ less /var/log/dpkg.log
$ less /var/log/apt/term.log

Bu dosyalar ne yanlış gittiğini gösterir! 📋
────────────────────────────────────────────────────────────────────────────────

╔══════════════════════════════════════════════════════════════════════════════╗
║                    💡 SORUN GİDERME KONTROL LİSTESİ                          ║
╚══════════════════════════════════════════════════════════════════════════════╝

Problem çözümleme sırası (her adımı sırayla deneyin):

✅ 1. İşlemlerin bitmesini bekleyin (ps aux | grep apt)
✅ 2. sudo dpkg --configure -a
✅ 3. sudo apt install -f
✅ 4. sudo apt update
✅ 5. sudo apt --fix-broken install
✅ 6. Kilit dosyalarını temizleyin (sadece gerekirse)
✅ 7. Log dosyalarını inceleyin (/var/log/dpkg.log)
✅ 8. Status dosyasını onarın (yedekten geri yükleyin)
✅ 9. Paketi yeniden kurun (--reinstall)
✅ 10. Son çare: dpkg --force-all (DİKKATLİ!)

╔══════════════════════════════════════════════════════════════════════════════╗
║                     🎓 YENİ BAŞLAYANLAR İÇİN UYARILAR                        ║
╚══════════════════════════════════════════════════════════════════════════════╝

❌ ASLA YAPMAYIN:
  • /var/lib/dpkg/status dosyasını elle düzenleme
  • Kilit dosyalarını aktif işlem sırasında silme
  • --force-all komutunu araştırmadan kullanma
  • Root dosya sistemini doldurma

✅ HER ZAMAN YAPIN:
  • İşlemlerin bitmesini sabırla bekleyin
  • Önce güvenli yöntemleri deneyin (apt install -f)
  • Log dosyalarını kontrol edin
  • Önemli işlemler öncesi yedek alın

🔐 GÜVENLİK:
  • Bilinmeyen .deb dosyalarını kurmayın
  • --force komutlarını dikkatli kullanın
  • Kritik paketleri silmeyin (libc6, dpkg, apt)

╔══════════════════════════════════════════════════════════════════════════════╗
║                          📝 HATA ÇÖZÜM ÖZETİ                                 ║
╚══════════════════════════════════════════════════════════════════════════════╝

┌────────────────────────┬─────────────────────────────────────────────────┐
│ Hata Türü              │ Çözüm                                           │
├────────────────────────┼─────────────────────────────────────────────────┤
│ Lock hatası            │ ps aux \| grep apt, sonra killall, son çare rm │
│ Broken dependency      │ sudo apt install -f                             │
│ Half-installed         │ sudo dpkg --configure -a                        │
│ Status bozulması       │ sudo cp status-old status                       │
│ Eksik dosyalar         │ sudo apt install --reinstall PAKET              │
└────────────────────────┴─────────────────────────────────────────────────┘

─────────────────────────────────────────────────────────────────────────────────

🎯 SONRAKİ ADIM: BİLGİ YARIŞMASI! 🎉
   Öğrendiklerinizi test etme zamanı!

💡 İpucu: Bu komutlar sizin "Linux kurtarma çantanız"!
   Bir yere not edin, lazım olacak! 📝


━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🔙 Ana menüye dönmek için 'q' tuşuna basın
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
CONTENT_EOF
}
