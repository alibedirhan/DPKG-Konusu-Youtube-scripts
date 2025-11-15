#!/bin/bash

show_module_04() {
    cat << 'CONTENT_EOF'

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📖 Navigasyon: ↑↓ ok tuşları | Space=sayfa aşağı | q=çıkış
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

💡 Komut Kopyalama: SHIFT+Fare ile seç → Ctrl+Shift+C/V

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

╔══════════════════════════════════════════════════════════════════════════════╗
║                  MODÜL 4: GELİŞMİŞ DPKG KULLANIMI                            ║
║                    (İleri Seviye Özellikler)                                 ║
╚══════════════════════════════════════════════════════════════════════════════╝

🟣 GİRİŞ

Bu modülde dpkg'nin daha az bilinen ama güçlü özelliklerini öğreneceksiniz.
Yeni başlayanlar için bazı konular biraz teknik gelebilir, ama merak etmeyin -
her şeyi örneklerle açıklıyoruz! 💪

╔══════════════════════════════════════════════════════════════════════════════╗
║                    🔧 1. DPKG-DEB: PAKET OLUŞTURMA ARACI                     ║
╚══════════════════════════════════════════════════════════════════════════════╝

dpkg-deb, .deb paketleri ile çalışmak için özel bir araçtır.

💻 .deb paketinin içini açmak (extract):
────────────────────────────────────────────────────────────────────────────────
$ dpkg-deb -x paket.deb dizin/

Örnek:
$ mkdir chrome-extracted
$ dpkg-deb -x google-chrome-stable.deb chrome-extracted/
$ ls chrome-extracted/
etc/  opt/  usr/
────────────────────────────────────────────────────────────────────────────────

Şimdi paketin tüm dosyalarını görebilirsiniz! 📂

💻 .deb paketinin kontrol dosyalarını ayıklamak:
────────────────────────────────────────────────────────────────────────────────
$ dpkg-deb -e paket.deb DEBIAN/

Bu komut control, postinst, prerm gibi script'leri çıkarır.
────────────────────────────────────────────────────────────────────────────────

💻 .deb paketi oluşturmak (kendi paketinizi yapın!):
────────────────────────────────────────────────────────────────────────────────
$ dpkg-deb --build dizin/ paket.deb

Örnek senaryo: Basit bir paket oluşturalım
────────────────────────────────────────────────────────────────────────────────
$ mkdir -p mypackage/DEBIAN
$ mkdir -p mypackage/usr/bin

$ cat > mypackage/DEBIAN/control << EOF
Package: my-hello-world
Version: 1.0
Architecture: all
Maintainer: Your Name <you@example.com>
Description: My first Debian package
 This is a simple hello world program.
EOF

$ cat > mypackage/usr/bin/hello << 'EOF'
#!/bin/bash
echo "Hello from my custom package!"
EOF

$ chmod +x mypackage/usr/bin/hello
$ dpkg-deb --build mypackage my-hello-world_1.0_all.deb

Paketiniz hazır! Şimdi kurabilirsiniz:
$ sudo dpkg -i my-hello-world_1.0_all.deb
$ hello
Hello from my custom package!
────────────────────────────────────────────────────────────────────────────────

🎯 NEDEN BUNU ÖĞRENMELİYİZ?

• Kendi özel scriptlerinizi paket haline getirmek
• Şirket içi araçları dağıtmak
• dpkg'nin nasıl çalıştığını anlamak

╔══════════════════════════════════════════════════════════════════════════════╗
║              🔄 2. ALTERNATİF SİSTEMİ (update-alternatives)                  ║
╚══════════════════════════════════════════════════════════════════════════════╝

Linux'ta aynı işi yapan birden fazla program olabilir. Örneğin:
• Python: python2, python3, python3.10, python3.11
• Editor: vim, nano, emacs
• Java: openjdk-11, openjdk-17

Hangisini kullanacağınızı "alternatives" sistemi yönetir!

💻 Mevcut alternatifleri görmek:
────────────────────────────────────────────────────────────────────────────────
$ update-alternatives --list editor

Çıktı:
/bin/nano
/usr/bin/vim.basic
/usr/bin/vim.tiny
────────────────────────────────────────────────────────────────────────────────

💻 Aktif alternatifi görmek:
────────────────────────────────────────────────────────────────────────────────
$ update-alternatives --display editor

Çıktı:
editor - auto mode
  link best version is /usr/bin/vim.basic
  link currently points to /usr/bin/vim.basic
  link editor is /usr/bin/editor
/bin/nano - priority 40
/usr/bin/vim.basic - priority 50
/usr/bin/vim.tiny - priority 15
────────────────────────────────────────────────────────────────────────────────

💻 Varsayılan editörü değiştirmek:
────────────────────────────────────────────────────────────────────────────────
$ sudo update-alternatives --config editor

Çıktı:
There are 3 choices for the alternative editor.

  Selection    Path                Priority   Status
------------------------------------------------------------
* 0            /usr/bin/vim.basic   50        auto mode
  1            /bin/nano            40        manual mode
  2            /usr/bin/vim.basic   50        manual mode
  3            /usr/bin/vim.tiny    15        manual mode

Press <enter> to keep the current choice[*], or type selection number: 1
────────────────────────────────────────────────────────────────────────────────

Artık sistem nano'yu varsayılan editör olarak kullanacak! ✨

🎯 GERÇEK HAYAT KULLANIMI: Python versiyonları

────────────────────────────────────────────────────────────────────────────────
$ python --version
Python 3.10.6

Ama sistem 3.11 de kurulu. Varsayılanı değiştirelim:
$ sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.11 2
$ sudo update-alternatives --config python
$ python --version
Python 3.11.0
────────────────────────────────────────────────────────────────────────────────

╔══════════════════════════════════════════════════════════════════════════════╗
║                  🔐 3. PAKET TUTMA (HOLD/UNHOLD)                             ║
╚══════════════════════════════════════════════════════════════════════════════╝

Bazen bir paketin güncellenmesini istemezsiniz (çünkü yeni versiyon sorunlu).
Çözüm: Paketi "tutmak" (hold)!

💻 Paketi hold yapmak:
────────────────────────────────────────────────────────────────────────────────
$ sudo apt-mark hold firefox

Artık "sudo apt upgrade" bile firefox'u güncellemez!
────────────────────────────────────────────────────────────────────────────────

💻 Hold edilen paketleri görmek:
────────────────────────────────────────────────────────────────────────────────
$ apt-mark showhold

Çıktı:
firefox
nginx
────────────────────────────────────────────────────────────────────────────────

💻 Hold'u kaldırmak:
────────────────────────────────────────────────────────────────────────────────
$ sudo apt-mark unhold firefox
────────────────────────────────────────────────────────────────────────────────

🎯 DPKG İLE DE YAPABİLİRİZ:

────────────────────────────────────────────────────────────────────────────────
$ echo "firefox hold" | sudo dpkg --set-selections
$ dpkg --get-selections | grep hold
firefox                     hold

Kaldırmak için:
$ echo "firefox install" | sudo dpkg --set-selections
────────────────────────────────────────────────────────────────────────────────

⚠️  NE ZAMAN KULLANILIR?

• Test sunucularında belirli versiyon kilitlemek
• Kritik paketlerde kararlılık sağlamak
• Bozuk güncellemeden kaçınmak

╔══════════════════════════════════════════════════════════════════════════════╗
║                  📊 4. PAKET BAĞIMLILIK ANALİZİ                              ║
╚══════════════════════════════════════════════════════════════════════════════╝

💻 Bir paketin tüm bağımlılıklarını görmek:
────────────────────────────────────────────────────────────────────────────────
$ dpkg -s firefox | grep Depends

Çıktı:
Depends: libc6 (>= 2.34), libgtk-3-0 (>= 3.22), libdbus-1-3 (>= 1.9.14)
────────────────────────────────────────────────────────────────────────────────

💻 Hangi paketler bu pakete bağımlı? (Ters bağımlılık):
────────────────────────────────────────────────────────────────────────────────
$ apt-cache rdepends libc6 | head -10

Çıktı:
libc6
Reverse Depends:
  firefox
  chromium-browser
  vlc
  gimp
  ...
────────────────────────────────────────────────────────────────────────────────

💻 Paket silmeden önce bağımlılık kontrolü:
────────────────────────────────────────────────────────────────────────────────
$ sudo dpkg --simulate --remove libc6

UYARI: libc6 temel bir kütüphanedir! Asla silmeyin!
Simülasyon modu ile test edin: --simulate veya --dry-run
────────────────────────────────────────────────────────────────────────────────

╔══════════════════════════════════════════════════════════════════════════════╗
║                    🔍 5. VERİTABANI DETAYLI İNCELEME                         ║
╚══════════════════════════════════════════════════════════════════════════════╝

💻 dpkg veritabanı dosyalarının konumu:
────────────────────────────────────────────────────────────────────────────────
$ ls -lh /var/lib/dpkg/

Çıktı:
-rw-r--r-- 1 root root  45M /var/lib/dpkg/status
-rw-r--r-- 1 root root  12M /var/lib/dpkg/available
drwxr-xr-x 2 root root 128K /var/lib/dpkg/info/
drwxr-xr-x 2 root root 4.0K /var/lib/dpkg/updates/
────────────────────────────────────────────────────────────────────────────────

📂 ÖNEMLİ DOSYALAR:

• status → Tüm kurulu paketlerin durumu (ÇOK KRİTİK!)
• info/  → Her paketin .list, .md5sums, .conffiles dosyaları
• available → Mevcut tüm paketler (depolardan)

💻 Bir paketin md5sum kontrolü:
────────────────────────────────────────────────────────────────────────────────
$ md5sum -c /var/lib/dpkg/info/bash.md5sums

Çıktı:
/bin/bash: OK
/bin/rbash: OK
/etc/bash.bashrc: OK
...
────────────────────────────────────────────────────────────────────────────────

Eğer bir dosya değiştirilmişse, md5sum uyuşmaz → Paket bozulmuş demektir!

╔══════════════════════════════════════════════════════════════════════════════╗
║                    💡 YENİ BAŞLAYANLAR İÇİN İPUÇLARI                         ║
╚══════════════════════════════════════════════════════════════════════════════╝

1. 📦 PAKET OLUŞTURMA
   dpkg-deb ile kendi paketinizi yapabilirsiniz!
   Şirket içi araçlar için çok kullanışlı.

2. 🔄 ALTERNATİFLER
   update-alternatives --config KOMUT
   → Python, Java, Editor gibi alternatifleri değiştirin

3. 🔒 PAKET TUTMA
   Kritik paketleri güncellemeden koruyun:
   sudo apt-mark hold PAKET

4. 🧪 TEST MODU
   Tehlikeli işlemleri önce test edin:
   dpkg --simulate --remove PAKET

5. 📊 VERİTABANI
   /var/lib/dpkg/ → dpkg'nin beyni burada!
   ASLA elle düzenlemeyin!

╔══════════════════════════════════════════════════════════════════════════════╗
║                          📝 KOMUT ÖZETİ                                      ║
╚══════════════════════════════════════════════════════════════════════════════╝

┌──────────────────────────┬─────────────────────────────────────────────┐
│ Komut                    │ Açıklama                                    │
├──────────────────────────┼─────────────────────────────────────────────┤
│ dpkg-deb -x .deb dizin/  │ Paketi dizine ayıkla                        │
│ dpkg-deb --build dizin/  │ Dizinden paket oluştur                      │
│ update-alternatives      │ Alternatif programları yönet                │
│ apt-mark hold PAKET      │ Paketi güncellemeye karşı kilitle           │
│ dpkg --simulate          │ İşlemi test et (gerçekten yapma)            │
└──────────────────────────┴─────────────────────────────────────────────┘

─────────────────────────────────────────────────────────────────────────────────

🎯 SONRAKİ MODÜLDE: Sorun giderme teknikleri öğreneceğiz!
   (Kilitlenme, bozuk paketler, onarım yöntemleri...)

💡 Şimdi deneyin:
   → update-alternatives --list editor
   → apt-mark showhold


━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🔙 Ana menüye dönmek için 'q' tuşuna basın
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
CONTENT_EOF
}
