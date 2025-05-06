-- Modul    : 3 Nilai Literal, Operator, Fungsi, Date, dan Klausal WHERE
-- Nama     : Chellt Satya Carsa Thesar
-- NIM      : 23241058
-- Kelas    : IV/B

-- menggunakan database
USE pti_mart;

--- Praktek 1
--- Menggunakan statemen SELECT untuk menampilkan nilai literal, 
--- berikut ini perintahnya :
SELECT 19;
SELECT 19 AS angka;

--- Praktek 2
--- Menggunakan `SELECT` Statement untuk menampilkan beberapa 
--- nilai literal dengan tipe data yang berbeda
--- (Nilai true = 1)
SELECT 19 AS angka, true AS nilai_logika, 'PTI' AS teks;

--- (Nilai false = 0)
SELECT 15 AS angka, false AS nilai_logika, 'PTI' AS teks;

--- Praktek 3
--- Menggunakan `SELECT` statemen untuk menampilkan `NULL`
SELECT NULL AS kosong;

--- Praktek 4
--- Menggunakan SELECT Statement untuk melakukan kalkulasi dengan ekspresi matematika.
--- % untuk modulasi menghasilkan bilangan yang sisa bagi
SELECT 5%2 AS sisa_bagi, 5/2 AS hasil_bagi_1,
5 DIV 2 AS hasil_bagi_2;


--- Latihan Mandiri 1
--- hitung 4*2 (4 dikali 2)
SELECT 4*2 AS hasil_perkalian;

--- hitung (4*8)%7 (perkalian dan sisa bagi)
SELECT (4*8)%7 AS hasil;

--- hitung (4*8) MOD 7 (perkalian dan sisa bagi)
SELECT (4*8) MOD 7 AS hasil;

--- Praktek 5
--- Menggunakan `SELECT` Statement untuk melakukan 
--- kalkulasi *field* *table* dengan ekspresi matematika
--- mengkalikan kolom qty dengan harga
SELECT qty*harga AS total_beli FROM tr_penjualan;

--- Praktek 6
--- Menggunakan SELECT Statement untuk melakukan operasi perbandingan.
SELECT 5=5, 5<>5, 5<>4, 5!=5,5!=4, 5>4;

--- Latihan Mandiri 2
--- lakukan perbandingan 1 = true
--- true akan menghasilkan nilai 1
SELECT 6=6 AS nilai_true;

--- lakukan perbandingan 1 = false
--- false akan menghasilkan nilai 0

SELECT 9<>9 AS nilai_false;

--- lakukan perbandingan 5 >= 5
SELECT 5 >=5 AS nilai_true;

--- lakukan perbandingan 5.2 = 5.20000
SELECT 5.2 = 5.20000 AS nilai_true;

--- lakukan perbandingan NULL = 1
SELECT NULL = 1 AS nilai_kosong;

--- lakukan perbandingan NULL = NULL
SELECT NULL = NULL AS nilai_kosong;

--- Praktek 7
--- Melakukan operasi perbandingan pada field qty table tr_penjualan
--- Quantity yang lebih dari 3 akan menghasilkan nilai true
SELECT nama_produk, qty, nama_produk, qty > 3 FROM tr_penjualan;

--- Praktek 8
--- Mencoba menggunakan beragam fungsi dalam satu statemen SELECT
--- POW untuk bilangan pangkat
--- ROUND X,ABC untuk membulatkan bilangan desimal X
--- ROUND X,ABC,1 untuk membulatkan bilangan desimal A jika ,2 untuk membulatkan bilangan desimal B
--- FLOOR X untuk membulatkan angka pecahan X berapapun desimalnya maka hasilnya tetap X
--- CEILING X untuk membulatkan angka pecahan X berapapun desimalnya maka akan menghasilkan angka lebih 1 dari angka X
SELECT POW(3,2), ROUND(3.14), ROUND(3.54), 
	ROUND(3.155, 1), ROUND(3.155, 2),
	FLOOR(4.28), FLOOR(4.78), 
	CEILING(4.39), CEILING(4.55);


