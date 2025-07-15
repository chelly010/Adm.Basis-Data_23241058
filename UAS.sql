-- NAMA			: Chelly Satya Carsa Thesar
-- NIM			: 23241058
-- Kelas		: PTI/B
-- mata Kuliah	: Administrasi Basis Data



-- Soal 1
-- menampilkan nama produk, tgl transaksi, bulan 30 juni 2023 atas semua produk ditransaksikan

SELECT  nama_produk, tgl_transaksi,
MONTH (tgl_transaksi) AS bulan,
YEAR (tgl_transaksi) AS tahun,
DATEDIFF('2023-06-30',tgl_transaksi) AS selisih_hari
FROM tr_penjualan;

-- soal 2
-- menampilkan nama pelanggan dan nilai transaksaksinya dengan nilai transaksi terkecil
SELECT mp.nama_pelanggan,
MIN(tp.qty * tp.harga) AS transaksi_terkecil
FROM tr_penjualan tp
JOIN ms_pelanggan mp
ON tp.kode_pelanggan = mp.kode_pelanggan;

-- soal 3
-- menampilkan bulan, nama produk, kategori, dan harga dari produk yang tidak pernah terjual pada bulan mei
SELECT 'Mei' AS bulan,
mpr.nama_produk, kategori_produk, mpr.harga
FROM ms_produk AS mpr
LEFT JOIN tr_penjualan AS tp
ON mpr.kode_produk = tp.kode_produk
WHERE MONTH(tp.tgl_transaksi)IS NULL;

use pti_mart;