#!/bin/bash

show_module_02() {
    cat << 'CONTENT_EOF'

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📖 Navigasyon: ↑↓ ok tuşları | Space=sayfa aşağı | q=çıkış
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

💡 Komut Kopyalama: SHIFT+Fare ile seç → Ctrl+Shift+C/V

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

╔══════════════════════════════════════════════════════════════════════════════╗
║                    MODÜL 2: TEMEL DPKG KOMUTLARI                             ║
║                       (Pratik Örneklerle Öğrenin!)                           ║
╚══════════════════════════════════════════════════════════════════════════════╝

🟣 GİRİŞ: DPKG KOMUT YAPISI

dpkg komutları genellikle şu şekildedir:
  dpkg [SEÇENEK] [PAKET/DOSYA]

Önemli: Kurulum/kaldırma işlemleri için sudo gerekir! ⚠️

╔══════════════════════════════════════════════════════════════════════════════╗
║                     📦 1. PAKET KURMA (INSTALL)                              ║
╚══════════════════════════════════════════════════════════════════════════════╝

Komut: dpkg -i PAKET.deb  (veya --install)

💻 Temel Kullanım:
────────────────────────────────────────────────────────────────────────────────
$ sudo dpkg -i google-chrome-stable_current_amd64.deb

Çıktı:
(Veritabanı okunuyor ... 256789 dosya ve dizin kurulu.)
google-chrome-stable:amd64 paketini hazırlanıyor ...
google-chrome-stable:amd64 açılıyor ...
google-chrome-stable:amd64 ayarlanıyor ...
────────────────────────────────────────────────────────────────────────────────

⚠️  YENİ BAŞLAYANLAR İÇİN UYARI:

Eğer bağımlılık hatası alırsanız:
❌ YANLIŞ: Paniklemeyin ve .deb dosyalarını manuel aramayın!
✅ DOĞRU: Bu komutu çalıştırın:

────────────────────────────────────────────────────────────────────────────────
$ sudo apt install -f

Bu komut eksik bağımlılıkları otomatik kurar!
────────────────────────────────────────────────────────────────────────────────

💡 DAHA İYİ BİR YOL (Önerilen):
────────────────────────────────────────────────────────────────────────────────
$ sudo apt install ./google-chrome-stable_current_amd64.deb

APT hem paketi kurar, hem bağımlılıkları otomatik çözer! 🎯
────────────────────────────────────────────────────────────────────────────────

🔍 KURULUM SIRASINDA NELER OLUR?

1. Paketin bütünlüğü kontrol edilir
2. Varsa eski versiyon kaldırılır
3. Dosyalar /usr, /etc gibi dizinlere yerleştirilir
4. Paket veritabanı güncellenir (/var/lib/dpkg/status)
5. Post-install scriptleri çalıştırılır

╔══════════════════════════════════════════════════════════════════════════════╗
║                    🗑️  2. PAKET KALDIRMA (REMOVE)                            ║
╚══════════════════════════════════════════════════════════════════════════════╝

İki yöntem var:

┌─────────────────────────────────────────────────────────────────────────────┐
│ A) REMOVE: Programı kaldır, ayarları KORU                                   │
└─────────────────────────────────────────────────────────────────────────────┘

💻 Komut: dpkg -r PAKET  (veya --remove)
────────────────────────────────────────────────────────────────────────────────
$ sudo dpkg -r firefox

Çıktı:
(Veritabanı okunuyor ... 256789 dosya ve dizin kurulu.)
firefox kaldırılıyor ...
────────────────────────────────────────────────────────────────────────────────

Ne silindi?   → /usr/bin/firefox, program dosyaları
Ne KALDI?     → /etc/firefox/ altındaki konfigürasyon dosyaları

┌─────────────────────────────────────────────────────────────────────────────┐
│ B) PURGE: Programı ve TÜM ayarları tamamen temizle                          │
└─────────────────────────────────────────────────────────────────────────────┘

💻 Komut: dpkg -P PAKET  (veya --purge)
────────────────────────────────────────────────────────────────────────────────
$ sudo dpkg -P firefox

Çıktı:
(Veritabanı okunuyor ... 256789 dosya ve dizin kurulu.)
firefox temizleniyor ...
Konfigürasyon dosyaları da siliniyor ...
────────────────────────────────────────────────────────────────────────────────

Ne silindi?   → HERŞEY! Program + ayar dosyaları

🤔 HANGİSİNİ KULLANMALIYIM?

