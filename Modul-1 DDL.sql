-- Nama  : Chelly Satya
-- NIM   : 23241058
-- Kelas : PTI 4 B

-- membuat database
CREATE DATABASE mandalika_mart;

-- menggunakan database 'mandalika mart'
USE mandalika_mart;
-- membuat tabel dalam database 'mandalika_mart'
CREATE TABLE member (
member_id varchar(10),
username varchar(20),
nama varchar(100),
tanggal_lahir datetime,
angka_favorit int);

CREATE TABLE Produk (
id_Produk varchar(10),
Nama_Produk varchar(25),
Kategori varchar(15),
Harga int,
QTY int);

CREATE TABLE Transaksi_Penjualan (
Tgl_Jual datetime,
ID_Produk varchar(10),
Member_ID varchar(10),
Nama_Produk varchar (25),
Harga int,
QTY int);

-- mengupdate primary key table member, produk
ALTER TABLE produk
ADD PRIMARY KEY (id_produk);

ALTER TABLE member
ADD PRIMARY KEY (member_id);

-- mengupdate foreign key table transaksi_penjualan
ALTER TABLE transaksi_penjualan
ADD CONSTRAINT FK_memberTransaksi
FOREIGN KEY (member_id) REFERENCES member(member_id);

ALTER TABLE transaksi_penjualan
ADD CONSTRAINT FK_produkTransaksi
FOREIGN KEY (id_produk) REFERENCES produk(id_produk);

-- mengisi data pada tabel
INSERT INTO member(member_id, username, nama, tanggal_lahir, angka_favorit)
VALUES ('ID-01', 'cezet12', 'Chelly', '2000-07-14',7);
INSERT INTO member(member_id, username, nama, tanggal_lahir, angka_favorit)
VALUES ('ID-02', 'Zeact22', 'Fajar', '2005-08-15',20);

-- mengakses isi data pada tabel member
SELECT *FROM member;