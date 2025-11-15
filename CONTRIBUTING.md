# 🤝 Katkıda Bulunma Rehberi

DPKG İnteraktif Rehberi projesine katkıda bulunmak istediğiniz için teşekkürler! Bu dokümman, katkı sürecini kolaylaştırmak için hazırlanmıştır.

---

## 📋 İçindekiler

- [Davranış Kuralları](#davranış-kuralları)
- [Nasıl Katkıda Bulunabilirim?](#nasıl-katkıda-bulunabilirim)
- [Geliştirme Süreci](#geliştirme-süreci)
- [Kod Standartları](#kod-standartları)
- [Commit Mesajları](#commit-mesajları)
- [Pull Request Süreci](#pull-request-süreci)

---

## 📜 Davranış Kuralları

### Değerlerimiz

- 🤝 Saygılı ve kapsayıcı olun
- 💬 Yapıcı geri bildirim verin
- 🎯 Probleme odaklanın, kişiye değil
- 🌍 Farklı bakış açılarına açık olun

### Kabul Edilemez Davranışlar

- ❌ Aşağılayıcı, hakaret içeren veya ayrımcı yorumlar
- ❌ Kişisel saldırılar
- ❌ Spam veya reklam
- ❌ Başkalarının özel bilgilerini paylaşma

---

## 🎯 Nasıl Katkıda Bulunabilirim?

### 1. 🐛 Hata Bildirimi

Bir hata buldunuz mu? Şu adımları izleyin:

**Adım 1:** Hata daha önce bildirilmiş mi kontrol edin
- [Issues](https://github.com/alibedirhan/DPKG-Konusu-Youtube-scripts/issues) sayfasını inceleyin

**Adım 2:** Yeni bir issue açın
- Açıklayıcı bir başlık kullanın
- Hatayı yeniden oluşturma adımlarını yazın
- Beklenen ve gerçekleşen davranışı belirtin
- Sistem bilgilerinizi ekleyin (Ubuntu/Debian versiyonu, bash versiyonu)

**Örnek Issue:**
```markdown
**Başlık:** Quiz modülünde yanlış cevap kaydı çalışmıyor

**Açıklama:**
Quiz'de yanlış cevap verdiğimde, sonuç ekranında "Yanlış sorular ve çözümleri" bölümü boş görünüyor.

**Adımlar:**
1. dpkg_rehber.sh çalıştırıldı
2. Modül 6 (Quiz) seçildi
3. Soru 3'te yanlış cevap verildi
4. Quiz tamamlandı
5. Sonuç ekranında seçenek [2] seçildi
6. Hiçbir soru gösterilmedi

**Beklenen:** Yanlış cevaplanan sorular ve açıklamaları gösterilmeli
**Gerçekleşen:** Boş ekran

**Sistem:**
- Ubuntu 22.04 LTS
- Bash 5.1.16
- tmux 3.2a
```

### 2. ✨ Özellik İsteği

Yeni bir özellik mi istiyorsunuz?

**Adım 1:** Önce tartışma başlatın
- Issue açarak fikrinizi paylaşın
- Neden gerekli olduğunu açıklayın
- Nasıl çalışacağını detaylandırın

**Örnek:**
```markdown
**Başlık:** [Özellik] Modül ilerlemesini kaydetme

**Açıklama:**
Kullanıcıların hangi modülleri tamamladığını takip eden bir sistem.

**Motivasyon:**
Kullanıcılar programı kapatıp açtıklarında nereden devam ettiklerini bilmiyorlar.

**Önerilen Çözüm:**
- ~/.dpkg_rehber_progress dosyasına kayıt
- Ana menüde tamamlanan modüller ✅ işareti ile gösterilsin
- "Kaldığın yerden devam et" seçeneği eklensin

**Alternatifler:**
- Session bazlı geçici kayıt
- Sadece quiz sonuçlarını kaydetme
```

### 3. 📝 Dokümantasyon

- README.md iyileştirmeleri
- Modül içi açıklamalar
- Yorum satırları ekleme
- Türkçe dilbilgisi düzeltmeleri
- İngilizce çeviri

### 4. 🎨 Tasarım İyileştirmeleri

- Arayüz renkleri
- Emoji kullanımı
- ASCII art iyileştirmeleri
- Tablo düzenleri

### 5. 🔧 Kod İyileştirmeleri

- Performans optimizasyonu
- Kod temizliği (refactoring)
- Shell script best practices
- Hata yönetimi

---

## 🔨 Geliştirme Süreci

### Adım 1: Fork Edin

```bash
# GitHub'da "Fork" butonuna tıklayın
# Sonra kendi fork'unuzu klonlayın
git clone https://github.com/KULLANICI_ADINIZ/DPKG-Konusu-Youtube-scripts.git
cd DPKG-Konusu-Youtube-scripts
```

### Adım 2: Branch Oluşturun

```bash
# Ana branch'ten yeni branch oluşturun
git checkout -b feature/yeni-ozellik

# veya hata düzeltmesi için
git checkout -b bugfix/hata-adi
```

**Branch İsimlendirme:**
- `feature/` - Yeni özellikler
- `bugfix/` - Hata düzeltmeleri
- `docs/` - Dokümantasyon
- `refactor/` - Kod iyileştirmeleri

### Adım 3: Değişikliklerinizi Yapın

```bash
# Değişikliklerinizi yapın
nano modules/module_01.sh

# Test edin
./dpkg_rehber.sh
```

### Adım 4: Test Edin

**Test Listesi:**
- [ ] Script çalışıyor mu?
- [ ] Tmux session düzgün açılıyor mu?
- [ ] Tüm modüller okunabiliyor mu?
- [ ] Quiz çalışıyor mu?
- [ ] Navigasyon düzgün çalışıyor mu?
- [ ] Kopyalama (Shift+Fare) çalışıyor mu?
- [ ] Türkçe karakterler doğru görünüyor mu?

### Adım 5: Commit Edin

```bash
# Değişiklikleri stage'e alın
git add modules/module_01.sh

# Commit edin (aşağıdaki kurallara uyun)
git commit -m "feat: dpkg vs APT karşılaştırma tablosu eklendi"
```

### Adım 6: Push Edin

```bash
git push origin feature/yeni-ozellik
```

### Adım 7: Pull Request Açın

1. GitHub'da fork'unuza gidin
2. "Pull Request" butonuna tıklayın
3. Değişikliklerinizi açıklayın
4. İnceleme bekleyin

---

## 📏 Kod Standartları

### Shell Script Kuralları

**1. Shebang ve başlıklar:**
```bash
#!/bin/bash

# Modül Adı - Kısa Açıklama
# Version: X.Y
# Son Güncelleme: YYYY-MM-DD
```

**2. Değişken isimlendirme:**
```bash
# Büyük harf - sabit değerler
MODULES_DIR="modules"
TEMP_DIR="/tmp/dpkg_$$"

# Küçük harf - yerel değişkenler
local user_choice=""
local question_number=1
```

**3. Fonksiyon isimlendirme:**
```bash
# Alt çizgi ile ayrılmış, açıklayıcı
check_dependencies() {
    # kod
}

show_module_01() {
    # kod
}
```

**4. Hata kontrolü:**
```bash
# Her önemli komuttan sonra
if ! command -v tmux &> /dev/null; then
    echo "Hata: tmux bulunamadı"
    return 1
fi
```

**5. Yorum satırları:**
```bash
# Türkçe yorum - ne yaptığını açıkla
# İyi örnek:
# Kullanıcının seçimini al ve doğrula
read -r user_choice

# Kötü örnek:
# Read
read -r user_choice
```

### Modül Yapısı

Her modül şu yapıda olmalı:

```bash
#!/bin/bash

show_module_0X() {
    cat << 'CONTENT_EOF'

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📖 Navigasyon: ↑↓ ok tuşları | Space=sayfa aşağı | q=çıkış
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

💡 Komut Kopyalama: SHIFT+Fare ile seç → Ctrl+Shift+C/V

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

╔══════════════════════════════════════════════════════════════════╗
║                        MODÜL X: BAŞLIK                           ║
╚══════════════════════════════════════════════════════════════════╝

[İçerik buraya]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🔙 Ana menüye dönmek için 'q' tuşuna basın
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

CONTENT_EOF
}
```

### Renkler ve Formatlar

```bash
# Renkler - sabitleri kullanın
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'  # No Color

# Kullanım
echo -e "${GREEN}✅ Başarılı${NC}"
echo -e "${RED}❌ Hata${NC}"
```

---

## 📝 Commit Mesajları

### Format

```
<tip>: <kısa açıklama>

<detaylı açıklama (opsiyonel)>
```

### Tipler

- `feat` - Yeni özellik
- `fix` - Hata düzeltmesi
- `docs` - Dokümantasyon
- `style` - Formatla (kod değişimi yok)
- `refactor` - Kod iyileştirme
- `test` - Test ekleme
- `chore` - Bakım işleri

### Örnekler

```bash
# İyi örnekler
git commit -m "feat: quiz modülüne zamanlayıcı eklendi"
git commit -m "fix: module_03'te Türkçe karakter sorunu düzeltildi"
git commit -m "docs: INSTALL.md'ye offline kurulum eklendi"

# Kötü örnekler
git commit -m "düzeltme"
git commit -m "güncelleme yaptım"
git commit -m "WIP"
```

---

## 🔄 Pull Request Süreci

### PR Şablonu

```markdown
## Değişiklik Türü
- [ ] Hata düzeltmesi (bugfix)
- [ ] Yeni özellik (feature)
- [ ] Dokümantasyon (docs)
- [ ] Kod iyileştirme (refactor)

## Açıklama
[Ne değişti ve neden?]

## Test Edildi
- [ ] Ubuntu 22.04
- [ ] Ubuntu 20.04
- [ ] Debian 11
- [ ] Tüm modüller çalışıyor
- [ ] Quiz çalışıyor

## Ekran Görüntüleri (varsa)
[Ekleyin]

## İlgili Issue
Closes #123
```

### İnceleme Süreci

1. **Otomatik kontroller** yapılır
2. **Kod inceleme** - bakıcılar kodu inceler
3. **Test** - değişiklikler test edilir
4. **Tartışma** - gerekirse iyileştirmeler yapılır
5. **Merge** - onaylanırsa ana branch'e eklenir

### Değişiklik İstekleri

Bakıcılar değişiklik isterse:

```bash
# Değişiklikleri yapın
nano module_01.sh

# Commit edin
git add module_01.sh
git commit -m "fix: inceleme önerileri uygulandı"

# Push edin
git push origin feature/yeni-ozellik
```

---

## 🎁 Katkı Fikirleri

### Kolay Başlangıç (Good First Issue)

- 📝 Yazım hatalarını düzeltme
- 🎨 Emoji iyileştirmeleri
- 📖 Dokümantasyon güncellemeleri
- 🌍 README çevirisi (İngilizce)

### Orta Seviye

- ✨ Yeni örnekler ekleme
- 🔧 Hata düzeltmeleri
- 📊 Yeni quiz soruları
- 🎯 Kullanılabilirlik iyileştirmeleri

### İleri Seviye

- 🚀 Performans optimizasyonları
- 🏗️ Mimari iyileştirmeler
- 🔐 Güvenlik güncellemeleri
- 🌐 Çoklu dil desteği

---

## 📞 İletişim

- **GitHub Issues**: [Sorun bildirin](https://github.com/alibedirhan/DPKG-Konusu-Youtube-scripts/issues)
- **Pull Requests**: [Katkı gönderin](https://github.com/alibedirhan/DPKG-Konusu-Youtube-scripts/pulls)
- **Email**: [GitHub profilinizde]

---

## 🙏 Teşekkürler!

Her türlü katkı değerlidir! Zamanınızı ve çabanızı ayırdığınız için teşekkürler! 🎉

---

**Mutlu kodlamalar! 💻**