• Remove (-r)  → Belki tekrar kurarım, ayarlarımı saklamak isterim
• Purge (-P)   → Artık asla kullanmayacağım, tamamen temizlensin

💻 Örnek Senaryo: Apache2'yi tamamen silmek
────────────────────────────────────────────────────────────────────────────────
$ sudo dpkg -r apache2        # Programı kaldır
$ dpkg --list | grep apache2  # Duruma bak

Çıktı:
rc  apache2  2.4.52-1  amd64  Apache HTTP Server
     ↑
     └─ "rc" = remove edildi ama config dosyaları var

$ sudo dpkg -P apache2        # Şimdi ayarları da sil
$ dpkg --list | grep apache2  # Artık hiçbir iz yok!
────────────────────────────────────────────────────────────────────────────────

╔══════════════════════════════════════════════════════════════════════════════╗
║                   📋 3. PAKET LİSTELEME (LIST)                               ║
╚══════════════════════════════════════════════════════════════════════════════╝

En çok kullanacağınız komutlardan biri! 📊

💻 Tüm paketleri listele:
────────────────────────────────────────────────────────────────────────────────
$ dpkg --list
(veya kısa hali)
$ dpkg -l

Çıktı:
Desired=Unknown/Install/Remove/Purge/Hold
| Status=Not/Inst/Conf-files/Unpacked/halF-conf/Half-inst/trig-aWait/Trig-pend
|/ Err?=(none)/Reinst-required (Status,Err: uppercase=bad)
||/ Name                Version         Architecture  Description
+++-==================-===============-=============-===========================
ii  bash               5.1-6ubuntu1    amd64         GNU Bourne Again SHell
ii  firefox            105.0.3+build1  amd64         Safe and easy web browser
rc  apache2            2.4.52-1ubuntu1 amd64         Apache HTTP Server
────────────────────────────────────────────────────────────────────────────────

