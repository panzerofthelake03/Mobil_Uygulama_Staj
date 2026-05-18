# Mini Katalog Uygulaması

Flutter ile geliştirilmiş bir ürün katalog mobil uygulaması. Ürünleri listeleme, detay görüntüleme ve sepete ekleme özelliklerini içerir.

## Kullanılan Flutter Sürümü

Flutter 3.x (Dart >=3.0.0)

## Özellikler

- Ana sayfa: banner, arama çubuğu ve GridView ürün listesi
- Ürün detayı: görsel, açıklama, teknik özellikler
- Sepet: ürün ekleme/çıkarma, toplam fiyat, checkout
- Gerçek zamanlı arama/filtreleme
- API'den veri çekme (bağlantı yoksa mock veri)
- Named Routes ile sayfa navigasyonu

## Kurulum Adımları

### 1. Flutter projesini başlat (platform dosyaları için)

```bash
cd mini_katalog
flutter create . --org com.example --project-name mini_katalog
```

> Bu komut mevcut `lib/` ve `pubspec.yaml` dosyalarını **ezmez**, sadece eksik Android/iOS dosyalarını oluşturur.

### 2. Internet iznini ekle

`android/app/src/main/AndroidManifest.xml` dosyasında `<application` etiketinin **üstüne** şunu ekle:

```xml
<uses-permission android:name="android.permission.INTERNET"/>
```

### 3. Bağımlılıkları yükle

```bash
flutter pub get
```

### 4. Uygulamayı çalıştır

```bash
flutter run
```

## Proje Yapısı

```
lib/
├── main.dart                    # Uygulama girişi, tema, Named Routes
├── models/
│   └── product.dart             # Product veri modeli, fromJson/toJson
├── services/
│   ├── api_service.dart         # HTTP ile veri çekme + mock fallback
│   └── cart_service.dart        # ValueNotifier tabanlı sepet yönetimi
├── screens/
│   ├── home_screen.dart         # Ana sayfa (Discover)
│   ├── product_detail_screen.dart # Ürün detayı
│   └── cart_screen.dart         # Sepet ekranı
└── widgets/
    └── product_card.dart        # GridView ürün kartı
```

## Veri Kaynağı

- Ürün verileri: https://wantapi.com/products.php
- Banner görseli: https://wantapi.com/assets/banner.png
- Bağlantı hatasında mock veriler otomatik olarak devreye girer.
