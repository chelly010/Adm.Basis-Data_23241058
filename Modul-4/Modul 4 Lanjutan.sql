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

-- fungsi agregasi
-- SUM digunakan untuk mengolah beberapa baris data untuk menghasilkan nilai baru
-- praktek 7
-- menghitung atau menjumlahkan seluruh nilai dari baris kolom qty pada tabel penjualan
SELECT qty from tr_penjualan;
SELECT SUM(qty)FROM tr_penjualan;

-- praktek 8
-- menghitung seluruh baris pada tabel penjualan
SELECT *FROM tr_penjualan;
SELECT COUNT(*) FROM tr_penjualan;

-- praktek 9
-- menggunakan 2 fungsi agregasi dalam satu query sql
-- SUM dan COUNT
SELECT SUM(qty), COUNT(*) FROM tr_penjualan;

-- praktek 10
-- menggunakan 3 fungsi agregasi dalam satu query sql
-- AVG(menghitung rata-rata pada penjualan),
-- MAX(mencari nilai tertinggi pada transaksi),
-- MIN(mencari nilai terendah pada transaksi)
SELECT AVG(qty), MAX(qty), MIN(qty) FROM tr_penjualan;

-- praktek 11
-- mengkombinasikan fungsi agregasi dengan kolom tertentu
SELECT tgl_transaksi,nama_produk, MAX(qty) FROM tr_penjualan;

-- praktek 12	
-- COUNT(distinct) untuk menghitung nilai yang unik saja atau berbeda
-- menghitung nilai unik yang ada pada nama produk di tabel penjualan
SELECT COUNT(nama_produk) FROM tr_penjualan;

-- menggunakan distinct
SELECT COUNT(distinct nama_produk) FROM tr_penjualan;
SELECT COUNT(nama_produk), COUNT(distinct nama_produk) FROM tr_penjualan;

-- GROUP BY
-- mengelompokan isi data dari satu atau beberapa kolom, biasanya digabung dengan fungsi agregasi
-- group by 1 kolom
-- praktek 14
SELECT nama_produk FROM tr_penjualan GROUP BY nama_produk;
SELECT nama_produk FROM tr_penjualan;

-- praktek 15
-- mengengelompkan nilai nama produk dan qty pada tabel penjualan
SELECT nama_produk, qty FROM tr_penjualan
GROUP BY nama_produk;

-- praktek 16
-- mengambil qty dari produk berdasarkan hasil pengelomkan nama produk
SELECT nama_produk, SUM(qty) FROM tr_penjualan GROUP BY nama_produk;

-- mengambil jumlah qty dari nama produk berdasarkan
-- hasil pengelompokan nama produk dari besar ke kecil
SELECT nama_produk, SUM(qty) FROM tr_penjualan
GROUP BY nama_produk ORDER BY SUM(qty) DESC;

-- HAVING
-- digunakan sebagai filtering untuk GROUP BY dan fungsi agregasi
-- praktek 18
-- mengambil jumlah qty dari nama produk yang jumlah qty > dari 2
-- beradasarkan hasil pengelompokan nama produk
SELECT nama_produk, SUM(qty)
FROM tr_penjualan
GROUP BY nama_produk
HAVING SUM(qty) >2
ORDER BY SUM(qty) DESC;

-- Latihan mandiri 1
-- cobalah query untuk melakukan hal-hal berikut
-- 1. melihat daftar nama produk yang total jumlah produk terjual per kelompok nama produk adalah di atas nilai 4
-- 2. Melihat daftar nama produk yang total jumlah produk terjual per kelompok nama produk sama dengan 9
-- 3. melihat daftar kelompok nama produk dan total nilai penjualan (harga dikalikan jumlah dikurangi diskon) dengan
-- dan urutkanberdasarkan nilai penjualan terbesar

-- jawab No. 1
-- mengambil jumlah qty dari nama produk yang jumlah qty > dari 4
SELECT nama_produk, SUM(qty)
FROM tr_penjualan
GROUP BY nama_produk
HAVING SUM(qty) >4;

-- mengambil jumlah qty dari nama produk yang jumlah qty sama dengan 9
SELECT nama_produk, SUM(qty)
FROM tr_penjualan
GROUP BY nama_produk
HAVING SUM(qty) = 9 ;

-- mengambil daftar kelompok nama produk dan total nilai penjualan dari hasil
-- (harga dikalikan jumlah dikurangi diskon) dan
-- di urutkan berdasarkan nilai penjualan terbesar atau tertinggi
SELECT nama_produk, SUM(qty),
SUM((qty*harga) - ((diskon_persen/100)*harga)) AS total_penjualan
FROM tr_penjualan
GROUP BY nama_produk
ORDER BY total_penjualan DESC;


SELECT *FROM tr_penjualan;