--- Praktek 9
--- Mencoba menggunakan beragam fungsi DATE dalam satu statemen SELECT
SELECT NOW(), YEAR('2022-05-03'), DATEDIFF('2022-07-22', '2022-05-03'), DAY('2022-05-03');

--- Latihan Mandiri 3
--- Hitung selisih tanggal '2022-07-23' dengan tanggal saat ini
SELECT NOW() AS tanggaltahun_saatini, YEAR('2022-07-23') AS tanggaltahun_pilihan,
	   DATEDIFF( NOW(),'2022-07-23') AS selisih_tanggal, DAY ('2022-07-23')tanggal_pilihan;

--- Ekstrak elemen tahun dari tanggal ini '2022-07-23'
SELECT '2022-07-23' AS TBT_pilihan, YEAR('2022-07-23') AS tahun_pilihan;

--- Ekstrak eleman bulan dari tanggal ini '2022-07-23'
SELECT '2022-07-23' AS TBT_pilihan, MONTH('2022-07-23') AS bulan_pilihan;

--- Ekstrak elemen hari dari date ini '2022-07-23'
SELECT '2022-07-23' AS TBT_pilihan, DAY('2022-07-23') AS tanggal_pilihan;

--- Ekstrak elemen tahun dari tanggal saat ini
SELECT NOW() AS tahun_saatINI, YEAR(NOW()) AS tahun_pilihan;

--- Praktek 10
--- ekstrak selisih hari antara semua tanggal  transaksi pada tabel tr_penjualan dengan hari ini
SELECT DATEDIFF(NOW(), tgl_transaksi) AS jarak_transaksi FROM tr_penjualan;

--- Praktek 11
--- Mengambil data nama_produk, dan qty dari tabel penjualan yang qty lebih dari 3
--- menggunakan WHERE Sebagai filter data
SELECT nama_produk, qty
FROM tr_penjualan WHERE qty>3;

--- Praktek 12
--- Mengambil data nama_produk dan qty yang terjual dari tabel_penjualan 
--- yang qty lebih dari 3 dan transaksinya terjadi pada bulan Juni
--- menggunakan WHERE Sebagai filter data
SELECT nama_produk, qty, tgl_transaksi
FROM tr_penjualan
WHERE qty>3 AND month(tgl_transaksi)=6;


--- Praktek 13
--- Mengambil nama produk, qty, dan tanggal transaksi 
--- untuk produk dengan nama 'Flaskdisk 32 GB' dari tabel penjualan
SELECT nama_produk, qty, tgl_transaksi
FROM tr_penjualan 
WHERE nama_produk = 'Flash disk DQLab 32 GB';

SELECT nama_produk, qty, tgl_transaksi FROM tr_penjualan;

--- Praktek 14
--- Mengambil nama produk dari tabel penjualan yang nama produknya memiliki huruf 'f' sebagai awal kata
--- LIKE operator yang menggunakan simbol untuk menemukan pola karakter
---  % (persen) untuk mewakili nol atau lebih karakter apapun
--- _ (garis bawah) untuk memilih huruf setelah huruf awal
SELECT nama_produk FROM tr_penjualan WHERE nama_produk LIKE 'f%';

--- Latihan Mandiri 4
--- Ambil nama_produk yang memiliki karakter kedua ‘a’ pada table tr_penjualan
SELECT nama_produk FROM tr_penjualan WHERE nama_produk LIKE '_a%';

--- Ambil kategori_produk yang mengandung huruf ‘t’ pada table ms_produk
SELECT kategori_produk FROM ms_produk WHERE kategori_produk LIKE '%t%';

--- Ambil kategori_produk yang mengandung karakter ‘un’ pada table ms_produk
SELECT kategori_produk  FROM ms_produk  WHERE kategori_produk LIKE '%un%';

--- Praktek 15
--- Mengambil nama produk dari table tr_penjualan yang
--- memiliki pola teks berawalan huruf F dan qty penjualan di atas 2
SELECT nama_produk
FROM tr_penjualan
WHERE nama_produk LIKE 'f%' AND qty > 2;