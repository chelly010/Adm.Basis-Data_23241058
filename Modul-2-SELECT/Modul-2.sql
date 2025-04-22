-- Nama		: Chelly Satya Carsa Thesar
-- Nim		: 23241058
-- Kelas	: B
-- Modul	: 2 (SELECT)

-- Membuat database
CREATE DATABASE pti_mart;
USE pti_mart;

-- Cek kolom dalam tabel
DESCRIBE ms_pelanggan;
DESCRIBE ms_produk;
DESCRIBE tr_penjualan;

-- SELECT
-- Menggunakan SELECT untuk 1 tabel
-- Mengambil kolom nama produk dari tabel produk
SELECT nama_produk FROM ms_produk;

-- Mengambil lebih dari 1 kolom dari 1 tabel
SELECT nama_produk, harga FROM ms_produk;

-- Mengambil seluruh kolom dari tabel
SELECT * FROM ms_produk;

-- Latihan
-- Mengambil kode produk dan nama produk dari tabel produk
SELECT kode_produk, nama_produk FROM ms_produk;

-- mengambil seluruh kolom dari penjualan
SELECT * FROM tr_penjualan;

-- PREFIX dan ALIAS
-- PREFIX, Bagian objek database yang hirarkinya lebih tinggi
-- Menggunakan PREFIX nama tabel untuk koom nama_produk dari tabel produk
SELECT ms_produk.nama_produk FROM ms_produk;

-- Menggunakan nama database dan tabel sebagai PREIX untuk kolom nama produk
SELECT pti_mart.ms_produk.nama_produk FROM ms_produk;

-- ALIAS, adalah nama sementara
-- Mengganti sementara nama kolom produk dengan ALIAS
SELECT nama_produk AS np FROM ms_produk;
SELECT nama_produk np FROM ms_produk;

-- Mengganti sementara tabel dengan ALIAS
SELECT nama_produk FROM ms_produk AS msp;

-- Kombinasikan PREFIX dan ALIAS
SELECT msp.nama_produk FROM ms_produk msp;

-- CASE 1 melihat nama pelanggan dan alamat dari tabel ms_pelanggan
SELECT pti_mart.ms_pelanggan.nama_pelanggan,alamat FROM ms_pelanggan;

-- CASE 2 melihat nama produk dan harga dari ms_produk
SELECT pti_mart.ms_produk.nama_produk, harga FROM ms_produk;