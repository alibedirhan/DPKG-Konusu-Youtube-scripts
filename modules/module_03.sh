#!/bin/bash

show_module_03() {
    cat << 'CONTENT_EOF'

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📖 Navigasyon: ↑↓ ok tuşları | Space=sayfa aşağı | q=çıkış
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

💡 Komut Kopyalama: SHIFT+Fare ile seç → Ctrl+Shift+C/V

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

╔══════════════════════════════════════════════════════════════════════════════╗
║                  MODÜL 3: PAKET BİLGİ VE SORGULAMA                           ║
║                      (Dedektif Gibi Araştırın!)                              ║
╚══════════════════════════════════════════════════════════════════════════════╝

🟣 GİRİŞ: BİLGİ SORGULAMA NEDİR?

Linux'ta "bu dosya nerede?", "hangi paket bunu kurdu?" gibi soruların 
cevaplarını dpkg ile bulabilirsiniz. Bu modülde sistemde dedektiflik yapacağız! 🔍

╔══════════════════════════════════════════════════════════════════════════════╗
║                 📊 1. PAKET DURUM BİLGİSİ (STATUS)                           ║
╚══════════════════════════════════════════════════════════════════════════════╝

Komut: dpkg -s PAKET  (veya --status)

💻 Temel Kullanım:
────────────────────────────────────────────────────────────────────────────────
$ dpkg -s firefox

Çıktı:
Package: firefox
Status: install ok installed
Priority: optional
Section: web
Installed-Size: 225280
Maintainer: Ubuntu Mozilla Team <ubuntu-mozillateam@lists.ubuntu.com>
Architecture: amd64
Version: 105.0.3+build1-0ubuntu0.22.04.1
Depends: libc6 (>= 2.34), libgtk-3-0, libdbus-1-3, libx11-6
Description: Safe and easy web browser from Mozilla
 Firefox delivers safe, easy web browsing. A familiar user interface,
 enhanced security features including protection from online identity theft...
Homepage: https://www.mozilla.org/firefox
────────────────────────────────────────────────────────────────────────────────

📖 ÖNEMLİ ALANLAR:

• Status: Paketin durumu (installed = kurulu ✅)
• Version: Hangi versiyon kurulu?
• Installed-Size: Ne kadar yer kaplıyor? (KB cinsinden)
• Depends: Hangi paketlere bağımlı?
• Description: Paket ne işe yarıyor?

💻 Hızlı bilgi almak:
────────────────────────────────────────────────────────────────────────────────
$ dpkg -s firefox | grep Version
Version: 105.0.3+build1-0ubuntu0.22.04.1

$ dpkg -s firefox | grep Installed-Size
Installed-Size: 225280  (yaklaşık 220 MB)
────────────────────────────────────────────────────────────────────────────────

╔══════════════════════════════════════════════════════════════════════════════╗
║              📂 2. PAKET DOSYALARINI GÖRÜNTÜLEME (LISTFILES)                 ║
╚══════════════════════════════════════════════════════════════════════════════╝

Komut: dpkg -L PAKET  (veya --listfiles)

"Bu paket hangi dosyaları kurdu?" sorusunun cevabı! 📝

💻 Temel Kullanım:
────────────────────────────────────────────────────────────────────────────────
$ dpkg -L bash

Çıktı:
/.
/bin
/bin/bash
/bin/rbash
/etc
/etc/bash.bashrc
/etc/skel
/etc/skel/.bash_logout
/etc/skel/.bashrc
/etc/skel/.profile
/usr
/usr/bin
/usr/bin/bashbug
/usr/share
/usr/share/doc
/usr/share/doc/bash
...
────────────────────────────────────────────────────────────────────────────────

💻 Sadece binary dosyalarını görmek:
────────────────────────────────────────────────────────────────────────────────
$ dpkg -L bash | grep /bin/

Çıktı:
/bin/bash
/bin/rbash
/usr/bin/bashbug
────────────────────────────────────────────────────────────────────────────────

💻 Kaç dosya kuruldu?
────────────────────────────────────────────────────────────────────────────────
$ dpkg -L firefox | wc -l

Çıktı:
12458
(Firefox 12,458 dosya kurdu!)
────────────────────────────────────────────────────────────────────────────────

🎯 PRATIK ÖRNEK: Vim editörün nerede?

────────────────────────────────────────────────────────────────────────────────
$ dpkg -L vim | grep /usr/bin

Çıktı:
/usr/bin/vim
/usr/bin/vim.basic
────────────────────────────────────────────────────────────────────────────────

╔══════════════════════════════════════════════════════════════════════════════╗
║              🔎 3. DOSYA ARAMA - TERS SORGULAMA (SEARCH)                     ║
╚══════════════════════════════════════════════════════════════════════════════╝

Komut: dpkg -S DOSYA_YOLU  (veya --search)

"Bu dosya hangi pakete ait?" sorusunun cevabı! 🕵️

💻 Temel Kullanım:
────────────────────────────────────────────────────────────────────────────────
$ dpkg -S /bin/ls

Çıktı:
coreutils: /bin/ls
────────────────────────────────────────────────────────────────────────────────

Yani /bin/ls dosyası "coreutils" paketi tarafından kurulmuş!

💻 Birden fazla dosya sorgulamak:
────────────────────────────────────────────────────────────────────────────────
$ dpkg -S /bin/bash /bin/ls /usr/bin/vim

Çıktı:
bash: /bin/bash
coreutils: /bin/ls
vim: /usr/bin/vim
────────────────────────────────────────────────────────────────────────────────

💻 Joker karakter kullanarak:
────────────────────────────────────────────────────────────────────────────────
$ dpkg -S /usr/bin/python*

Çıktı:
python3.10: /usr/bin/python3.10
python3: /usr/bin/python3
python-is-python3: /usr/bin/python
────────────────────────────────────────────────────────────────────────────────

🎯 GERÇEK HAYAT KULLANIMI:

Sistem çöküyor, hangi paket sorumlu?

────────────────────────────────────────────────────────────────────────────────
$ which nginx
/usr/sbin/nginx

$ dpkg -S /usr/sbin/nginx
nginx-core: /usr/sbin/nginx

Aha! nginx-core paketi sorumlu. Şimdi ona bakabiliriz:
$ dpkg -s nginx-core
────────────────────────────────────────────────────────────────────────────────

⚠️  DİKKAT: dpkg -S yalnızca kurulu paketlerin dosyalarını arar!

╔══════════════════════════════════════════════════════════════════════════════╗
║                  📋 4. DETAYLI PAKET BİLGİSİ (INFO)                          ║
╚══════════════════════════════════════════════════════════════════════════════╝

Kurulmamış bir .deb dosyası hakkında bilgi almak:

💻 Komut: dpkg -I PAKET.deb  (veya --info)
────────────────────────────────────────────────────────────────────────────────
$ dpkg -I google-chrome-stable_current_amd64.deb

Çıktı:
 new Debian package, version 2.0.
 size 89234560 bytes: control archive=12345 bytes.
     123 bytes,     4 lines      control              
    4567 bytes,    56 lines      postinst             #!/bin/bash
     123 bytes,     4 lines      postrm               #!/bin/bash
     890 bytes,    12 lines      prerm                #!/bin/bash
 Package: google-chrome-stable
 Version: 108.0.5359.124-1
 Architecture: amd64
 Maintainer: Chrome Linux Team <chromium-dev@chromium.org>
 Installed-Size: 298456
 Depends: ca-certificates, fonts-liberation, libasound2, libatk-bridge2.0-0...
 Section: web
 Priority: optional
 Description: The web browser from Google
  Google Chrome is a browser that combines a minimal design with sophisticated
  technology to make the web faster, safer, and easier.
────────────────────────────────────────────────────────────────────────────────

Bu komut sayesinde paketi KURMADAN ne yaptığını görebilirsiniz! 🎯

💻 .deb dosyasının içindeki dosyaları görmek:
────────────────────────────────────────────────────────────────────────────────
$ dpkg --contents google-chrome-stable_current_amd64.deb | head -10

Çıktı:
drwxr-xr-x root/root         0 2023-01-15 10:30 ./
drwxr-xr-x root/root         0 2023-01-15 10:30 ./etc/
drwxr-xr-x root/root         0 2023-01-15 10:30 ./opt/
drwxr-xr-x root/root         0 2023-01-15 10:30 ./opt/google/
drwxr-xr-x root/root         0 2023-01-15 10:30 ./opt/google/chrome/
-rwxr-xr-x root/root   3456789 2023-01-15 10:30 ./opt/google/chrome/chrome
...
────────────────────────────────────────────────────────────────────────────────

╔══════════════════════════════════════════════════════════════════════════════╗
║                  🔧 5. DPKG-QUERY: GÜÇLÜ SORGULAMA ARACI                     ║
╚══════════════════════════════════════════════════════════════════════════════╝

dpkg-query, daha gelişmiş sorgulama imkanı sunar!

💻 Tüm kurulu paketleri güzel formatta listele:
────────────────────────────────────────────────────────────────────────────────
$ dpkg-query -l

(dpkg -l ile aynı çıktıyı verir)
────────────────────────────────────────────────────────────────────────────────

💻 Özel format ile listeleme:
────────────────────────────────────────────────────────────────────────────────
$ dpkg-query -W -f='${Package} ${Installed-Size} KB\n' | sort -k2 -n | tail -5

Çıktı (en büyük 5 paket):
libreoffice-core 185234 KB
thunderbird 198456 KB
linux-modules-5.15 234567 KB
google-chrome-stable 298456 KB
docker-ce 456789 KB
────────────────────────────────────────────────────────────────────────────────

💻 Belirli bir pattern'e uyan paketleri bul:
────────────────────────────────────────────────────────────────────────────────
$ dpkg-query -W 'python3-*'

Çıktı:
python3-apt    2.3.0ubuntu2
python3-certifi    2020.6.20
python3-chardet    4.0.0
python3-pip    22.0.2
...
────────────────────────────────────────────────────────────────────────────────

🎯 PRATIK SENARYO: En çok yer kaplayan 10 paketi bul

────────────────────────────────────────────────────────────────────────────────
$ dpkg-query -W -f='${Installed-Size}\t${Package}\n' | sort -rn | head -10

Çıktı:
456789    docker-ce
298456    google-chrome-stable
234567    linux-modules-5.15.0-56-generic
198456    thunderbird
185234    libreoffice-core
...
────────────────────────────────────────────────────────────────────────────────

╔══════════════════════════════════════════════════════════════════════════════╗
║                    💡 YENİ BAŞLAYANLAR İÇİN İPUÇLARI                         ║
╚══════════════════════════════════════════════════════════════════════════════╝

1. 🔍 HIZLI BİLGİ ALMA
   dpkg -s → Kurulu paket bilgisi (hızlı)
   dpkg -I → .deb dosya bilgisi (kurmadan önce)

2. 📂 DOSYA İLİŞKİLERİ
   dpkg -L PAKET → "Bu paket hangi dosyaları kurdu?"
   dpkg -S DOSYA → "Bu dosya hangi pakete ait?"

3. 🎯 SORUN GİDERME
   Program çalışmıyor?
   → which PROGRAM ile dosya yolunu bul
   → dpkg -S DOSYA_YOLU ile paketi bul
   → dpkg -s PAKET ile paket durumunu kontrol et

4. 📊 SİSTEM ANALİZİ
   $ dpkg -l | wc -l                  # Toplam paket sayısı
   $ dpkg -l | grep "^ii" | wc -l    # Kurulu paket sayısı
   $ dpkg -l | grep "^rc" | wc -l    # Config kalıntıları

5. 💾 DISK KULLANIMI
   En çok yer kaplayan paketleri bulun:
   $ dpkg-query -W -f='${Installed-Size}\t${Package}\n' | sort -rn | head

╔══════════════════════════════════════════════════════════════════════════════╗
║                        🎓 KOMUT ÖZETİ                                        ║
╚══════════════════════════════════════════════════════════════════════════════╝

┌─────────────────────┬─────────────────────────────────────────────────┐
│ Komut               │ Açıklama                                        │
├─────────────────────┼─────────────────────────────────────────────────┤
│ dpkg -s PAKET       │ Kurulu paket bilgisi                            │
│ dpkg -L PAKET       │ Paketin kurduğu dosyalar                        │
│ dpkg -S DOSYA       │ Dosya hangi pakete ait?                         │
│ dpkg -I PAKET.deb   │ .deb dosya bilgisi (kurmadan)                   │
│ dpkg --contents .deb│ .deb içindeki dosyalar (kurmadan)               │
│ dpkg-query -W       │ Paket listesi (özel format)                     │
└─────────────────────┴─────────────────────────────────────────────────┘

─────────────────────────────────────────────────────────────────────────────────

🎯 SONRAKİ MODÜLDE: dpkg'nin gelişmiş özelliklerini öğreneceğiz!
   (dpkg-deb, paket yeniden yapılandırma, alternatif sistemler...)

💡 Şimdi deneyin:
   → dpkg -L bash | head
   → dpkg -S /bin/ls
   → dpkg -s firefox | grep Version

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🔙 Ana menüye dönmek için 'q' tuşuna basın
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
CONTENT_EOF
}
