# Kartu Mahasiswa

Aplikasi Flutter multi-halaman berisi kartu mahasiswa digital Muchammad Abdul
Ghofur (NPM 24670008), Teknik Informatika, Universitas PGRI Semarang.

## Halaman

- **Kartu** (`/`) — kartu identitas yang dapat dibalik untuk melihat data di
  baliknya.
- **Profil** (`/profil`) — identitas dan data akademik.
- **Tentang** (`/tentang`) — informasi kampus dan aplikasi.

## Foto profil

Foto profil diambil dari `assets/images/profil.jpg` dan otomatis dipotong
mengikuti bingkai kartu. Selama foto belum ada, kartu memakai inisial nama.
Setelah mengunggah foto, jalankan ulang aplikasi (bukan hanya hot reload).

## Menjalankan

```bash
flutter pub get
flutter run
```

Untuk web: `flutter run -d chrome`. Pemeriksaan: `flutter analyze` dan
`flutter test`.
