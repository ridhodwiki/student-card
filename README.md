# Student Card

Aplikasi praktikum Mobile Programming yang menggabungkan kartu mahasiswa digital, profil, galeri foto, kontak, dan katalog perlengkapan kuliah. Navigasi utama berada di bawah pada ponsel dan berpindah ke samping pada layar lebar.

**Ridho Dwiki Zakaria** · NPM 24670007 · Kelas 5A

## Halaman aplikasi

| Halaman | Fungsi |
| --- | --- |
| Beranda | Menampilkan ringkasan identitas, pintasan halaman, dan tombol Tentang Aplikasi. |
| Kartu | Menampilkan kartu mahasiswa digital dan tombol untuk membuka Kontak. |
| Profil | Menampilkan nama, NIM, dan program studi. |
| Galeri | Menampilkan foto mahasiswa dari aset lokal. |
| Kontak | Menampilkan alamat email dan nomor telepon yang dapat disalin. |
| Katalog | Menampilkan produk dalam List atau Grid. Ketuk produk untuk melihat detail dan menambahkannya ke keranjang, atau ketuk ikon hati untuk menyimpannya sebagai favorit. |
| Tentang Aplikasi | Menjelaskan tujuan proyek, versi, dan halaman yang tersedia. |

## Struktur proyek

| Lokasi | Isi dan kegunaan |
| --- | --- |
| [lib/](lib/) | Kode Dart aplikasi. Eksekusi dimulai di [main.dart](lib/main.dart). |
| [lib/pages/](lib/pages/) | Halaman Beranda, Kartu, Profil, Galeri, dan Kontak. Halaman Tentang Aplikasi berada di [lib/secondpage.dart](lib/secondpage.dart). |
| [lib/widgets/](lib/widgets/) | Komponen bersama untuk kartu, tata letak halaman yang dapat digulir, dan tautan antarhalaman. |
| [lib/data/](lib/data/) | Data contoh produk. List, Grid, dan halaman detail membaca sumber data yang sama. |
| [lib/katalog.dart](lib/katalog.dart) | Tampilan katalog dan detail, serta pengelolaan Favorit dan Keranjang selama aplikasi berjalan. Foto produk dimuat dari internet. |
| [assets/image/](assets/image/) | Foto lokal yang digunakan pada halaman mahasiswa. |
| [test/](test/) | Widget test untuk navigasi, tata letak responsif, dan interaksi katalog. |
| [android/](android/) dan [ios/](ios/) | Proyek native Android dan iOS, termasuk konfigurasi build, izin aplikasi, dan aset platform. |
| [web/](web/) | Halaman HTML awal, manifest, dan ikon untuk Flutter Web. |
| [windows/](windows/), [linux/](linux/), dan [macos/](macos/) | Kode peluncur dan konfigurasi build aplikasi desktop untuk setiap sistem operasi. |

Untuk mengubah menu utama, lihat [navigation.dart](lib/navigation.dart) untuk label dan ikon, [app_routes.dart](lib/app_routes.dart) untuk tujuan setiap menu, serta [app_scaffold.dart](lib/app_scaffold.dart) untuk navigasi bawah dan samping. Warna dan gaya komponen bersama diatur di [theme.dart](lib/theme.dart).

[pubspec.yaml](pubspec.yaml) menentukan versi SDK, dependensi, dan aset. [pubspec.lock](pubspec.lock) mencatat versi dependensi yang digunakan, sedangkan [analysis_options.yaml](analysis_options.yaml) mengatur pemeriksaan kode. Pada salinan proyek lokal, Flutter menggunakan `build/` untuk hasil build dan `.dart_tool/` untuk berkas kerja. Folder `docs/` digunakan untuk dokumentasi lokal dan diabaikan oleh Git.

## Menjalankan aplikasi

Gunakan Flutter SDK dengan Dart yang memenuhi batas versi `^3.12.2`. Dari direktori utama proyek, jalankan:

```sh
flutter pub get
flutter devices
flutter run
```

Untuk membuka versi web di Chrome, gunakan `flutter run -d chrome`.

## Pengujian

```sh
flutter analyze
flutter test
```

[navigation_test.dart](test/navigation_test.dart) memeriksa navigasi bawah dan samping, halaman Tentang Aplikasi, serta aksi kembali. [katalog_test.dart](test/katalog_test.dart) memeriksa perpindahan List dan Grid, pengiriman produk ke halaman detail, kategori, favorit, dan jumlah barang di keranjang.
