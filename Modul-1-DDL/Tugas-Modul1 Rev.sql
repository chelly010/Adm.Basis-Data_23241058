-- Nama  : Chelly Satya Carsa Thesar
-- NIM   : 23241058
-- Kelas : PTI 4 B
-- ===================================--

-- membuat database
CREATE DATABASE topup_mobileegend;

-- menggunakan database
USE topup_mobilelegend;

-- melihat tabel
DESCRIBE karyawan;
DESCRIBE produk;
DESCRIBE reseller;
DESCRIBE player;
DESCRIBE supplier;
DESCRIBE transaksi;

-- melihat data pada tabel
SELECT *FROM karyawan;
SELECT *FROM reseller;
SELECT *FROM player;
SELECT *FROM produk;
SELECT *FROM transaksi;

-- membuat tabel dalam database 'topup_mobilelegend'
-- membuat tabel pada karyawan
CREATE TABLE karyawan (
NIK varchar(100),
nama varchar(100),
tempat_lahir text,
tanggal_lahir datetime,
jenis_kelamin enum ('laki-laki','perempuan'),
alamat varchar(500),
no_tlpn varchar(15),
email varchar(100),
usia varchar(15) );

-- membuat tabel pada produk
CREATE TABLE produk (
id_produk varchar (10),
diamond varchar (25),
weekly_diamond_past varchar (5),
twilight_past varchar (5),
harga_produk int);

-- membuat tabel reseller
CREATE TABLE reseller (
nama varchar(100),
id_reseller varchar(10),
alamat varchar(500),
no_tlpn varchar(15),
email varchar(100));

-- membuat tabel player
CREATE TABLE player (
nickname varchar(25),
id_player varchar(15),
no_tlpn varchar(15),
email varchar(100));

-- membuat tabel supplier
CREATE TABLE supplier(
nama varchar(100),
id_supplier varchar(10),
alamat varchar(500),
no_tlpn int,
email varchar(100));

-- membuat tabel transaksi
CREATE TABLE transaksi(
NIK varchar(100)NULL,
id_supplier varchar(10)NULL,
id_reseller varchar(10)NULL,
id_player varchar(10)NULL,
id_produk varchar(10)NULL,
Produk varchar(50),
total int,
tanggal_pemesanan datetime,
pesanan_melalui enum('moonton', 'store'),
status enum('success', 'pending'));

-- membuat primary key tabel karyawan, produk, reseller, supplier, player, transaksi
ALTER TABLE karyawan
ADD PRIMARY KEY (NIK);

ALTER TABLE produk
ADD PRIMARY KEY (id_produk);

ALTER TABLE reseller
ADD PRIMARY KEY (id_reseller);

ALTER TABLE supplier
ADD PRIMARY KEY (id_supplier);

ALTER TABLE player
ADD PRIMARY KEY (id_player);

ALTER TABLE transaksi
ADD PRIMARY KEY (id_produk);

-- membuat Foreign Key (relasi) antar tabel dalam transaksi
ALTER TABLE transaksi
ADD CONSTRAINT FK_PlayerTransaksi
FOREIGN KEY (id_player) REFERENCES player(id_player);

ALTER TABLE transaksi
ADD CONSTRAINT FK_TransaksiSupplier
FOREIGN KEY (id_supplier) REFERENCES supplier(id_supplier);

ALTER TABLE transaksi
ADD CONSTRAINT FK_ResellerTransaksi
FOREIGN KEY (id_reseller) REFERENCES reseller(id_reseller);

ALTER TABLE transaksi
ADD CONSTRAINT FK_TransaksiKaryawan
FOREIGN KEY (NIK) REFERENCES karyawan(NIK);

ALTER TABLE transaksi
ADD CONSTRAINT FK_ProdukTransaksi
FOREIGN KEY (id_produk) REFERENCES produk(id_produk);

-- membuat data pada tabel

