-- Nama		: Chelly Satya Carsa Thesar
-- NIM		: 23241058
-- Kelas	: B
-- Modul	: OREDER BY, Fungsi, Agregasi, GROUP BY, HAVING


USE pti_mart;

-- ORDER BY
-- Ambil nama produk dan qty dari tabel penjualan urutkan qty
SELECT nama_produk, qty FROM tr_penjualan ORDER BY qty;

-- Ambil nama produk dan qty dari tabel penjualan urutkan qty dan nama produk
SELECT nama_produk, qty FROM tr_penjualan ORDER BY qty, nama_produk;

-- Latihan mandiri
-- menampilkan semua kolom dari tabel tr_penjualan dengan
-- mengurutkan berdasarkan qty dan tanggal transaksi
SELECT *FROM tr_penjualan GROUP BY qty,tgl_transaksi;

-- menampilkan semua kolom dari tabel ms_pelanggan
-- dengan mengurutkan berdasarkan nama_pelanggan
SELECT *FROM ms_pelanggan GROUP BY nama_pelanggan;

-- menampilkan semua kolom dari table ms_pelanggan
-- dengan mengurutkan berdasarkan alamat
SELECT *FROM ms_pelanggan GROUP BY alamat;

-- ORDER BY ASC dan DESC
-- mengambil nama produk, qty dari tabel penjualan
-- dengan mengurutkan berdasarkan qty dari yang besar ke kecil
SELECT nama_produk,qty FROM tr_penjualan ORDER BY qty DESC;

-- mengambil nama produk, qty dari tabel penjualan
-- dengan mengurutkan berdasarkan qty dan nama_produk besar ke kecil
SELECT nama_produk, qty FROM tr_penjualan
ORDER BY qty DESC,nama_produk DESC;

-- latihan mandiri 2
-- tampilkan semua kolom dari tabel tr_penjualan
-- dengan mengurutkan berdasarkan tgl_transaksi
-- secara descending dan qty secara ascending
SELECT *FROM tr_penjualan ORDER BY tgl_transaksi DESC, qty ASC;

-- tampilkan semua kolom dari tabel ms_pelanggan
-- dengan mengurutkan berdasarkan nama_pelanggan secara descanding
SELECT *FROM ms_pelanggan GROUP BY nama_pelanggan DESC;

-- tampilkan semua kolom dari tabel ms_pelanggan
-- dengan mengurutkan berdasarkan alamat secara descending
SELECT *FROM ms_pelanggan GROUP BY alamat DESC;

-- ORDER BY daris hasil perhitungan
-- Mengambil nama produk, qty, harga, harga*qty dari tr_penjuakan
-- dengan mengurutkan berdasarkan harga*qty secara besar ke kecil (DESC)
SELECT nama_produk, qty, harga, harga*qty AS total
FROM tr_penjualan ORDER BY harga*qty DESC;

-- latihan mandiri 3
-- cobalah pengurutan dengan ekspresi total harga menggunakan
-- rumusan jumlah barang dikali harga barang dikurangi diskon
SELECT nama_produk, harga, qty, diskon_persen, qty*harga AS total_harga, 
((qty*harga) - ((diskon_persen/100)*harga)) AS total_bayar 
FROM tr_penjualan ORDER BY diskon_persen, total_bayar DESC;

-- ORDER BY menggunakan WHERE
-- mengambil nama produk dan qty dari tr_penjualan
-- yang nama_produk berawalan huruf 'f' urutkan berdasarkan qty
SELECT nama_produk, qty FROM tr_penjualan
WHERE nama_produk LIKE 'F%'
ORDER BY qty DESC;

-- latihan mandiri 4
-- menampilkan semua kolom dari transaksi penjualan
-- yang memiliki diskon dan urutkan berdasarkan harga tertinggi
SELECT  *FROM tr_penjualan WHERE diskon_persen > 0
ORDER BY harga DESC;

-- menampilkan kolom nama produk, qty, harga dari
-- tabel transaksi_penjualan yang memiliki
-- harga minimal seratus ribu rupiah dan
-- di urutkan berdasarkan harga tertinggi
SELECT nama_produk, qty, harga FROM tr_penjualan
WHERE harga >= 100000
ORDER BY harga DESC;

-- menampilkan kolom nama_produk, qty,harga dari tabel tr_penjualan
-- yang memiliki harga minimal seratus ribu rupiah atau
-- nama produk berawalan karakter T dan
-- di urutkan berdasarkan diskon tertinggi
SELECT nama_produk, qty, harga
FROM tr_penjualan
WHERE harga >= 100000 OR nama_produk LIKE 'T%'
ORDER BY diskon_persen DESC;


SELECT *FROM tr_penjualan;