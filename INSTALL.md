# 📦 DPKG İnteraktif Rehberi - Detaylı Kurulum Kılavuzu

Bu kılavuz, DPKG İnteraktif Rehberi'ni farklı senaryolarda nasıl kuracağınızı adım adım anlatmaktadır.

---

## 📋 İçindekiler

- [Gereksinimler](#gereksinimler)
- [Hızlı Kurulum](#hızlı-kurulum)
- [Detaylı Kurulum](#detaylı-kurulum)
- [Manuel Kurulum](#manuel-kurulum)
- [Farklı Kurulum Senaryoları](#farklı-kurulum-senaryoları)
- [Sorun Giderme](#sorun-giderme)
- [Kaldırma](#kaldırma)

---

## 🔍 Gereksinimler

### Minimum Sistem Gereksinimleri

- **İşletim Sistemi**: Debian, Ubuntu, Linux Mint veya türevi
- **Bash**: 4.0 veya üzeri
- **Disk Alanı**: En az 50 MB
- **RAM**: En az 512 MB
- **Terminal**: GNOME Terminal, Konsole, Terminator vb.

### Yazılım Bağımlılıkları

Aşağıdaki paketler gereklidir (otomatik kurulur):

- `tmux` >= 2.0
- `less` >= 530
- `git` (kurulum için)

### Kontrol Komutu

```bash
# Sistem bilgilerini kontrol edin
lsb_release -a

# Bash versiyonunu kontrol edin
bash --version

# Mevcut paketleri kontrol edin
dpkg -l | grep -E 'tmux|less'
```

---

## ⚡ Hızlı Kurulum

### Tek Satırda Kurulum

```bash
git clone https://github.com/alibedirhan/DPKG-Konusu-Youtube-scripts.git && cd DPKG-Konusu-Youtube-scripts && chmod +x dpkg_rehber.sh && ./dpkg_rehber.sh
```

**Bu komut:**
1. Repository'yi klonlar
2. Proje dizinine girer
3. Ana scripti çalıştırılabilir yapar
4. Programı başlatır

---

## 📚 Detaylı Kurulum

### Adım 1: Git Kurulumu (Eğer yoksa)

```bash
# Ubuntu/Debian
sudo apt update
sudo apt install git -y

# Git versiyonunu kontrol edin
git --version
```

### Adım 2: Repository'yi Klonlama

```bash
# Ana dizine gidin
cd ~

# Repository'yi klonlayın
git clone https://github.com/alibedirhan/DPKG-Konusu-Youtube-scripts.git

# Klonlama başarılı mı?
ls -l DPKG-Konusu-Youtube-scripts/
```

**Beklenen çıktı:**
```
total 32
-rwxr-xr-x 1 user user 5432 Nov 14 10:00 dpkg_rehber.sh
drwxr-xr-x 2 user user 4096 Nov 14 10:00 modules
-rwxr-xr-x 1 user user 1234 Nov 14 10:00 welcome.sh
-rw-r--r-- 1 user user 8765 Nov 14 10:00 README.md
```

### Adım 3: Proje Dizinine Gitme

```bash
cd DPKG-Konusu-Youtube-scripts
pwd  # Dizini doğrulayın
```

### Adım 4: İzinleri Ayarlama

```bash
# Ana scripti çalıştırılabilir yapın
chmod +x dpkg_rehber.sh

# Modülleri kontrol edin
ls -l modules/

# İzinleri doğrulayın
ls -l dpkg_rehber.sh
```

### Adım 5: İlk Çalıştırma

```bash
./dpkg_rehber.sh
```

**İlk çalıştırmada ne olur?**

1. Bağımlılık kontrolü yapılır
2. Eksik paketler tespit edilir
3. Otomatik kurulum önerisi sunulur
4. Onay verirseniz tmux ve less kurulur
5. Modüller kontrol edilir
6. Tmux oturumu başlatılır

**Örnek çıktı:**
```
╔══════════════════════════════════════════════════════════╗
║              DPKG PAKET YÖNETİCİSİ                       ║
║              İNTERAKTİF REHBERİ                          ║
╚══════════════════════════════════════════════════════════╝

Kontroller yapılıyor...
✅ Hazır!

DPKG İnteraktif Rehberine Hoş Geldiniz!

• Sol Panel: Rehber menüsü ve içerik
• Sağ Panel: Test terminali
• Panel değiştirme: Fareyle tıklayın veya Ctrl+B sonra ←→

Başlamak için Enter...
```

---

## 🛠️ Manuel Kurulum

### Elle Bağımlılık Kurulumu

Otomatik kurulum çalışmazsa:

```bash
# Paket listesini güncelleyin
sudo apt update

# tmux kurulumu
sudo apt install tmux -y

# less kurulumu (genellikle kurulu gelir)
sudo apt install less -y

# Kurulumu doğrulayın
tmux -V
less --version
```

### Manuel Modül Kontrolü

```bash
cd ~/DPKG-Konusu-Youtube-scripts

# Tüm modüllerin var olduğunu kontrol edin
for i in {1..5}; do
  if [[ -f "modules/module_0${i}.sh" ]]; then
    echo "✅ module_0${i}.sh mevcut"
  else
    echo "❌ module_0${i}.sh EKSIK!"
  fi
done

# Quiz modülünü kontrol edin
if [[ -f "modules/module_quiz.sh" ]]; then
  echo "✅ module_quiz.sh mevcut"
else
  echo "❌ module_quiz.sh EKSIK!"
fi
```

---

## 🎯 Farklı Kurulum Senaryoları

### Senaryo 1: İnternet Bağlantısı Olmadan Kurulum

**Adım 1:** Başka bir bilgisayarda repository'yi indirin

```bash
# İnternet olan bilgisayarda
git clone https://github.com/alibedirhan/DPKG-Konusu-Youtube-scripts.git
cd DPKG-Konusu-Youtube-scripts

# ZIP olarak paketleyin
cd ..
tar -czf dpkg-rehber.tar.gz DPKG-Konusu-Youtube-scripts/
```

**Adım 2:** USB ile hedef sisteme aktarın

```bash
# Hedef sistemde
cd ~
tar -xzf /media/usb/dpkg-rehber.tar.gz
cd DPKG-Konusu-Youtube-scripts
```

**Adım 3:** Bağımlılıkları manuel kurun

```bash
# tmux ve less .deb dosyalarını USB'de hazırlayın
# Sonra offline sistemde:
sudo dpkg -i tmux*.deb less*.deb
```

### Senaryo 2: Farklı Bir Dizine Kurulum

```bash
# İstediğiniz dizine gidin
cd /opt  # veya ~/Documents vb.

# Klonlayın
sudo git clone https://github.com/alibedirhan/DPKG-Konusu-Youtube-scripts.git

# İzinleri düzeltin
sudo chown -R $USER:$USER DPKG-Konusu-Youtube-scripts/
cd DPKG-Konusu-Youtube-scripts
chmod +x dpkg_rehber.sh
./dpkg_rehber.sh
```

### Senaryo 3: Çoklu Kullanıcı Sistemi

```bash
# Root olarak /usr/local dizinine kurun
sudo mkdir -p /usr/local/share/dpkg-rehber
sudo git clone https://github.com/alibedirhan/DPKG-Konusu-Youtube-scripts.git /usr/local/share/dpkg-rehber

# Tüm kullanıcılar için alias oluşturun
echo 'alias dpkg-rehber="cd /usr/local/share/dpkg-rehber && ./dpkg_rehber.sh"' | sudo tee -a /etc/bash.bashrc

# Yeni terminal açın ve çalıştırın
dpkg-rehber
```

### Senaryo 4: Sanal Makine / Container

```bash
# Docker container için
docker run -it ubuntu:22.04 bash
apt update && apt install git -y
git clone https://github.com/alibedirhan/DPKG-Konusu-Youtube-scripts.git
cd DPKG-Konusu-Youtube-scripts
./dpkg_rehber.sh
```

---

## 🔧 Sorun Giderme

### Sorun 1: "git: command not found"

**Çözüm:**
```bash
sudo apt update
sudo apt install git -y
```

### Sorun 2: "tmux: command not found"

**Çözüm:**
```bash
sudo apt update
sudo apt install tmux -y
```

### Sorun 3: "Permission denied"

**Çözüm:**
```bash
chmod +x dpkg_rehber.sh
# Veya
bash dpkg_rehber.sh
```

### Sorun 4: "modules/ directory not found"

**Çözüm:**
```bash
# Repository'nin tam klonlandığından emin olun
git clone https://github.com/alibedirhan/DPKG-Konusu-Youtube-scripts.git
cd DPKG-Konusu-Youtube-scripts
ls -la modules/

# Eğer eksikse, tekrar klonlayın
cd ..
rm -rf DPKG-Konusu-Youtube-scripts
git clone https://github.com/alibedirhan/DPKG-Konusu-Youtube-scripts.git
```

### Sorun 5: Tmux session açılmıyor

**Çözüm:**
```bash
# Eski session'ları temizleyin
tmux kill-server

# Tekrar deneyin
./dpkg_rehber.sh
```

### Sorun 6: Türkçe karakterler bozuk

**Çözüm:**
```bash
# Locale ayarlarını kontrol edin
locale

# TR locale yoksa kurun
sudo apt install language-pack-tr -y
sudo update-locale LANG=tr_TR.UTF-8

# Terminali yeniden başlatın
```

---

## 🗑️ Kaldırma

### Tam Kaldırma

```bash
# Proje dizinini silin
cd ~
rm -rf DPKG-Konusu-Youtube-scripts

# Tmux session'larını temizleyin
tmux kill-server

# (Opsiyonel) Bağımlılıkları kaldırın
sudo apt remove tmux -y
sudo apt autoremove -y
```

### Kısmi Kaldırma (Sadece Session)

```bash
# Sadece aktif tmux session'ı kapatın
tmux kill-session -t dpkg_$$
```

---

## 📝 Kurulum Sonrası

### Öneriler

1. **Alias Oluşturun:**
```bash
echo 'alias dpkg-rehber="cd ~/DPKG-Konusu-Youtube-scripts && ./dpkg_rehber.sh"' >> ~/.bashrc
source ~/.bashrc

# Artık her yerden çalıştırabilirsiniz
dpkg-rehber
```

2. **Desktop Kısayolu Oluşturun:**
```bash
cat > ~/.local/share/applications/dpkg-rehber.desktop << EOF
[Desktop Entry]
Name=DPKG İnteraktif Rehber
Comment=dpkg öğrenme aracı
Exec=gnome-terminal -- bash -c "cd ~/DPKG-Konusu-Youtube-scripts && ./dpkg_rehber.sh"
Icon=utilities-terminal
Type=Application
Categories=Education;Development;
EOF
```

3. **Güncellemeleri Takip Edin:**
```bash
cd ~/DPKG-Konusu-Youtube-scripts
git pull origin main
```

---

## ✅ Kurulum Tamamlandı!

Artık DPKG İnteraktif Rehberi'ni kullanmaya hazırsınız!

**Başlatmak için:**
```bash
cd ~/DPKG-Konusu-Youtube-scripts
./dpkg_rehber.sh
```

**Sorun yaşıyorsanız:**
- [GitHub Issues](https://github.com/alibedirhan/DPKG-Konusu-Youtube-scripts/issues) açın
- [README.md](README.md) dosyasını okuyun
- [CONTRIBUTING.md](CONTRIBUTING.md) dosyasına bakın

---

**İyi öğrenmeler! 🚀**