-- mmebuat data karyawan
INSERT INTO karyawan (NIK,nama, tempat_lahir, tanggal_lahir, jenis_kelamin, alamat, no_tlpn, email, usia)
VALUES	('527105300700001', 'Fajar Dewantara', 'Gunung Sari', '1997-01-20', 'laki-laki',
		'Gunung Sari', '087860002633', 'fjrdwantara@gmail.com', '29'),
		('527105300703301', 'Ananda Risky', 'Pagutan', '1999-06-10',  'laki-laki',
        'Pagutan', '087860002634', 'riskyananda@gmail.com', '30'),
		('527105308800001', 'Rahmat Hidayat', 'Bengkel', '1998-09-13', 'laki-laki',
        'Bengkel', '087860002635', 'rahmat.hidayat@gmail.com', '27'),
		('527105300702401', 'Septiani Putri', 'Sekarbela', '1998-05-20', 'perempuan',
        'Sekarbela', '087860002636', 'septiani.putri@gmail.com', '26'),
		('527105300789301', 'Siska Ramayana', 'Mataram', '1995-08-20', 'perempuan',
        'Mataram', '087860002637', 'siska.ramayana@gmail.com', '32');
        
-- membuat data player
INSERT INTO player (nickname, id_player, no_tlpn, email)
VALUES	('Player1', 'P001', '087860002643', 'player1@gmail.com'),
		('Player2', 'P002', '087860002644', 'player2@gmail.com'),
		('Player3', 'P003', '087860002645', 'player3@gmail.com'),
		('Player4', 'P004', '087860002646', 'player4@gmail.com'),
		('Player5', 'P005', '087860002647', 'player5@gmail.com');

-- membuat data produk
INSERT INTO produk (id_produk, diamond, weekly_diamond_past, twilight_past, harga_produk)
VALUES	('P001', '500', '100',  '50', 1000000),
		('P002', '1000', '200', '100', 2500000),
		('P003', '1500', '300', '150', 3500000),
		('P004', '2000', '400', '200', 2000000),
		('P005', '2500', '500', '250', 2500000);
        
-- membuat data supplier
INSERT INTO supplier (nama, id_supplier, alamat, no_tlpn, email)
VALUES	('Moonton A', 'S001', 'Jl. Supplier A, Mataram', '087860002648', 'MoontonA@gmail.com'),
		('Moonton B', 'S002', 'Jl. Supplier B, Mataram', '087860002649', 'MoontonB@gmail.com'),
		('Moonton C', 'S003', 'Jl. Supplier C, Mataram', '087860002650', 'MoontonC@gmail.com'),
		('Moonton D', 'S004', 'Jl. Supplier D, Mataram', '087860002651', 'MoontonD@gmail.com'),
		('Moonton E', 'S005', 'Jl. Supplier E, Mataram', '087860002652', 'MoontonE@gmail.com');

-- membuat data reseller
INSERT INTO reseller (nama, id_reseller, alamat, no_tlpn, email)
VALUES	('Reseller A', 'R001', 'Jl. Reseller A, Mataram', '087860002638', 'resellerA@gmail.com'),
		('Reseller B', 'R002', 'Jl. Reseller B, Mataram', '087860002639', 'resellerB@gmail.com'),
		('Reseller C', 'R003', 'Jl. Reseller C, Mataram', '087860002640', 'resellerC@gmail.com'),
		('Reseller D', 'R004', 'Jl. Reseller D, Mataram', '087860002641', 'resellerD@gmail.com'),
		('Reseller E', 'R005', 'Jl. Reseller E, Mataram', '087860002642', 'resellerE@gmail.com');

-- Membuat data transaksi
-- transaksi player
INSERT INTO transaksi (id_player,id_produk,Produk, total, tanggal_pemesanan, pesanan_melalui, status)
VALUES	('P001', 'P001', 'Diamond 100', '27000', '2025-04-18', 'store', 'success'),
		('P002', 'P002', 'Weakly Diamond Past 2x', '55000', '2025-02-16', 'store', 'success');

-- transaksi karyawan
INSERT INTO transaksi (NIK, nama,id_supplier, id_produk,Produk, total, tanggal_pemesanan, pesanan_melalui, status)
VALUES	('527105300700001', 'Fajar Dewantara','S001', 'P005', 'Diamond 5000000 + Weekly Diamond past 5x',
		'22000000', '2025-04-18', 'moonton', 'success');

-- transaksi reseller
INSERT INTO transaksi (id_reseller, id_produk,Produk, total, tanggal_pemesanan, pesanan_melalui, status)
VALUES	('R001', 'P003', 'Diamond 8000000 + Weekly Diamond past 50x', '22000000', '2025-04-18', 'store', 'success'),
		('R002', 'P004', 'Diamond 9000000 + Twilight past 100x', '26000000', '2025-04-18', 'store', 'success');