# 🐧 DPKG İnteraktif Rehberi

Debian tabanlı Linux sistemleri (Ubuntu, Debian, Mint vb.) için **interaktif dpkg paket yöneticisi eğitim aracı**.

![dpkg](https://img.shields.io/badge/dpkg-Debian-red)
![tmux](https://img.shields.io/badge/tmux-required-green)
![license](https://img.shields.io/badge/license-MIT-blue)

## 🎯 Özellikler

- ✅ **Dual-Panel Sistem**: Sol tarafta eğitim, sağ tarafta test terminali
- ✅ **5 Kapsamlı Modül**: dpkg temellerinden sorun gidermeye
- ✅ **İnteraktif Quiz**: Öğrendiklerinizi test edin
- ✅ **Yeni Başlayanlar İçin**: Anlaşılır dil ve örnekler
- ✅ **Güvenli**: Sadece okuma komutları önerilir

## 📚 Modüller

1. **Modül 1**: dpkg Temelleri ve APT ile Farkı
2. **Modül 2**: Temel dpkg Komutları
3. **Modül 3**: Paket Bilgi ve Sorgulama
4. **Modül 4**: Gelişmiş dpkg Kullanımı
5. **Modül 5**: dpkg ile Sorun Giderme
6. **Quiz**: 15 soruluk bilgi yarışması

## 🚀 Kurulum ve Çalıştırma

### Gereksinimler

- Ubuntu/Debian tabanlı bir Linux sistemi
- `tmux` (otomatik kurulur)
- `bash` 4.0+

### Hızlı Başlangıç
```bash
# Repo'yu klonla
git clone https://github.com/alibedirhan/DPKG-Konusu-Youtube-scripts.git
cd DPKG-Konusu-Youtube-scripts

# Çalıştır
chmod +x dpkg_rehber.sh
./dpkg_rehber.sh
```

**Bu kadar!** Script otomatik olarak eksik bağımlılıkları kurar.

## 🎮 Kullanım

### Navigasyon

- **Sol Panel** (Rehber): `↑↓` ok tuşları, `Space` = sayfa aşağı, `q` = çıkış
- **Sağ Panel** (Test): Normal terminal gibi komut yazın
- **Panel Geçişi**: Fareyle tıklayın veya `Ctrl+B` sonra `←→`

### Kopyalama İpuçları

- **Komut kopyala**: `SHIFT+Fare` ile seç
- **Kopyala**: `Ctrl+Shift+C`
- **Yapıştır**: `Ctrl+Shift+V`
- **Panel değiştir**: Fareyle tıkla (SHIFT olmadan)

## 📖 Ekran Görüntüleri
```
┌─────────────────────┬─────────────────────┐
│  Sol Panel          │  Sağ Panel          │
│  📖 Eğitim İçeriği  │  💻 Test Terminali  │
│  (Teori + Örnekler) │  (Pratik)           │
└─────────────────────┴─────────────────────┘
```

## 🎥 YouTube Serisi

Bu script, YouTube'daki dpkg eğitim serisinin bir parçasıdır.

**Kanal**: [YouTube Kanalınız]  
**Playlist**: [Playlist Linki]

## 🤝 Katkıda Bulunma

1. Fork edin
2. Feature branch oluşturun (`git checkout -b feature/yeniOzellik`)
3. Commit edin (`git commit -m 'Yeni özellik eklendi'`)
4. Push edin (`git push origin feature/yeniOzellik`)
5. Pull Request açın

## 📝 Lisans

Bu proje MIT lisansı altında lisanslanmıştır.

## 👨‍💻 Geliştirici

**Ali Bedirhan**

- GitHub: [@alibedirhan](https://github.com/alibedirhan)
- YouTube: [Kanal Adınız]

## 🙏 Teşekkürler

Bu projeyi kullandığınız için teşekkürler! Eğer faydalı bulduysanız ⭐ vermeyi unutmayın!

---

**Not**: Bu script eğitim amaçlıdır. Production sistemlerde dikkatli kullanın.
