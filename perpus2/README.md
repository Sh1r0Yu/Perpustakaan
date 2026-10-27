# Perpustakaan – Aplikasi Mobile Katalog Buku

Aplikasi mobile berbasis Flutter untuk menjelajahi dan mencari buku, terinspirasi dari Google Books. Data buku diambil secara langsung dari Google Books API.

## Fitur
- Daftar buku populer di halaman utama
- Pencarian buku berdasarkan kata kunci
- Halaman detail buku: sampul, deskripsi, dan rating
- Tombol pratinjau yang membuka halaman preview buku di Google Books
- Halaman profil, serta tampilan login dan registrasi (UI)

## Teknologi
- Flutter & Dart
- Google Books API (REST)
- Package: `http`, `url_launcher`, `flutter_staggered_grid_view`, `intl`

## Menjalankan Aplikasi
1. Buat API key di Google Cloud Console dan batasi hanya untuk **Books API**.
2. Clone repo dan masuk ke folder proyek:
   ```
   git clone https://github.com/Sh1r0Yu/Perpustakaan.git
   cd Perpustakaan/perpus2
   flutter pub get
   ```
3. Jalankan dengan API key sebagai variabel build (key tidak disimpan di repo):
   ```
   flutter run --dart-define=GOOGLE_BOOKS_API_KEY=your_api_key
   ```

## Catatan
- Login dan registrasi saat ini masih berupa tampilan (UI) dan belum terhubung ke backend.
- Halaman favorit masih dalam pengembangan.
