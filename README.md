# 🐧 DPKG Paket Yöneticisi - İnteraktif Öğrenme Rehberi

[![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)](https://github.com/alibedirhan/DPKG-Konusu-Youtube-scripts)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Shell](https://img.shields.io/badge/shell-bash-orange.svg)](https://www.gnu.org/software/bash/)
[![Platform](https://img.shields.io/badge/platform-Debian%20%7C%20Ubuntu-red.svg)](https://www.debian.org/)

> Debian/Ubuntu tabanlı sistemler için etkileşimli DPKG öğrenme platformu. Tmux tabanlı çift panel arayüzü ile teori ve pratik bir arada!

## 📸 Ekran Görüntüsü

```
╔══════════════════════════════════════════════════════════════╗
║                     DPKG PAKET YÖNETİCİSİ                    ║
║                    İNTERAKTİF REHBERİ                        ║
║                                                              ║
║  Sol Panel: Rehber İçerik  │  Sağ Panel: Test Terminali     ║
╚══════════════════════════════════════════════════════════════╝

MODÜLLER:                          TEST TERMİNALİ
1. dpkg Temelleri ve APT Farkı     ╔════════════════════════╗
2. Temel dpkg Komutları            ║ Komutları test edin    ║
3. Paket Bilgi ve Sorgulama        ║ $ dpkg --list | head   ║
4. Gelişmiş dpkg Kullanımı         ║ $ dpkg -s firefox      ║
5. dpkg ile Sorun Giderme          ╚════════════════════════╝
6. 🎯 BİLGİ YARIŞMASI (Quiz)
```

---

## ✨ Özellikler

- 🎯 **5 Kapsamlı Modül**: Temel seviyeden ileri seviyeye dpkg eğitimi
- 📚 **İnteraktif Quiz**: 15 soruluk bilgi yarışması ile öğrenmenizi test edin
- 🖥️ **Çift Panel Arayüz**: Sol panelde rehber, sağ panelde test terminali
- 🎨 **Renkli Arayüz**: Kolay okunabilir, modern görünüm
- 🔄 **Otomatik Kurulum**: Eksik bağımlılıkları otomatik kurar
- 🐚 **Shell Uyumlu**: Bash, Zsh, Fish - tüm shell'leri destekler
- 🖱️ **Fare Desteği**: Tmux mouse mode ile kolay navigasyon
- 📱 **Modüler Yapı**: Her modül ayrı dosyada, kolay güncelleme
- 📋 **Kolay Kopyalama**: SHIFT+Fare ile komutları kopyalayın

---

## 🚀 Hızlı Başlangıç

### Gereksinimler
- Debian/Ubuntu tabanlı Linux dağıtımı
- Bash 4.0+
- Git

### Kurulum

```bash
# Repository'yi klonlayın
git clone https://github.com/alibedirhan/DPKG-Konusu-Youtube-scripts.git
cd DPKG-Konusu-Youtube-scripts

# Scripti çalıştırılabilir yapın
chmod +x dpkg_rehber.sh

# Çalıştırın (bağımlılıklar otomatik kurulur)
./dpkg_rehber.sh
```

### ⚡ Tek Komutla Kurulum

```bash
git clone https://github.com/alibedirhan/DPKG-Konusu-Youtube-scripts.git && cd DPKG-Konusu-Youtube-scripts && chmod +x dpkg_rehber.sh && ./dpkg_rehber.sh
```

**İlk çalıştırmada ne olur?**
1. ✅ Sistem kontrolleri yapılır
2. ✅ Eksik bağımlılıklar (tmux, less) otomatik kurulur
3. ✅ Modül dosyaları kontrol edilir
4. ✅ Tmux oturumu başlatılır

---

## 📚 Modül İçeriği

### Modül 1: dpkg Temelleri ve APT ile Farkı
- dpkg nedir?
- .deb paket formatı
- dpkg vs APT farkları
- Bağımlılık yönetimi
- dpkg veritabanı (/var/lib/dpkg/)
- Durum kodları (ii, rc, vb.)

### Modül 2: Temel dpkg Komutları
- Paket kurma (`dpkg -i`)
- Paket kaldırma (`remove` vs `purge`)
- Paket listeleme (`dpkg -l`)
- Çok paket işlemleri
- Yeniden yapılandırma (`--configure -a`)
- Pratik örnekler ve senaryolar

### Modül 3: Paket Bilgi ve Sorgulama
- Paket durum bilgisi (`dpkg -s`)
- Paket dosyalarını görüntüleme (`dpkg -L`)
- Dosya arama (`dpkg -S`)
- .deb bilgisi (`dpkg -I`)
- dpkg-query kullanımı
- Disk kullanım analizi

### Modül 4: Gelişmiş dpkg Kullanımı
- dpkg-deb ile paket oluşturma
- Alternatif sistemi (update-alternatives)
- Paket tutma (hold/unhold)
- Bağımlılık analizi
- Veritabanı detaylı inceleme
- md5sum kontrolü

### Modül 5: dpkg ile Sorun Giderme
- dpkg kilitlenme sorunu (lock)
- Bozuk bağımlılık çözümü
- Yarım kurulmuş paketler
- status dosyası onarımı
- Eksik/bozuk dosya kurtarma
- Acil durum komutları

### Modül 6: Bilgi Yarışması 🎯
- 15 interaktif soru
- Anında geri bildirim
- Yanlış cevaplar analizi
- Detaylı açıklamalar
- Başarı puanlaması

---

## 🎮 Kullanım

### Temel Kontroller

| Komut | İşlev |
|-------|-------|
| `1-5` | Modül seçimi |
| `6` | Quiz modülü |
| `0` | Menüden çık (terminal aktif kalır) |
| `x` | Tümünü kapat (session sonlandır) |
| `q` | Modül içinde ana menüye dön |

### Kopyalama İpuçları

| İşlem | Nasıl Yapılır |
|-------|---------------|
| Komut kopyala | `SHIFT+Fare` ile seç |
| Kopyala | `Ctrl+Shift+C` |
| Yapıştır | `Ctrl+Shift+V` |
| Panel değiştir | Fareyle tıkla (SHIFT olmadan) |

### Tmux Kontrolleri

| Kısayol | İşlev |
|---------|-------|
| `Fare tıklama` | Panel değiştirme |
| `Fare sürükleme` | Panel boyutu ayarlama |
| `Ctrl+B → ←→` | Klavye ile panel geçişi |
| `Ctrl+B → d` | Session'dan ayrıl (arka plan) |
| `Ctrl+B → [` | Scroll mode (↑↓ ile gezin, q ile çık) |

### Geri Dönme
```bash
# Session arka planda çalışıyorsa
tmux ls  # Aktif session'ları listele
tmux attach -t dpkg_<PID>  # Geri dön
```

---

## 🏗️ Proje Yapısı

```
DPKG-Konusu-Youtube-scripts/
├── dpkg_rehber.sh         # Ana script (tmux yöneticisi)
├── welcome.sh             # Test terminali karşılama ekranı
├── modules/               # Modül dosyaları
│   ├── module_01.sh       # dpkg Temelleri ve APT Farkı
│   ├── module_02.sh       # Temel dpkg Komutları
│   ├── module_03.sh       # Paket Bilgi ve Sorgulama
│   ├── module_04.sh       # Gelişmiş dpkg Kullanımı
│   ├── module_05.sh       # dpkg ile Sorun Giderme
│   └── module_quiz.sh     # Bilgi Yarışması
├── README.md              # Bu dosya
├── INSTALL.md             # Detaylı kurulum kılavuzu
├── CONTRIBUTING.md        # Katkı rehberi
├── CHANGELOG.md           # Değişiklik geçmişi
└── LICENSE                # MIT Lisansı
```

---

## 🔧 Sorun Giderme

### "can't find pane" Hatası
```bash
# Eski tmux session'larını temizle
tmux kill-server
./dpkg_rehber.sh
```

### "modules/ klasörü bulunamadı" Hatası
```bash
# Tam repo'yu klonladığınızdan emin olun
git clone https://github.com/alibedirhan/DPKG-Konusu-Youtube-scripts.git
cd DPKG-Konusu-Youtube-scripts/
ls modules/  # Modülleri kontrol et
```

### Bağımlılık Kurulum Hatası
```bash
# Manuel kurulum
sudo apt update
sudo apt install tmux less
```

### Türkçe Karakter Sorunu
```bash
# Locale ayarlarını kontrol edin
locale  # LC_ALL ve LANG değerlerini kontrol et
export LANG=tr_TR.UTF-8  # Gerekirse ayarlayın
```

### Kopyalama Çalışmıyor
```bash
# SHIFT tuşuna basılı tutarak fareyle seçim yapın
# Sonra Ctrl+Shift+C ile kopyalayın
```

---

## 🤝 Katkıda Bulunma

Katkılarınızı bekliyoruz! Lütfen [CONTRIBUTING.md](CONTRIBUTING.md) dosyasını okuyun.

**Katkı alanları:**
- 🐛 Hata düzeltmeleri
- ✨ Yeni özellikler
- 📝 Dokümantasyon iyileştirmeleri
- 🌍 Çeviri (İngilizce versiyonu)
- 🎨 Arayüz geliştirmeleri

---

## 📝 Lisans

Bu proje MIT Lisansı altında lisanslanmıştır. Detaylar için [LICENSE](LICENSE) dosyasına bakın.

---

## 👨‍💻 Yazar

**Ali Bedirhan**
- GitHub: [@alibedirhan](https://github.com/alibedirhan)
- YouTube: [https://www.youtube.com/@alibedirhan.](https://www.youtube.com/@alibedirhan.)

---

## 🙏 Teşekkürler

- Debian/Ubuntu topluluğuna paket yönetim sistemleri için
- Tmux geliştiricilerine harika terminal multiplexer için
- Tüm katkıda bulunanlara

---

## 📊 İstatistikler

- ⭐ Star'layarak destek olun!
- 🍴 Fork'layarak geliştirin!
- 🐛 Issue açarak hata bildirin!

---

## 🔗 Bağlantılar

- [Debian dpkg Dökümantasyonu](https://man7.org/linux/man-pages/man1/dpkg.1.html)
- [Ubuntu Paket Yönetimi](https://help.ubuntu.com/community/Dpkg)
- [Tmux Kullanım Kılavuzu](https://github.com/tmux/tmux/wiki)

---

**⚡ Hızlı Başla:** `git clone https://github.com/alibedirhan/DPKG-Konusu-Youtube-scripts.git && cd DPKG-Konusu-Youtube-scripts && chmod +x dpkg_rehber.sh && ./dpkg_rehber.sh`

**📺 Video Eğitim:** [https://www.youtube.com/@alibedirhan.](https://www.youtube.com/@alibedirhan.)

---

<div align="center">

**Beğendiniz mi? ⭐ Star vermeden gitmeyin!**

Made with ❤️ for the Linux community

</div>