📖 Durum kodlarını hatırlıyor musunuz? (Modül 1'den)
• "ii" = Installed (kurulu ve tamam) ✅
• "rc" = Removed but config files remain (silinmiş ama ayarlar var)

💻 Belirli bir paketi aramak:
────────────────────────────────────────────────────────────────────────────────
$ dpkg -l firefox

Çıktı:
||/ Name      Version         Architecture  Description
+++-=========-===============-=============-================
ii  firefox   105.0.3+build1  amd64         Safe and easy web browser
────────────────────────────────────────────────────────────────────────────────

💻 Wildcard (joker) kullanarak aramak:
────────────────────────────────────────────────────────────────────────────────
$ dpkg -l 'lib*'  # lib ile başlayan tüm paketler

Çıktı:
ii  libc6              2.35-0ubuntu3   amd64  GNU C Library
ii  libcurl4           7.81.0-1ubuntu1 amd64  easy-to-use client-side URL...
ii  libssl3            3.0.2-0ubuntu1  amd64  Secure Sockets Layer toolkit
...
────────────────────────────────────────────────────────────────────────────────

💻 Sadece kurulu paketlerin sayısını öğrenmek:
────────────────────────────────────────────────────────────────────────────────
$ dpkg --list | grep "^ii" | wc -l

Çıktı:
2847
(Sistemde 2847 paket kurulu!)
────────────────────────────────────────────────────────────────────────────────

💻 Hangi paketlerin ayarları sistemde kalmış?
────────────────────────────────────────────────────────────────────────────────
$ dpkg -l | grep "^rc"

Çıktı:
rc  apache2            2.4.52-1     amd64  Apache HTTP Server
rc  mysql-server-8.0   8.0.30-1     amd64  MySQL database server

💡 Bu paketleri tamamen temizlemek için:
$ sudo dpkg -P apache2 mysql-server-8.0
────────────────────────────────────────────────────────────────────────────────

╔══════════════════════════════════════════════════════════════════════════════╗
║              🔧 4. ÇOK PAKET İŞLEMLERİ (BATCH OPERATIONS)                    ║
╚══════════════════════════════════════════════════════════════════════════════╝

Birden fazla .deb dosyasını aynı anda kurmak:

💻 Yöntem 1: Tek tek belirt
────────────────────────────────────────────────────────────────────────────────
$ sudo dpkg -i paket1.deb paket2.deb paket3.deb
────────────────────────────────────────────────────────────────────────────────

💻 Yöntem 2: Wildcard kullan
────────────────────────────────────────────────────────────────────────────────
$ sudo dpkg -i *.deb
(Bulunduğu dizindeki tüm .deb dosyalarını kurar)
────────────────────────────────────────────────────────────────────────────────

⚠️  DİKKAT: Bağımlılık sırası önemli! Eğer paket A, paket B'ye bağımlıysa:
1. Önce paket B kurulmalı
2. Sonra paket A kurulmalı

YA DA daha iyisi: sudo apt install -f ile bağımlılıkları otomatik çözün!

╔══════════════════════════════════════════════════════════════════════════════╗
║                  ⚡ 5. PAKET YENİDEN YAPILANDIRMA                             ║
╚══════════════════════════════════════════════════════════════════════════════╝

Bazen paket kurulumu yarıda kalır veya ayarlar bozulur. Çözüm:

💻 Tek paket yeniden yapılandırma:
────────────────────────────────────────────────────────────────────────────────
$ sudo dpkg --configure PAKET

Örnek:
$ sudo dpkg --configure apache2
────────────────────────────────────────────────────────────────────────────────

💻 Tüm yarım kalmış paketleri yapılandırma:
────────────────────────────────────────────────────────────────────────────────
$ sudo dpkg --configure -a

Bu komut sistemdeki tüm "yarı yapılandırılmış" paketleri düzeltir!
────────────────────────────────────────────────────────────────────────────────

🚨 NE ZAMAN KULLANILIR?

• Kurulum sırasında elektrik kesildi
• "dpkg was interrupted" hatası aldınız
• Paket "half-configured" durumunda

╔══════════════════════════════════════════════════════════════════════════════╗
║                      💡 YENİ BAŞLAYANLAR İÇİN İPUÇLARI                       ║
╚══════════════════════════════════════════════════════════════════════════════╝

1. 🔐 HER ZAMAN SUDO KULLANIN
   ❌ dpkg -i paket.deb        (HATA: Permission denied)
   ✅ sudo dpkg -i paket.deb   (Doğru!)

2. 🗂️  PAKET ADINI TAM BİLMİYORSANIZ
   $ dpkg -l | grep firefox    (Arama yapın)
   $ dpkg -l 'fire*'           (Joker karakter kullanın)

3. 📦 .DEB DOSYASI KURULUMU
   Tercih sırası:
   1. sudo apt install ./paket.deb  ← EN İYİSİ (bağımlılık çözümü)
   2. sudo dpkg -i paket.deb        ← İkinci seçenek
   3. Sonra: sudo apt install -f    ← Bağımlılıkları düzelt

4. 🧹 SİSTEM TEMİZLİĞİ
   Silinmiş ama ayarları kalmış paketleri temizleyin:
   $ dpkg -l | grep "^rc" | awk '{print $2}' | xargs sudo dpkg --purge

5. ⏸️  PAKET GÜNCELLENMESİNİ ENGELLEME
   Kritik paketlerin güncellenmesini istemiyorsanız:
   $ sudo dpkg --set-selections <<< "paket hold"
   
   Kilidi kaldırmak için:
   $ sudo dpkg --set-selections <<< "paket install"

╔══════════════════════════════════════════════════════════════════════════════╗
║                          📝 KOMUT ÖZETİ                                      ║
╚══════════════════════════════════════════════════════════════════════════════╝

┌────────────────────┬──────────────────────────────────────────────────┐
│ Komut              │ Açıklama                                         │
├────────────────────┼──────────────────────────────────────────────────┤
│ dpkg -i PAKET.deb  │ Paket kur                                        │
│ dpkg -r PAKET      │ Paket kaldır (ayarlar kalır)                    │
│ dpkg -P PAKET      │ Paket + ayarları tamamen sil                    │
│ dpkg -l            │ Tüm paketleri listele                           │
│ dpkg -l PAKET      │ Belirli paketi listele                          │
│ dpkg --configure -a │ Yarım kalmış kurulumları tamamla                │
└────────────────────┴──────────────────────────────────────────────────┘

─────────────────────────────────────────────────────────────────────────────────

🎯 SONRAKİ MODÜLDE: Paket bilgilerini sorgulamayı öğreneceğiz!
   (Hangi dosyalar nerede? Bu dosya hangi pakete ait? vs.)

💡 Şimdi deneyin: Sağdaki test terminalinde
   → dpkg -l bash
   → dpkg -l 'lib*' | head


━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🔙 Ana menüye dönmek için 'q' tuşuna basın
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
CONTENT_EOF
}
