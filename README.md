# TokoPintar

TokoPintar adalah aplikasi *e-commerce* mobile berskala kecil (Mini E-Commerce) yang dikembangkan dengan framework Flutter. Aplikasi ini mengusung desain yang elegan, bersih (clean minimalist), dan modern.

## 📱 Cara Kerja Aplikasi

Aplikasi TokoPintar memiliki alur kerja yang sederhana dan intuitif:
1. **Halaman Beranda (Katalog)**: Saat aplikasi dibuka, pengguna akan langsung disambut dengan katalog produk dalam bentuk *grid*. Terdapat fitur pencarian (*search bar*) yang elegan untuk mencari produk.
2. **Detail Produk**: Pengguna dapat menekan salah satu produk di katalog untuk melihat halaman detail. Halaman ini menampilkan gambar produk yang lebih besar, harga, dan deskripsi lengkap.
3. **Menu Navigasi**: Terdapat menu navigasi samping (Drawer) yang memungkinkan pengguna untuk berpindah antara "Katalog Belanja" dan "Manajemen Toko".
4. **Halaman Manajemen (Admin)**: Aplikasi ini menyediakan mode admin sederhana (Manajemen Toko) di mana penjual dapat melihat daftar produk dalam bentuk *list*, serta tombol untuk menambah, mengedit, atau menghapus produk (simulasi lokal).

## ✨ Daftar Fitur

- **Katalog Belanja**: Menampilkan daftar produk menggunakan `GridView` yang responsif.
- **Pencarian Produk**: Kolom pencarian bergaya *inset* modern di bagian atas layar (AppBar).
- **Detail Produk**: Layar khusus untuk menampilkan informasi mendetail tentang produk yang dipilih.
- **State Management**: Menggunakan `Provider` untuk mengelola *state* produk secara global sehingga perubahan data (seperti menambah atau mengedit produk) langsung terlihat di seluruh aplikasi.
- **Manajemen Toko (Admin Mode)**: Layar khusus untuk mengelola inventaris produk (tambah, edit, hapus) lengkap dengan validasi form.
- **Navigasi Samping (Drawer)**: Memudahkan perpindahan antar layar (routing).
- **Desain Elegan**: Menggunakan kombinasi warna putih/abu-abu yang bersih dengan sudut-sudut melingkar (rounded corners) yang memberikan kesan modern.

## 🛠️ Teknologi yang Digunakan

- **Framework**: Flutter (Dart)
- **State Management**: Provider
- **Arsitektur**: Berbasis model, view, dan provider (mirip MVC/MVVM sederhana).

## 🚀 Persyaratan Proyek
Proyek ini dikembangkan sesuai dengan *Blueprint/Rencana Kerja Aplikasi* dan mematuhi aturan pengerjaan:
- [x] Sinkronisasi Git secara bertahap (multiple commits).
- [x] Dokumentasi `README.md` (fitur dan cara kerja).
- [x] Desain UI elegan dan rapi.
- [x] Menggunakan materi pembelajaran kelas.
