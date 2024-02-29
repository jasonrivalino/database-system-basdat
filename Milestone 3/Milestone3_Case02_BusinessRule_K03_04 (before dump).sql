create table Panitia (
    idPanitia int not null,
    namaLengkap varchar(50) not null,
    primary key (idPanitia)
);

create table Pewawancara (
    idPanitia int not null,
    jabatan varchar(50) not null,
    FOREIGN KEY (idPanitia) REFERENCES Panitia(idPanitia)
);

create table Pengawas (
    idPanitia int not null,
    Divisi varchar(50) not null,
    FOREIGN KEY (idPanitia) REFERENCES Panitia(idPanitia)
);

create table Dokter (
    idPanitia int not null,
    spesialis varchar(50) not null,
    FOREIGN KEY (idPanitia) REFERENCES Panitia(idPanitia)
);

create table Kelolosan (
	idPass INT PRIMARY KEY,
	passingGrade INT
);

create table Seleksi (
	idSeleksi INT primary key,
	idPass INT,
	tanggalSeleksi DATE,
	Foreign Key (idPass) references Kelolosan(idPass)
);

create table Wawancara (
	idWawancara INT ,
	jenisWawancara VARCHAR(20),
	sesiWawancara VARCHAR(20),
	Foreign Key (idWawancara) references Seleksi(idSeleksi)
);

create table Psikotest (
	idPsikotest INT,
	ruangPsikotest VARCHAR(20),
	sesiPsikotest VARCHAR(20),
	Foreign Key (idPsikotest) references Seleksi(idSeleksi)
);

create table TesKesehatan (
	idTesKesehatan INT,
	rumahSakit VARCHAR(20),
	kota VARCHAR(20),
	Foreign Key (idTesKesehatan) references Seleksi(idSeleksi)
);

create table Diwawancara (
	idWawancara INT,
	idPanitia INT,
	Foreign Key (idWawancara) references Wawancara(idWawancara),
	Foreign Key (idPanitia) references Panitia(idPanitia)
);

create table Diawasi (
	idPsikotest INT,
	idPanitia INT,
	Foreign key (idPsikotest) references Psikotest(idPsikotest),
	Foreign key (idPanitia) references Panitia(idPanitia)
);

create table Diperiksa (
	idTesKesehatan INT,
	idPanitia INT,
	Foreign key (idTesKesehatan) references TesKesehatan(idTesKesehatan),
	Foreign key (idPanitia) references Panitia(idPanitia)
);

create table infoPendaftar (
	idMahasiswa INT not null PRIMARY KEY,
	namaLengkap VARCHAR(50),
	jenisKelamin VARCHAR(50),
	tempatLahir VARCHAR(50),
	tanggalLahir DATE,
	alamat VARCHAR(50),
	noTelp VARCHAR(50),
	email VARCHAR(50),
	kelengkapan VARCHAR(50)
);

create table nilaiWawancaraPendaftar (
	idWawancara INT,
	nilaiWawancara DECIMAL(5,2),
	FOREIGN KEY (idWawancara) REFERENCES Wawancara (idWawancara)
);

create table nilaiPsikotestPendaftar (
	idPsikotest INT,
	nilaiPsikotest DECIMAL(5,2),
	FOREIGN KEY (idPsikotest) REFERENCES Psikotest (idPsikotest)
);

create table nilaiTesKesehatanPendaftar (
	idTesKesehatan INT,
	nilaiTesKesehatan DECIMAL(5,2),
	FOREIGN KEY (idTesKesehatan) REFERENCES TesKesehatan (idTesKesehatan)
);

create table tesPendaftar (
	idMahasiswa INT not null PRIMARY KEY, 
	idWawancara INT,
	idPsikotest INT,
	idTesKesehatan INT,
	FOREIGN KEY (idMahasiswa) REFERENCES infoPendaftar(idMahasiswa),
	FOREIGN KEY (idPsikotest) REFERENCES nilaiPsikotestPendaftar (idPsikotest),
	FOREIGN KEY (idTesKesehatan) REFERENCES nilaiTesKesehatanPendaftar (idTesKesehatan),
	CHECK ((idWawancara IS NOT NULL AND idPsikotest IS NOT NULL) OR idPsikotest IS NULL),
    CHECK ((idTesKesehatan IS NOT NULL AND idPsikotest IS NOT NULL) OR idTesKesehatan IS NULL)
);

create table Beasiswa (
	idMahasiswa INT,
	universitas VARCHAR(50),
	prodi VARCHAR(50),
	jumlahDana INT,
	FOREIGN KEY (idMahasiswa) REFERENCES infoPendaftar(idMahasiswa)
);

create table Dokumen (
	idMahasiswa INT not null,
	idDokumen INT PRIMARY KEY not null,
	jenis INT not null,
	link VARCHAR(50) not null,
	FOREIGN KEY (idMahasiswa) REFERENCES infoPendaftar(idMahasiswa)
);

insert into Panitia (idPanitia, namaLengkap) values (1, 'Vanya Piche');
insert into Panitia (idPanitia, namaLengkap) values (2, 'Fianna Goathrop');
insert into Panitia (idPanitia, namaLengkap) values (3, 'Alexio Rowan');
insert into Panitia (idPanitia, namaLengkap) values (4, 'Aurea Abrehart');
insert into Panitia (idPanitia, namaLengkap) values (5, 'Grenville Alam');
insert into Panitia (idPanitia, namaLengkap) values (6, 'Judas Avramov');
insert into Panitia (idPanitia, namaLengkap) values (7, 'Glennie Berrill');
insert into Panitia (idPanitia, namaLengkap) values (8, 'Eduino Pietrasik');
insert into Panitia (idPanitia, namaLengkap) values (9, 'Liva Schurig');
insert into Panitia (idPanitia, namaLengkap) values (10, 'Nanine Mullord');
insert into Panitia (idPanitia, namaLengkap) values (11, 'Sal Lanham');
insert into Panitia (idPanitia, namaLengkap) values (12, 'Ysabel Camplen');
insert into Panitia (idPanitia, namaLengkap) values (13, 'Jereme Moulson');
insert into Panitia (idPanitia, namaLengkap) values (14, 'Shelly Pritchard');
insert into Panitia (idPanitia, namaLengkap) values (15, 'Ernest Freeborn');

insert into Pewawancara (idPanitia, jabatan) values (1, 'Ketua');
insert into Pewawancara (idPanitia, jabatan) values (2, 'Wakil Ketua');
insert into Pewawancara (idPanitia, jabatan) values (3, 'Staff HR');
insert into Pewawancara (idPanitia, jabatan) values (4, 'Staff HR');
insert into Pewawancara (idPanitia, jabatan) values (5, 'Staff HR');
insert into Pewawancara (idPanitia, jabatan) values (6, 'Staff HR');
insert into Pewawancara (idPanitia, jabatan) values (7, 'Staff HR');
insert into Pewawancara (idPanitia, jabatan) values (8, 'Manager');
insert into Pewawancara (idPanitia, jabatan) values (9, 'Manager');
insert into Pewawancara (idPanitia, jabatan) values (10, 'Manager');
insert into Pewawancara (idPanitia, jabatan) values (11, 'Supervisor');
insert into Pewawancara (idPanitia, jabatan) values (12, 'Supervisor');
insert into Pewawancara (idPanitia, jabatan) values (13, 'Supervisor');
insert into Pewawancara (idPanitia, jabatan) values (14, 'Supervisor');
insert into Pewawancara (idPanitia, jabatan) values (15, 'Supervisor');

insert into Panitia (idPanitia, namaLengkap) values (16, 'Casey Darrow');
insert into Panitia (idPanitia, namaLengkap) values (17, 'Carlita Proudler');
insert into Panitia (idPanitia, namaLengkap) values (18, 'Ainslee Britner');
insert into Panitia (idPanitia, namaLengkap) values (19, 'Melinde Whether');

insert into Pengawas (idPanitia, Divisi) values (16, 'Lapangan');
insert into Pengawas (idPanitia, Divisi) values (17, 'Lapangan');
insert into Pengawas (idPanitia, Divisi) values (18, 'Komdis');
insert into Pengawas (idPanitia, Divisi) values (19, 'Komdis');

insert into Panitia (idPanitia, namaLengkap) values (20, 'Mathian Reuven');
insert into Panitia (idPanitia, namaLengkap) values (21, 'Irving Gillis');
insert into Panitia (idPanitia, namaLengkap) values (22, 'Carey Buzzing');
insert into Panitia (idPanitia, namaLengkap) values (23, 'Rudyard Gayter');
insert into Panitia (idPanitia, namaLengkap) values (24, 'Harwilll Brundill');

insert into Dokter (idPanitia, spesialis) values (20, 'Umum');
insert into Dokter (idPanitia, spesialis) values (21, 'Umum');
insert into Dokter (idPanitia, spesialis) values (22, 'Umum');
insert into Dokter (idPanitia, spesialis) values (23, 'Umum');
insert into Dokter (idPanitia, spesialis) values (24, 'Umum');

insert into Kelolosan (idPass, passingGrade) values (1, 140);
insert into Kelolosan (idPass, passingGrade) values (2, 195);
insert into Kelolosan (idPass, passingGrade) values (3, 140);
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (1, 1, '2023-04-01');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (2, 1, '2023-04-01');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (3, 1, '2023-04-01');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (4, 1, '2023-04-01');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (5, 1, '2023-04-01');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (6, 1, '2023-04-01');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (7, 1, '2023-04-01');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (8, 1, '2023-04-01');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (9, 1, '2023-04-01');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (10, 1, '2023-04-01');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (11, 1, '2023-04-01');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (12, 1, '2023-04-01');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (13, 1, '2023-04-01');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (14, 1, '2023-04-01');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (15, 1, '2023-04-01');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (16, 1, '2023-04-01');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (17, 1, '2023-04-01');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (18, 1, '2023-04-01');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (19, 1, '2023-04-01');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (20, 1, '2023-04-01');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (21, 1, '2023-04-01');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (22, 1, '2023-04-01');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (23, 1, '2023-04-01');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (24, 1, '2023-04-01');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (25, 1, '2023-04-01');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (26, 1, '2023-04-01');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (27, 1, '2023-04-01');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (28, 1, '2023-04-01');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (29, 1, '2023-04-01');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (30, 1, '2023-04-01');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (31, 1, '2023-04-02');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (32, 1, '2023-04-02');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (33, 1, '2023-04-02');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (34, 1, '2023-04-02');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (35, 1, '2023-04-02');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (36, 1, '2023-04-02');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (37, 1, '2023-04-02');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (38, 1, '2023-04-02');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (39, 1, '2023-04-02');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (40, 1, '2023-04-02');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (41, 1, '2023-04-02');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (42, 1, '2023-04-02');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (43, 1, '2023-04-02');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (44, 1, '2023-04-02');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (45, 1, '2023-04-02');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (46, 1, '2023-04-02');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (47, 1, '2023-04-02');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (48, 1, '2023-04-02');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (49, 1, '2023-04-02');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (50, 1, '2023-04-02');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (51, 1, '2023-04-02');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (52, 1, '2023-04-02');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (53, 1, '2023-04-02');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (54, 1, '2023-04-02');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (55, 1, '2023-04-02');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (56, 1, '2023-04-02');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (57, 1, '2023-04-02');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (58, 1, '2023-04-02');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (59, 1, '2023-04-02');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (60, 1, '2023-04-02');


insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (61, 2, '2023-04-10');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (62, 2, '2023-04-10');


insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (63, 3, '2023-04-17');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (64, 3, '2023-04-15');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (65, 3, '2023-04-16');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (66, 3, '2023-04-17');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (67, 3, '2023-04-15');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (68, 3, '2023-04-18');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (69, 3, '2023-04-15');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (70, 3, '2023-04-16');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (71, 3, '2023-04-15');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (72, 3, '2023-04-15');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (73, 3, '2023-04-18');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (74, 3, '2023-04-16');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (75, 3, '2023-04-17');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (76, 3, '2023-04-16');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (77, 3, '2023-04-17');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (78, 3, '2023-04-18');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (79, 3, '2023-04-16');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (80, 3, '2023-04-18');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (81, 3, '2023-04-17');
insert into Seleksi (idSeleksi, idPass, tanggalSeleksi) values (82, 3, '2023-04-18');

insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (1, 'Luring', 'Pagi');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (2, 'Luring', 'Sore');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (3, 'Daring', 'Pagi');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (4, 'Daring', 'Sore');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (5, 'Luring', 'Pagi');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (6, 'Luring', 'Sore');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (7, 'Luring', 'Pagi');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (8, 'Luring', 'Sore');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (9, 'Daring', 'Pagi');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (10, 'Daring', 'Sore');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (11, 'Luring', 'Pagi');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (12, 'Luring', 'Sore');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (13, 'Luring', 'Pagi');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (14, 'Luring', 'Sore');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (15, 'Luring', 'Pagi');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (16, 'Luring', 'Sore');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (17, 'Luring', 'Pagi');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (18, 'Daring', 'Sore');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (19, 'Luring', 'Pagi');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (20, 'Luring', 'Sore');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (21, 'Luring', 'Pagi');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (22, 'Luring', 'Sore');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (23, 'Luring', 'Pagi');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (24, 'Luring', 'Sore');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (25, 'Luring', 'Pagi');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (26, 'Luring', 'Sore');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (27, 'Luring', 'Pagi');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (28, 'Luring', 'Sore');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (29, 'Luring', 'Pagi');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (30, 'Luring', 'Sore');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (31, 'Daring', 'Pagi');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (32, 'Daring', 'Sore');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (33, 'Luring', 'Pagi');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (34, 'Luring', 'Sore');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (35, 'Luring', 'Pagi');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (36, 'Luring', 'Sore');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (37, 'Luring', 'Pagi');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (38, 'Luring', 'Sore');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (39, 'Luring', 'Pagi');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (40, 'Luring', 'Sore');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (41, 'Daring', 'Pagi');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (42, 'Luring', 'Sore');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (43, 'Luring', 'Pagi');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (44, 'Luring', 'Sore');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (45, 'Luring', 'Pagi');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (46, 'Daring', 'Sore');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (47, 'Luring', 'Pagi');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (48, 'Luring', 'Sore');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (49, 'Luring', 'Pagi');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (50, 'Luring', 'Sore');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (51, 'Luring', 'Pagi');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (52, 'Luring', 'Sore');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (53, 'Luring', 'Pagi');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (54, 'Luring', 'Sore');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (55, 'Luring', 'Pagi');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (56, 'Luring', 'Sore');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (57, 'Luring', 'Pagi');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (58, 'Luring', 'Sore');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (59, 'Luring', 'Pagi');
insert into Wawancara (idWawancara, jenisWawancara, sesiWawancara) values (60, 'Luring', 'Sore');

insert into Psikotest (idPsikotest, ruangPsikotest, sesiPsikotest) values (61, 'Multipurpose', 'Pagi');
insert into Psikotest (idPsikotest, ruangPsikotest, sesiPsikotest) values (62, 'Lecture-03', 'Sore');

insert into TesKesehatan(idTesKesehatan, rumahSakit, kota) values (63, 'AMC', 'Bandung');
insert into TesKesehatan(idTesKesehatan, rumahSakit, kota) values (64, 'AMC', 'Bandung');
insert into TesKesehatan(idTesKesehatan, rumahSakit, kota) values (65, 'Borromeus', 'Bandung');
insert into TesKesehatan(idTesKesehatan, rumahSakit, kota) values (66, 'Borromeus', 'Bandung');
insert into TesKesehatan(idTesKesehatan, rumahSakit, kota) values (67, 'AMC', 'Bandung');
insert into TesKesehatan(idTesKesehatan, rumahSakit, kota) values (68, 'Hermina', 'Bandung');
insert into TesKesehatan(idTesKesehatan, rumahSakit, kota) values (69, 'Borromeus', 'Bandung');
insert into TesKesehatan(idTesKesehatan, rumahSakit, kota) values (70, 'Hermina', 'Bandung');
insert into TesKesehatan(idTesKesehatan, rumahSakit, kota) values (71, 'AMC', 'Bandung');
insert into TesKesehatan(idTesKesehatan, rumahSakit, kota) values (72, 'Borromeus', 'Bandung');
insert into TesKesehatan(idTesKesehatan, rumahSakit, kota) values (73, 'Borromeus', 'Bandung');
insert into TesKesehatan(idTesKesehatan, rumahSakit, kota) values (74, 'Hermina', 'Bandung');
insert into TesKesehatan(idTesKesehatan, rumahSakit, kota) values (75, 'Hermina', 'Bandung');
insert into TesKesehatan(idTesKesehatan, rumahSakit, kota) values (76, 'AMC', 'Bandung');
insert into TesKesehatan(idTesKesehatan, rumahSakit, kota) values (77, 'AMC', 'Bandung');
insert into TesKesehatan(idTesKesehatan, rumahSakit, kota) values (78, 'AMC', 'Bandung');
insert into TesKesehatan(idTesKesehatan, rumahSakit, kota) values (79, 'Borromeus', 'Bandung');
insert into TesKesehatan(idTesKesehatan, rumahSakit, kota) values (80, 'Hasan Sadikin', 'Bandung');
insert into TesKesehatan(idTesKesehatan, rumahSakit, kota) values (81, 'Borromeus', 'Bandung');
insert into TesKesehatan(idTesKesehatan, rumahSakit, kota) values (82, 'Hasan Sadikin', 'Bandung');

insert into Diwawancara(idWawancara, idPanitia) values (1, 3);
insert into Diwawancara(idWawancara, idPanitia) values (2, 3);
insert into Diwawancara(idWawancara, idPanitia) values (3, 1);
insert into Diwawancara(idWawancara, idPanitia) values (4, 1);
insert into Diwawancara(idWawancara, idPanitia) values (5, 2);
insert into Diwawancara(idWawancara, idPanitia) values (6, 2);
insert into Diwawancara(idWawancara, idPanitia) values (7, 8);
insert into Diwawancara(idWawancara, idPanitia) values (8, 8);
insert into Diwawancara(idWawancara, idPanitia) values (9, 11);
insert into Diwawancara(idWawancara, idPanitia) values (10, 11);
insert into Diwawancara(idWawancara, idPanitia) values (11, 12);
insert into Diwawancara(idWawancara, idPanitia) values (12, 12);
insert into Diwawancara(idWawancara, idPanitia) values (13, 4);
insert into Diwawancara(idWawancara, idPanitia) values (14, 4);
insert into Diwawancara(idWawancara, idPanitia) values (15, 9);
insert into Diwawancara(idWawancara, idPanitia) values (16, 9);
insert into Diwawancara(idWawancara, idPanitia) values (17, 14);
insert into Diwawancara(idWawancara, idPanitia) values (18, 14);
insert into Diwawancara(idWawancara, idPanitia) values (19, 5);
insert into Diwawancara(idWawancara, idPanitia) values (20, 5);
insert into Diwawancara(idWawancara, idPanitia) values (21, 6);
insert into Diwawancara(idWawancara, idPanitia) values (22, 6);
insert into Diwawancara(idWawancara, idPanitia) values (23, 7);
insert into Diwawancara(idWawancara, idPanitia) values (24, 7);
insert into Diwawancara(idWawancara, idPanitia) values (25, 10);
insert into Diwawancara(idWawancara, idPanitia) values (26, 10);
insert into Diwawancara(idWawancara, idPanitia) values (27, 13);
insert into Diwawancara(idWawancara, idPanitia) values (28, 13);
insert into Diwawancara(idWawancara, idPanitia) values (29, 15);
insert into Diwawancara(idWawancara, idPanitia) values (30, 15);
insert into Diwawancara(idWawancara, idPanitia) values (31, 5);
insert into Diwawancara(idWawancara, idPanitia) values (32, 5);
insert into Diwawancara(idWawancara, idPanitia) values (33, 2);
insert into Diwawancara(idWawancara, idPanitia) values (34, 2);
insert into Diwawancara(idWawancara, idPanitia) values (35, 3);
insert into Diwawancara(idWawancara, idPanitia) values (36, 3);
insert into Diwawancara(idWawancara, idPanitia) values (37, 1);
insert into Diwawancara(idWawancara, idPanitia) values (38, 1);
insert into Diwawancara(idWawancara, idPanitia) values (39, 8);
insert into Diwawancara(idWawancara, idPanitia) values (40, 8);
insert into Diwawancara(idWawancara, idPanitia) values (41, 15);
insert into Diwawancara(idWawancara, idPanitia) values (42, 15);
insert into Diwawancara(idWawancara, idPanitia) values (43, 13);
insert into Diwawancara(idWawancara, idPanitia) values (44, 13);
insert into Diwawancara(idWawancara, idPanitia) values (45, 10);
insert into Diwawancara(idWawancara, idPanitia) values (46, 10);
insert into Diwawancara(idWawancara, idPanitia) values (47, 7);
insert into Diwawancara(idWawancara, idPanitia) values (48, 7);
insert into Diwawancara(idWawancara, idPanitia) values (49, 6);
insert into Diwawancara(idWawancara, idPanitia) values (50, 6);
insert into Diwawancara(idWawancara, idPanitia) values (51, 4);
insert into Diwawancara(idWawancara, idPanitia) values (52, 4);
insert into Diwawancara(idWawancara, idPanitia) values (53, 14);
insert into Diwawancara(idWawancara, idPanitia) values (54, 14);
insert into Diwawancara(idWawancara, idPanitia) values (55, 9);
insert into Diwawancara(idWawancara, idPanitia) values (56, 9);
insert into Diwawancara(idWawancara, idPanitia) values (57, 5);
insert into Diwawancara(idWawancara, idPanitia) values (58, 5);
insert into Diwawancara(idWawancara, idPanitia) values (59, 12);
insert into Diwawancara(idWawancara, idPanitia) values (60, 12);

insert into Diawasi(idPsikotest, idPanitia) values (61, 16);
insert into Diawasi(idPsikotest, idPanitia) values (61, 19);
insert into Diawasi(idPsikotest, idPanitia) values (62, 16);
insert into Diawasi(idPsikotest, idPanitia) values (62, 19);

insert into Diperiksa (idTesKesehatan, idpanitia) values (63, 20);
insert into Diperiksa (idTesKesehatan, idpanitia) values (64, 20);
insert into Diperiksa (idTesKesehatan, idpanitia) values (65, 20);
insert into Diperiksa (idTesKesehatan, idpanitia) values (66, 21);
insert into Diperiksa (idTesKesehatan, idpanitia) values (67, 21);
insert into Diperiksa (idTesKesehatan, idpanitia) values (68, 20);
insert into Diperiksa (idTesKesehatan, idpanitia) values (69, 22);
insert into Diperiksa (idTesKesehatan, idpanitia) values (70, 21);
insert into Diperiksa (idTesKesehatan, idpanitia) values (71, 23);
insert into Diperiksa (idTesKesehatan, idpanitia) values (72, 24);
insert into Diperiksa (idTesKesehatan, idpanitia) values (73, 21);
insert into Diperiksa (idTesKesehatan, idpanitia) values (74, 22);
insert into Diperiksa (idTesKesehatan, idpanitia) values (75, 22);
insert into Diperiksa (idTesKesehatan, idpanitia) values (76, 23);
insert into Diperiksa (idTesKesehatan, idpanitia) values (77, 23);
insert into Diperiksa (idTesKesehatan, idpanitia) values (78, 22);
insert into Diperiksa (idTesKesehatan, idpanitia) values (79, 24);
insert into Diperiksa (idTesKesehatan, idpanitia) values (80, 23);
insert into Diperiksa (idTesKesehatan, idpanitia) values (81, 24);
insert into Diperiksa (idTesKesehatan, idpanitia) values (82, 24);

insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (1, 'Sibley Wilstead', 'Female', 'Rostokino', '2003-02-09', '8 Corscot Trail', '594-443-2923', 'swilstead0@tripod.com', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (2, 'Rockie Chaperling', 'Male', 'Luksuhin', '2003-01-12', '688 New Castle Drive', '734-999-4222', 'rchaperling1@berkeley.edu', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (3, 'Yalonda Tume', 'Female', 'Linköping', '2002-07-01', '9303 Everett Pass', '958-762-5367', 'ytume2@salon.com', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (4, 'Enrichetta Pittford', 'Female', 'Sanshilipu', '2003-01-14', '11239 Shopko Hill', '295-340-6335', 'epittford3@soup.io', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (5, 'Somerset Stears', 'Male', 'Baghdad', '2002-09-13', '4 Bunting Place', '722-493-2808', 'sstears4@artisteer.com', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (6, 'Tilly Ockenden', 'Female', 'Guatraché', '2002-07-28', '89 Troy Plaza', '473-682-9670', 'tockenden5@themeforest.net', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (7, 'Wylma Oxby', 'Female', 'Mbaké', '2002-06-12', '4212 Corscot Drive', '644-413-1581', 'woxby6@ycombinator.com', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (8, 'Stacee Latore', 'Female', 'Mahanoro', '2002-09-15', '04 Fairview Street', '723-138-4360', 'slatore7@vistaprint.com', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (9, 'Terri Starkey', 'Female', 'Yag La', '2003-01-30', '814 Butternut Road', '725-758-7116', 'tstarkey8@spotify.com', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (10, 'Dell Antley', 'Male', 'Leran Kulon', '2002-05-28', '03 Carioca Point', '563-735-6459', 'dantley9@hao123.com', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (11, 'Sumner Ditts', 'Male', 'Itsandra', '2002-10-28', '59371 Oak Terrace', '547-495-7611', 'sdittsa@storify.com', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (12, 'Klara Corkhill', 'Female', 'Serebryanyye Prudy', '2002-10-27', '0 Warbler Avenue', '902-717-6644', 'kcorkhillb@google.fr', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (13, 'Doy Bendle', 'Male', 'Brooklyn', '2002-07-04', '53797 Eagle Crest Parkway', '212-439-6249', 'dbendlec@creativecommons.org', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (14, 'Nana Hoolaghan', 'Female', 'Yashalta', '2002-11-17', '7917 Nancy Road', '185-905-3027', 'nhoolaghand@artisteer.com', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (15, 'Corina Aylesbury', 'Female', 'Oenunu', '2002-08-03', '40746 Westridge Parkway', '587-724-5144', 'caylesburye@cyberchimps.com', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (16, 'Scotti Walkling', 'Male', 'Talnakh', '2002-09-30', '41718 Iowa Hill', '280-669-7943', 'swalklingf@squarespace.com', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (17, 'Cindy Ensley', 'Female', 'Paoniawy-Bramura', '2002-11-03', '2 Buhler Court', '528-388-9679', 'censleyg@sohu.com', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (18, 'Elden Bercevelo', 'Male', 'Huilong', '2003-02-02', '40 Linden Pass', '676-879-8555', 'eberceveloh@psu.edu', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (19, 'Pall Alcorn', 'Male', 'Esch-sur-Alzette', '2003-02-21', '89026 Kinsman Terrace', '146-212-5576', 'palcorni@businesswire.com', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (20, 'Debor Pechacek', 'Female', 'Sabi', '2002-04-29', '4298 Artisan Pass', '830-334-3968', 'dpechacekj@cargocollective.com', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (21, 'Carlina Thripp', 'Female', 'Wates', '2002-04-20', '72 Hintze Terrace', '659-410-9484', 'cthrippk@blogspot.com', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (22, 'Ginny Saynor', 'Female', 'Bastos', '2002-07-06', '4296 Mcguire Terrace', '357-519-7433', 'gsaynorl@tripadvisor.com', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (23, 'Pincus Brunini', 'Male', 'Zhuji', '2002-06-12', '8455 Toban Place', '783-947-1535', 'pbruninim@amazon.de', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (24, 'Niven Coakley', 'Male', 'Carangola', '2002-12-20', '4337 American Road', '574-404-8737', 'ncoakleyn@tripadvisor.com', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (25, 'Saul Sharpin', 'Male', 'Birigui', '2003-01-16', '2 Crescent Oaks Point', '909-368-1305', 'ssharpino@g.co', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (26, 'Kessia Aristide', 'Female', 'Nukualofa', '2002-12-14', '6598 Holy Cross Crossing', '371-495-1452', 'karistidep@dion.ne.jp', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (27, 'Curcio Keast', 'Male', 'Punta Gorda', '2002-12-06', '12896 Fallview Circle', '941-447-3141', 'ckeastq@twitter.com', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (28, 'Juieta Courcey', 'Female', 'Mabalacat', '2002-09-21', '9 Rockefeller Trail', '908-542-1148', 'jcourceyr@europa.eu', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (29, 'Hermine Charles', 'Female', 'Florencio Varela', '2002-12-12', '5227 Dryden Avenue', '739-216-3400', 'hcharless@bravesites.com', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (30, 'Ola Wainer', 'Female', 'Shinyanga', '2003-02-09', '867 Fremont Street', '671-304-1795', 'owainert@java.com', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (31, 'Karlis Penddreth', 'Male', 'Lücheng', '2002-05-06', '59 Pawling Crossing', '709-975-4099', 'kpenddrethu@jimdo.com', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (32, 'Mariette Lidster', 'Female', 'Kopen', '2002-11-09', '93 Carioca Junction', '123-594-8362', 'mlidsterv@usda.gov', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (33, 'Delbert Petkov', 'Male', 'Ribeirão Preto', '2002-11-03', '5 Anzinger Alley', '396-436-3504', 'dpetkovw@jigsy.com', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (34, 'Laney Gheeraert', 'Male', 'Kelowna', '2002-05-10', '997 Twin Pines Hill', '554-674-2024', 'lgheeraertx@aboutads.info', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (35, 'Romola Allabarton', 'Female', 'Huazhu', '2002-04-30', '25514 Bowman Way', '994-415-9559', 'rallabartony@wufoo.com', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (36, 'Lockwood Clampin', 'Male', 'Jingxiyuan', '2002-06-07', '431 Elgar Point', '965-391-8779', 'lclampinz@tmall.com', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (37, 'Daffy Whitmore', 'Female', 'Xinandu', '2002-04-26', '762 Melvin Terrace', '269-508-9986', 'dwhitmore10@1und1.de', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (38, 'Raff Rohlfs', 'Male', 'Nikolsk', '2002-05-16', '5989 Harper Center', '557-563-3423', 'rrohlfs11@elegantthemes.com', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (39, 'Darda Hamblington', 'Female', 'Zuocun', '2002-10-09', '0 Towne Terrace', '361-542-4920', 'dhamblington12@drupal.org', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (40, 'Ian Kellitt', 'Male', 'Vetluzhskiy', '2002-06-28', '395 Bunting Drive', '375-348-3728', 'ikellitt13@drupal.org', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (41, 'Marie-jeanne Chedzoy', 'Female', 'Shatoujiao', '2002-11-25', '23 Artisan Hill', '791-274-2177', 'mchedzoy14@yellowbook.com', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (42, 'Meghann Abbitt', 'Female', 'Tanggan', '2002-09-27', '8616 Delaware Trail', '904-929-1347', 'mabbitt15@kickstarter.com', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (43, 'Madelaine Irnis', 'Female', 'Kuala Bintang', '2002-07-25', '33 Express Drive', '990-401-3290', 'mirnis16@springer.com', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (44, 'Saundra Birkenhead', 'Male', 'Amassoma', '2002-06-22', '701 Birchwood Parkway', '522-221-5386', 'sbirkenhead17@google.co.uk', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (45, 'Arly Halwill', 'Female', 'Polyarnyye Zori', '2002-10-12', '45 Schurz Junction', '345-299-1212', 'ahalwill18@webmd.com', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (46, 'Alena Rubrow', 'Female', 'Kil', '2002-11-15', '2 8th Way', '811-294-6729', 'arubrow19@pinterest.com', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (47, 'Buddy Paradyce', 'Male', 'Berlin', '2002-12-27', '91539 Shelley Place', '578-506-5654', 'bparadyce1a@ed.gov', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (48, 'Rouvin Garlicke', 'Male', 'Bhatpara Abhaynagar', '2002-10-31', '021 Scott Place', '780-652-4412', 'rgarlicke1b@google.de', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (49, 'Rolfe Wiltshire', 'Male', 'Wakuya', '2002-10-17', '2846 North Center', '432-151-3564', 'rwiltshire1c@dmoz.org', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (50, 'Halie Challice', 'Female', 'Torreira', '2002-06-17', '2225 Rockefeller Parkway', '376-618-2519', 'hchallice1d@dedecms.com', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (51, 'Bryanty Tideswell', 'Male', 'Sipe Sipe', '2002-09-19', '1273 Park Meadow Hill', '968-672-7274', 'btideswell1e@etsy.com', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (52, 'Nanny Toffoletto', 'Female', 'Choropampa', '2002-06-26', '3 Towne Center', '987-329-1897', 'ntoffoletto1f@privacy.gov.au', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (53, 'Yancey Pavlasek', 'Male', 'Penitik', '2002-10-27', '13 Starling Terrace', '997-483-2632', 'ypavlasek1g@msn.com', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (54, 'Matty Greve', 'Male', 'Sepidan', '2002-04-06', '661 Blue Bill Park Hill', '742-931-8376', 'mgreve1h@people.com.cn', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (55, 'Rabbi Santos', 'Male', 'Yamaga', '2002-10-15', '949 Ohio Center', '359-730-0877', 'rsantos1i@paypal.com', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (56, 'Casey Hadlington', 'Male', 'Arad', '2003-01-13', '0152 Katie Place', '272-590-6617', 'chadlington1j@npr.org', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (57, 'Cleveland Vuitton', 'Male', 'Den Haag', '2002-08-27', '0 Bellgrove Pass', '961-455-3219', 'cvuitton1k@woothemes.com', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (58, 'Aubert Bullin', 'Male', 'Berlin', '2002-12-06', '05 Kipling Lane', '647-134-3931', 'abullin1l@apache.org', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (59, 'Bart Itzkov', 'Male', 'Kastornoye', '2002-08-23', '284 Springview Point', '983-247-4187', 'bitzkov1m@blogspot.com', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (60, 'Ruthie Decreuze', 'Female', 'Neglasari', '2002-08-03', '885 Ilene Pass', '465-568-9675', 'rdecreuze1n@yelp.com', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (61, 'Carlita Inett', 'Female', 'Ganhe', '2002-06-05', '4711 Hallows Place', '807-953-1504', 'cinett1o@ebay.co.uk', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (62, 'Catherin Stratz', 'Female', 'Renko', '2002-08-13', '90 Michigan Terrace', '143-722-1781', 'cstratz1p@utexas.edu', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (63, 'Dasya Kopf', 'Female', 'Skuratovskiy', '2002-11-07', '8601 Eagan Pass', '518-124-2142', 'dkopf1q@altervista.org', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (64, 'Roselin Sterley', 'Female', 'Ma''an', '2002-12-14', '85 Fallview Parkway', '728-423-1501', 'rsterley1r@youtube.com', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (65, 'Farrand Lumsdale', 'Female', 'Almendra', '2002-09-29', '606 Helena Pass', '183-711-9448', 'flumsdale1s@sbwire.com', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (66, 'Desi O''Towey', 'Male', 'Dembeni', '2002-12-06', '538 Homewood Alley', '479-594-2226', 'dotowey1t@rambler.ru', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (67, 'Anastasia Witnall', 'Female', 'Jammain', '2003-02-06', '468 Commercial Junction', '828-667-4670', 'awitnall1u@msu.edu', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (68, 'Thatch Tillett', 'Male', 'Guabito', '2002-12-13', '18881 Sloan Park', '697-313-0096', 'ttillett1v@intel.com', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (69, 'Jourdan Faunch', 'Female', 'Xiadian', '2002-05-08', '4 Rieder Plaza', '846-339-4920', 'jfaunch1w@cam.ac.uk', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (70, 'Coretta Sutter', 'Female', 'Sukumo', '2002-05-05', '87 Eastwood Street', '684-836-9314', 'csutter1x@harvard.edu', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (71, 'Yanaton Joseff', 'Male', 'Malveira', '2003-02-12', '61 Prairieview Avenue', '840-942-8166', 'yjoseff1y@irs.gov', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (72, 'Wittie Littell', 'Male', 'Volzhskiy', '2002-04-08', '104 Prairieview Way', '662-420-6197', 'wlittell1z@addtoany.com', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (73, 'Rosemarie Lankham', 'Female', 'Manta', '2003-01-24', '32 Londonderry Drive', '780-412-7705', 'rlankham20@mtv.com', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (74, 'Giana Timothy', 'Female', 'Västra Frölunda', '2003-01-26', '809 Dennis Pass', '786-553-8827', 'gtimothy21@apple.com', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (75, 'Shelagh Bartolomeotti', 'Female', 'Honolulu', '2002-10-11', '1277 Chive Trail', '808-543-4875', 'sbartolomeotti22@intel.com', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (76, 'Mirna Gelletly', 'Female', 'Badin', '2002-06-21', '231 Westend Trail', '810-320-4548', 'mgelletly23@cnbc.com', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (77, 'Jason Mixworthy', 'Male', 'Binuangan', '2002-12-17', '72979 Mifflin Terrace', '794-259-8465', 'jmixworthy24@loc.gov', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (78, 'Meggi Kingswood', 'Female', 'Dauphin', '2002-10-07', '57 Prairieview Avenue', '384-155-1897', 'mkingswood25@ustream.tv', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (79, 'Wilie Fonte', 'Female', 'Nha Be', '2002-09-09', '74 Manufacturers Drive', '942-904-3296', 'wfonte26@phoca.cz', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (80, 'Annalise Alfonzo', 'Female', 'Cabarroguis', '2002-07-05', '322 Scott Lane', '543-639-4092', 'aalfonzo27@de.vu', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (81, 'Thaxter Allsworth', 'Male', 'Helmsange', '2002-08-19', '34 Waywood Point', '714-300-4983', 'tallsworth28@live.com', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (82, 'Kerstin Esterbrook', 'Female', 'Wuyahe', '2002-12-30', '7455 Forest Court', '108-538-7828', 'kesterbrook29@liveinternet.ru', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (83, 'Ilse McBrearty', 'Female', 'Xinbao', '2003-02-12', '262 Southridge Road', '970-437-5111', 'imcbrearty2a@miibeian.gov.cn', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (84, 'Ronnie Moraleda', 'Female', 'Crauthem', '2002-09-21', '58931 Dexter Center', '372-528-8228', 'rmoraleda2b@geocities.com', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (85, 'Tera Vannoni', 'Female', 'Bangan-Oda', '2002-06-13', '0045 Butternut Way', '621-502-2607', 'tvannoni2c@sbwire.com', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (86, 'Wallace Rabjohn', 'Male', 'Shchuchin', '2002-04-11', '24 Kim Drive', '586-271-7819', 'wrabjohn2d@ifeng.com', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (87, 'Chelsie Andrys', 'Female', 'Gunung Talang', '2002-08-17', '7 Melvin Terrace', '718-986-8682', 'candrys2e@instagram.com', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (88, 'Petronille Bydaway', 'Female', 'Haoxinying', '2002-12-12', '3 Loomis Hill', '130-113-5545', 'pbydaway2f@yahoo.com', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (89, 'Oliver Densey', 'Male', 'Dos Quebradas', '2002-08-25', '1 Bluejay Point', '814-632-9764', 'odensey2g@timesonline.co.uk', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (90, 'Iorgo Garling', 'Male', 'Suchan', '2002-12-01', '03637 Logan Pass', '598-542-3324', 'igarling2h@alibaba.com', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (91, 'Alaric Josebury', 'Male', 'Stare Kurowo', '2003-02-02', '0070 Alpine Drive', '192-192-7822', 'ajosebury2i@flavors.me', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (92, 'Vasilis Pooke', 'Male', 'Jiangshan', '2002-08-30', '6564 Bowman Park', '764-820-5149', 'vpooke2j@scribd.com', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (93, 'Agnola Kittman', 'Female', 'Xindian', '2002-07-04', '17364 Arizona Place', '545-928-2019', 'akittman2k@tripadvisor.com', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (94, 'Chantalle Marvel', 'Female', 'Huangnaihai', '2003-03-02', '36 Del Sol Hill', '929-563-0997', 'cmarvel2l@rediff.com', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (95, 'Gauthier Leatham', 'Male', 'Farmahin', '2003-01-18', '628 David Crossing', '630-285-1010', 'gleatham2m@webs.com', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (96, 'Meade Eckford', 'Male', 'San Simón', '2002-05-14', '26 Cody Center', '391-706-1952', 'meckford2n@bbc.co.uk', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (97, 'Wenona Antonognoli', 'Female', 'Saltsjo-Boo', '2002-07-04', '95 Graceland Hill', '904-415-2432', 'wantonognoli2o@cmu.edu', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (98, 'Ava Brickwood', 'Female', 'El Rosario', '2002-07-02', '64 Blaine Street', '755-312-7132', 'abrickwood2p@taobao.com', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (99, 'Daniela Baybutt', 'Female', 'Yantal', '2002-08-28', '676 Fremont Hill', '465-977-4767', 'dbaybutt2q@umn.edu', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (100, 'Peyton Kopfer', 'Male', 'Astara', '2002-06-09', '1380 Autumn Leaf Parkway', '888-867-2986', 'pkopfer2r@si.edu', true);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (101, 'Valry Isacq', 'Female', 'Dois Portos', '2003-02-20', '32870 Oneill Avenue', '591-970-9715', 'visacq2s@facebook.com', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (102, 'Orran Milkin', 'Male', 'Paritaman', '2002-09-09', '088 Roxbury Park', '498-673-6505', 'omilkin2t@4shared.com', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (103, 'Baxy Richt', 'Male', 'Paraipaba', '2002-10-06', '84334 Loeprich Court', '274-780-8146', 'bricht2u@lycos.com', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (104, 'Costanza Buesnel', 'Female', 'Capaj', '2002-07-19', '4 Fallview Crossing', '957-764-7422', 'cbuesnel2v@vinaora.com', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (105, 'Nixie Dodsley', 'Female', 'Dalianhe', '2002-12-06', '98 Drewry Street', '176-954-2029', 'ndodsley2w@goo.gl', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (106, 'Westley Grellier', 'Male', 'Raposos', '2002-08-11', '82 Mosinee Trail', '151-779-4049', 'wgrellier2x@weibo.com', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (107, 'Gladys Brandes', 'Female', 'Hudiksvall', '2002-10-17', '52 Warner Terrace', '516-533-9637', 'gbrandes2y@shop-pro.jp', false);
insert into infoPendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan) values (108, 'Griff Stanyland', 'Male', 'Lawonda', '2002-09-03', '7840 Oak Valley Circle', '406-720-4752', 'gstanyland2z@toplist.cz', false);

insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (1, 86.91);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (2, 60.84);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (3, 296.91);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (4, 185.19);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (5, 188.27);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (6, 125.4);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (7, 230.76);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (8, 228.63);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (9, 200.73);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (10, 280.96);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (11, 7.25);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (12, 128.75);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (13, 297.14);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (14, 355.02);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (15, 337.69);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (16, 165.51);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (17, 208.38);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (18, 381.03);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (19, 88.59);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (20, 288.17);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (21, 295.12);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (22, 254.52);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (23, 315.69);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (24, 88.31);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (25, 81.63);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (26, 248.6);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (27, 396.28);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (28, 22.12);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (29, 35.82);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (30, 154.04);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (31, 107.64);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (32, 102.49);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (33, 222.37);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (34, 281.66);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (35, 269.87);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (36, 338.26);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (37, 26.61);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (38, 218.49);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (39, 334.84);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (40, 291.18);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (41, 305.09);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (42, 220.16);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (43, 250.1);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (44, 290.1);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (45, 271.09);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (46, 213.34);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (47, 31.6);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (48, 287.16);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (49, 172.25);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (50, 39.82);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (51, 280.73);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (52, 3.58);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (53, 17.7);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (54, 216.45);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (55, 148.78);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (56, 197.28);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (57, 98.29);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (58, 111.82);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (59, 125.8);
insert into nilaiWawancaraPendaftar (idWawancara, nilaiWawancara) values (60, 212.17);

insert into nilaiPsikotestPendaftar (idPsikotest, nilaiPsikotest) values (62, 383.76);
insert into nilaiPsikotestPendaftar (idPsikotest, nilaiPsikotest) values (62, 42.65);
insert into nilaiPsikotestPendaftar (idPsikotest, nilaiPsikotest) values (62, 286.2);
insert into nilaiPsikotestPendaftar (idPsikotest, nilaiPsikotest) values (62, 47.09);
insert into nilaiPsikotestPendaftar (idPsikotest, nilaiPsikotest) values (62, 293.57);
insert into nilaiPsikotestPendaftar (idPsikotest, nilaiPsikotest) values (62, 241.62);
insert into nilaiPsikotestPendaftar (idPsikotest, nilaiPsikotest) values (61, 309.36);
insert into nilaiPsikotestPendaftar (idPsikotest, nilaiPsikotest) values (62, 195.96);
insert into nilaiPsikotestPendaftar (idPsikotest, nilaiPsikotest) values (61, 95.39);
insert into nilaiPsikotestPendaftar (idPsikotest, nilaiPsikotest) values (61, 7.59);
insert into nilaiPsikotestPendaftar (idPsikotest, nilaiPsikotest) values (61, 53.2);
insert into nilaiPsikotestPendaftar (idPsikotest, nilaiPsikotest) values (61, 278.71);
insert into nilaiPsikotestPendaftar (idPsikotest, nilaiPsikotest) values (62, 87.05);
insert into nilaiPsikotestPendaftar (idPsikotest, nilaiPsikotest) values (62, 317.11);
insert into nilaiPsikotestPendaftar (idPsikotest, nilaiPsikotest) values (61, 236.65);
insert into nilaiPsikotestPendaftar (idPsikotest, nilaiPsikotest) values (61, 168.86);
insert into nilaiPsikotestPendaftar (idPsikotest, nilaiPsikotest) values (61, 167.12);
insert into nilaiPsikotestPendaftar (idPsikotest, nilaiPsikotest) values (61, 134.28);
insert into nilaiPsikotestPendaftar (idPsikotest, nilaiPsikotest) values (61, 121.98);
insert into nilaiPsikotestPendaftar (idPsikotest, nilaiPsikotest) values (61, 259.31);
insert into nilaiPsikotestPendaftar (idPsikotest, nilaiPsikotest) values (62, 168.24);
insert into nilaiPsikotestPendaftar (idPsikotest, nilaiPsikotest) values (62, 372.18);
insert into nilaiPsikotestPendaftar (idPsikotest, nilaiPsikotest) values (62, 43.88);
insert into nilaiPsikotestPendaftar (idPsikotest, nilaiPsikotest) values (62, 62.28);
insert into nilaiPsikotestPendaftar (idPsikotest, nilaiPsikotest) values (62, 33.93);
insert into nilaiPsikotestPendaftar (idPsikotest, nilaiPsikotest) values (61, 85.24);
insert into nilaiPsikotestPendaftar (idPsikotest, nilaiPsikotest) values (61, 3.98);
insert into nilaiPsikotestPendaftar (idPsikotest, nilaiPsikotest) values (61, 169.28);
insert into nilaiPsikotestPendaftar (idPsikotest, nilaiPsikotest) values (62, 263.82);
insert into nilaiPsikotestPendaftar (idPsikotest, nilaiPsikotest) values (61, 105.11);
insert into nilaiPsikotestPendaftar (idPsikotest, nilaiPsikotest) values (61, 39.94);
insert into nilaiPsikotestPendaftar (idPsikotest, nilaiPsikotest) values (62, 199.13);
insert into nilaiPsikotestPendaftar (idPsikotest, nilaiPsikotest) values (61, 206.98);
insert into nilaiPsikotestPendaftar (idPsikotest, nilaiPsikotest) values (61, 227.53);
insert into nilaiPsikotestPendaftar (idPsikotest, nilaiPsikotest) values (62, 265.38);
insert into nilaiPsikotestPendaftar (idPsikotest, nilaiPsikotest) values (62, 372.09);
insert into nilaiPsikotestPendaftar (idPsikotest, nilaiPsikotest) values (61, 288.24);
insert into nilaiPsikotestPendaftar (idPsikotest, nilaiPsikotest) values (61, 264.61);
insert into nilaiPsikotestPendaftar (idPsikotest, nilaiPsikotest) values (61, 345.57);
insert into nilaiPsikotestPendaftar (idPsikotest, nilaiPsikotest) values (62, 158.69);

insert into nilaiTesKesehatanPendaftar (idTesKesehatan, nilaiTesKesehatan) values (68, 55.66);
insert into nilaiTesKesehatanPendaftar (idTesKesehatan, nilaiTesKesehatan) values (64, 321.13);
insert into nilaiTesKesehatanPendaftar (idTesKesehatan, nilaiTesKesehatan) values (72, 71.77);
insert into nilaiTesKesehatanPendaftar (idTesKesehatan, nilaiTesKesehatan) values (73, 149.99);
insert into nilaiTesKesehatanPendaftar (idTesKesehatan, nilaiTesKesehatan) values (74, 31.08);
insert into nilaiTesKesehatanPendaftar (idTesKesehatan, nilaiTesKesehatan) values (66, 92.7);
insert into nilaiTesKesehatanPendaftar (idTesKesehatan, nilaiTesKesehatan) values (82, 265.25);
insert into nilaiTesKesehatanPendaftar (idTesKesehatan, nilaiTesKesehatan) values (63, 87.07);
insert into nilaiTesKesehatanPendaftar (idTesKesehatan, nilaiTesKesehatan) values (79, 16.11);
insert into nilaiTesKesehatanPendaftar (idTesKesehatan, nilaiTesKesehatan) values (67, 251.11);
insert into nilaiTesKesehatanPendaftar (idTesKesehatan, nilaiTesKesehatan) values (76, 348.39);
insert into nilaiTesKesehatanPendaftar (idTesKesehatan, nilaiTesKesehatan) values (75, 48.36);
insert into nilaiTesKesehatanPendaftar (idTesKesehatan, nilaiTesKesehatan) values (81, 253.35);
insert into nilaiTesKesehatanPendaftar (idTesKesehatan, nilaiTesKesehatan) values (65, 297.1);
insert into nilaiTesKesehatanPendaftar (idTesKesehatan, nilaiTesKesehatan) values (70, 239.1);
insert into nilaiTesKesehatanPendaftar (idTesKesehatan, nilaiTesKesehatan) values (80, 72.67);
insert into nilaiTesKesehatanPendaftar (idTesKesehatan, nilaiTesKesehatan) values (78, 310.89);
insert into nilaiTesKesehatanPendaftar (idTesKesehatan, nilaiTesKesehatan) values (77, 78.38);
insert into nilaiTesKesehatanPendaftar (idTesKesehatan, nilaiTesKesehatan) values (69, 383.77);
insert into nilaiTesKesehatanPendaftar (idTesKesehatan, nilaiTesKesehatan) values (71, 77.11);

insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (1, 1, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (2, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (3, 2, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (4, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (5, 3, 62, 68);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (6, 4, 62, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (7, 5, 62, 64);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (8, 6, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (9, 7, 62, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (10, 8, 62, 72);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (11, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (12, 9, 62, 73);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (13, 10, 61, 74);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (14, 11, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (15, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (16, 12, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (17, 13, 62, 66);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (18, 14, 61, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (19, 15, 61, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (20, 16, 61, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (21, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (22, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (23, 17, 61, 82);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (24, 18, 62, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (25, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (26, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (27, 19, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (28, 20, 62, 63);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (29, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (30, 21, 61, 79);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (31, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (32, 22, 61, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (33, 23, 61, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (34, 24, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (35, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (36, 25, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (37, 26, 61, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (38, 27, 61, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (39, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (40, 28, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (41, 29, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (42, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (43, 30, 61, 67);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (44, 31, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (45, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (46, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (47, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (48, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (49, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (50, 32, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (51, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (52, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (53, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (54, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (55, 33, 62, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (56, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (57, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (58, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (59, 34, 62, 76);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (60, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (61, 35, 62, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (62, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (63, 36, 62, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (64, 37, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (65, 38, 62, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (66, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (67, 39, 61, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (68, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (69, 40, 61, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (70, 41, 61, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (71, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (72, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (73, 42, 62, 75);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (74, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (75, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (76, 43, 61, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (77, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (78, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (79, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (80, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (81, 44, 61, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (82, 45, 62, 81);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (83, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (84, 46, 61, 65);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (85, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (86, 47, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (87, 48, 61, 70);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (88, 49, 62, 80);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (89, 50, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (90, 51, 62, 78);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (91, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (92, 52, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (93, 53, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (94, 54, 61, 77);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (95, 55, 61, 69);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (96, 56, 61, 71);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (97, 57, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (98, 58, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (99, 59, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (100, 60, 62, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (101, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (102, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (103, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (104, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (105, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (106, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (107, NULL, NULL, NULL);
insert into tesPendaftar (idMahasiswa, idWawancara, idPsikotest, idTesKesehatan) values (108, NULL, NULL, NULL);

insert into Beasiswa (idMahasiswa, universitas, prodi, jumlahDana) values (7, 'Academy of Arts', 'Graphic Design', 1090);
insert into Beasiswa (idMahasiswa, universitas, prodi, jumlahDana) values (12, 'Rocky Mountain College of Art and Design' ,'Fashion Design', 1238);
insert into Beasiswa (idMahasiswa, universitas, prodi, jumlahDana) values (23, 'University of the West of England, Bristol','Computer Science', 1316);
insert into Beasiswa (idMahasiswa, universitas, prodi, jumlahDana) values (43, 'China University of Geosciences Wuhan', 'Geology', 1312);
insert into Beasiswa (idMahasiswa, universitas, prodi, jumlahDana) values (59, 'World University of Bangladesh', 'Communication', 1025);
insert into Beasiswa (idMahasiswa, universitas, prodi, jumlahDana) values (82, 'Université Ibn Zohr Agadir', 'Pharmacy', 1488);
insert into Beasiswa (idMahasiswa, universitas, prodi, jumlahDana) values (84, 'Universidade Federal da Grande Dourados', 'Mechanical Engineering', 1223);
insert into Beasiswa (idMahasiswa, universitas, prodi, jumlahDana) values (87, 'Free University Institute "Carlo Cattaneo"', 'International Law', 1125);
insert into Beasiswa (idMahasiswa, universitas, prodi, jumlahDana) values (90, 'Alahgaff University', 'Architecture', 1408);
insert into Beasiswa (idMahasiswa, universitas, prodi, jumlahDana) values (95, 'Institute of Management Sciences, Lahore (IMS)', 'Management', 1016);

insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (1, 1, 1, '1KgGvXp52ZhD84AiLaH5ueMzr5MN89iojw');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (2, 2, 1, '1MSt5kvonmPSkwMZp8iDANN9zW1nxZYEmA');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (3, 3, 1, '1Ns4L5CT7KRye5oFLBmzAgCG3h8GnsEd1C');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (4, 4, 1, '1ALGFiqVpCSjsHocFbzBC98puTZLm3p5hg');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (5, 5, 1, '1kcN9r27skLnhGM6DLuaDErbAgAjATK4V');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (6, 6, 1, '1CtyLky94y2tU6j3yK2CsSCnSB5T3jwDNc');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (7, 7, 1, '13eEmiAiMLDrKUv9ecMyy3ueHazX9nAscU');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (8, 8, 1, '1G1MYb6T4jqusVTaLVNyASmbLKHM6UCot9');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (9, 9, 1, '14n3het3qW9ek2XpW1TQYtAz74Vz9df9GR');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (10, 10, 1, '1Ft1D1axPiJik8oTWjQNKbDtVDda1QN6kg');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (11, 11, 1, '1P4H2a5qdUryY18tEnHuhjfutcHW8Ntoa7');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (12, 12, 1, '18gvgamYrKLhNLgUiiBxzAyowS5WYTVVMX');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (13, 13, 1, '1GKs2t4u6M1QGbMbg9Xcey8xZFhhUxMTey');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (14, 14, 1, '1MYThUzgzDX9CrVtEmc4WW1BBFe1MnZVdK');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (15, 15, 1, '1QFGJEummvvkL64CAu6nx4tCythydg5Pr4');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (16, 16, 1, '12qraR2MkVKrRgFaDj3cw4gRjdShkTzHoF');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (17, 17, 1, '1BWEWHR494xRtvrCZ4p3brYCYJSFsKo7vs');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (18, 18, 1, '1GZAZZhJAYmHkZv5ZX4e8SLt7GgMPmt3KW');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (19, 19, 1, '1CMP48Wym4NcT2hs2pbH4wRSz31ZaQDZ7H');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (20, 20, 1, '1PV9C2N5EAvanpe2BhFuEaLC2PBZtv5fDJ');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (21, 21, 1, '1HwBmzfD6TAgTcd9CoHLqiFrzsC2rqkx74');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (22, 22, 1, '1NpC2qFT79Fm6jPowjPgCn9kEDBR7KPf2h');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (23, 23, 1, '1CadR5dmFKgfM3DWsHdexGuHpDmrDPuEXF');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (24, 24, 1, '12dCsyuNsXZZLkDBuT59N5jnZQ78eri8FT');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (25, 25, 1, '15Wp68w7LTiFLPoEKqp7cnxGs31c3hDrEp');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (26, 26, 1, '18AkFsSssS45TDR1nCyjggYGqCtPwJRhNa');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (27, 27, 1, '14yZUgtR5gR4dba3GqW4SvwhzoNvEFu6qv');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (28, 28, 1, '1ETtmk8XS2K675tAuq5zfWwLkFY1UpMPNZ');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (29, 29, 1, '14hN5MRUzNJHMR1nTrRq6wBdTUc1FjmQoG');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (30, 30, 1, '1942ka8eTxqAGhuUTFg9fy8Ausd9H2Fui2');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (31, 31, 1, '14aGNVKHknzNawfm7cg2EiapPxbao2Q1iv');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (32, 32, 1, '1NNbt4ohH51pXPJBTwBMFGh9D6s41dk3dM');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (33, 33, 1, '17LMBEXbZxUeucRhKoG99asAKvUefnyxhb');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (34, 34, 1, '17zRsq8CPZvoxfJ6A8y4XtxMMwWXmi1tTY');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (35, 35, 1, '14bW57zPGSv8fZbzrF6UK8ZNyUvZyPbuZB');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (36, 36, 1, '196Zeu4P1A5c4QpwV38saUzMMWMbhacTbS');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (37, 37, 1, '18vVtyFemEzWCnEFQbe79wxvpX6cJCiHgN');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (38, 38, 1, '1PJP6JRJcex9UXSZJCEMNVjAa7F95VLmYD');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (39, 39, 1, '1AomdhgZF9f7yLJQyALo4EPgfewyUNjnwi');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (40, 40, 1, '1ASn31wK8V557M6WPNzKWkRndQGdQvKraK');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (41, 41, 1, '14cJpUzFaYaXiogexW8awNVbVVe6TENKfP');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (42, 42, 1, '1H7d8kjpXTfTQyY2a6imNRUkMFVpJ4cHYm');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (43, 43, 1, '1JhuUserSVETuXVpZCV6PH2TuzNFJ1QnSo');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (44, 44, 1, '1jaHmyegWjH9rMb5z1FpyLPW9ctFGcrGW');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (45, 45, 1, '13DKCCBYu7iRDNA31EeNQ5heydzxDXkyj4');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (46, 46, 1, '191gCnihr4g1FwAWJz6nkjmDegpw2THRMN');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (47, 47, 1, '1PLhjkzAeTxf7mY6ZjpQk3v7YRpLX1txSj');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (48, 48, 1, '19i8A6vLJDu9PLiEYzXYVCP5QMqM8Pccec');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (49, 49, 1, '1HrXx9rT4UU29iGY6WsJez4T4gm6QtCtGw');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (50, 50, 1, '1D4XeP9gidjffo1NEyAo6Wi2RoDN6JUx6u');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (51, 51, 1, '1CDhuuqowCf5QsWp9nmzNjEywfB3F3ht6u');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (52, 52, 1, '1Hy4VsT7c5CFe1SxZExo9ehNcbNoN9XSM8');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (53, 53, 1, '1EHNMGHibzeaoTWYnjjKAf9ttwdY8NoWuS');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (54, 54, 1, '1NfYZCLHhaH89Du5BuBXHRYA9BXDoArKBF');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (55, 55, 1, '1QA16122RznNh2wdWR65o6HqB3Vcnm4FPY');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (56, 56, 1, '14CTFXMNK7d5MjPxFzFzMGRYagAKHjrF6b');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (57, 57, 1, '15DgjkvKm2SoVNscQJGU7L6kk3VzgouSh3');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (58, 58, 1, '1QKDGDntwpdAC1uZJ5Ar5RUzUNjSRsf5yo');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (59, 59, 1, '1DTkzT7RiTdxJAYfhF3cAPDvuU1JNikhpg');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (60, 60, 1, '191twpQam2wHA3e8CdKv9JHhfqdvoGGsQk');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (61, 61, 1, '167nDVabAEtzVQ292BtRbFof1EPedjiQ6J');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (62, 62, 1, '1FoE4HRbXoR73CjC3wuXJhdEvXURnD9Nj3');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (63, 63, 1, '1CbQj4N6uxDQVzgUB1zkfp38i7PTanFgrq');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (64, 64, 1, '16LF5ctVoeRHfMn3ee5ASz9xEX1DEQecCT');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (65, 65, 1, '15jHv592r7U23U4xV86Dd4TPR99Jf6vHKt');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (66, 66, 1, '1KNoEUrmcwHVUxNKUroVs8DHEnuiK9aZrf');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (67, 67, 1, '1PnvwvNATjAPbUAVAqiMbYQpU4owBsbYEK');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (68, 68, 1, '17bxupgFCkhrZs2NSnWzuUekcRHdhqud4P');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (69, 69, 1, '1LpwbyT9e5QzHiLTvahzFWvYuS9ogpvA8g');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (70, 70, 1, '1EgvZh6HunbzaASxSSHHy1UfrkvXzP1L52');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (71, 71, 1, '177XJWrjJ4oyPXw6NtsnwJhaeyj8YL5R43');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (72, 72, 1, '18QQMsXBNddeTeFFeW3eZ2iYNBwMJVR4Q6');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (73, 73, 1, '1ESjAjnB7Kuwk72Qk8833uGpyLQ4stAJGU');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (74, 74, 1, '16LTzUWMsju2ggW6KFmPZyKz9hggj2qT45');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (75, 75, 1, '12z9zkoVowYv7QUFBE3ruMnGdcHQiaEBcp');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (76, 76, 1, '12KjSZbsSwDd6ACutWqSZGg4AEDMntaWVr');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (77, 77, 1, '13ZJxQibzwbyEXJ4eMczHnPzA22Z1RoJAM');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (78, 78, 1, '1AqesyJfDQ6bw7nVkm6x1LwXg2kaB5jnus');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (79, 79, 1, '1HMgnYiYdN2w8pakEMXcGq2EafyG6Pns7b');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (80, 80, 1, '17pxPRiWSvNJBDCAfeSUZ6GKQEBWfz3ccT');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (81, 81, 1, '1JNfqmJhbvo2PX6woLpsW4vrjFDKCGmTbA');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (82, 82, 1, '1EbfCF38sV6B7BntwjUCrvZzTVfsn5xWvW');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (83, 83, 1, '1CTYaWDzHCtXbfj2E19ruiaHUEn9vewJYk');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (84, 84, 1, '1NTaAGybqyB5r9Wpc8Pqf1gcnsUKboKS4A');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (85, 85, 1, '1PA6Hm2soKAkfWBezdq1pzmSAB1xsyxVmC');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (86, 86, 1, '1GSqJ7nDyPwGdQ6EJTbBSjmiNDUgGFoafL');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (87, 87, 1, '1Mzd9XebLdNPZhK6GDCnaAjPDZAPacySNS');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (88, 88, 1, '1BwtyYHVZVAQG1mEqNJT2Cf9jpcMqg2tU6');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (89, 89, 1, '1P9Pw69J7axfcfcr4NdyjmEYcHoScQbkoY');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (90, 90, 1, '16WkA1QFPMZ9tWzN1dpUhbF9PbbvCTFYp3');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (91, 91, 1, '12kJuQaqJJUooumJm2Zss8Am2bAnLyia9P');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (92, 92, 1, '1PH427atYsRMYEWnsN7V8HanDDkLffXnRM');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (93, 93, 1, '14S59tNNd27mEBoYg8PfZt6DtKtXAGMWBD');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (94, 94, 1, '16EsXgeBySByk1qfHjjupZGL1kuZQ3o6pL');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (95, 95, 1, '168vmnuXKLfMUdn7Q8neUhs5Wb88So5GGe');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (96, 96, 1, '1ZLyeD6rEac5KDDFqx8mifTTqXQKUAjVe');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (97, 97, 1, '1CFk4tovEM88VB1oS4YdkfDLquih5KpVuh');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (98, 98, 1, '1DTJf9e9strNRpvn53CVUKPsHK5zSSAnja');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (99, 99, 1, '1G6PvwfnkBoT9fWLNnqDFvwfUx3G1R6QJJ');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (100, 100, 1, '1M7zQCZF9MZvMBgHq4UzqEbZ256jVT9RuX');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (101, 101, 1, '1AgbauFH9sPsxGTvF7kHC5wKW3cptxz4bt');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (102, 102, 1, '1LvVfDPKdYe4fF7wa7PnEQQPyAgXHvwrDP');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (103, 103, 1, '16KKtZTNwikRfMCMf1DNACGr8NKXXdfYLp');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (104, 104, 1, '18hfrBfQeNRGtt55mxRAFU7pDozadpZUy');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (105, 105, 1, '1GDa2knvQJdHiJKTetCuKWifmbyLNVkB8q');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (106, 106, 1, '1x1321J6LAu8epyPNSNQJmY18jnqvYQCU');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (107, 107, 1, '14vrAUzsYULGkAgnUYu5i7iaSuXw8unm6g');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (108, 108, 1, '1DWm4xCd5pYWL21rHtUGX48UfW2m4zXfy6');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (1, 109, 2, '13W88ZqiQkvG6iJf43irts4V2EuaChpZai');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (2, 110, 2, '14cSJmQhuU1jsfERTHhRkv6PsZdSB4n7rM');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (3, 111, 2, '15ajMHVe45d9mPNXbYYCuukDf2ApDLZHnt');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (4, 112, 2, '17niEeDfx6fC2eCuJ94L2NAmd4DgPhH3VH');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (5, 113, 2, '18PEsMrtx55B7XSjc4tAaFuzPpx6HbHiZ2');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (6, 114, 2, '1NZTh6ksnzvhfQQmnvQrQwX63r864KW8Wj');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (7, 115, 2, '1HKre17hMdues3kyT2D6M2qQZc7kSwEfW9');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (8, 116, 2, '154ZgLWTyRgYSFZN7pSh5ZiY3q3weUTT7S');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (9, 117, 2, '1KL1e6EUn4WX15ePo8MhtpfBDERpfz5juH');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (10, 118, 2, '1NTo2bvuPkP7oW6x4dcsnVLnnMQYVTxbjs');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (11, 119, 2, '1MGLJUnXHxeXcNms9CeSLb3jxi9d8GCfzD');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (12, 120, 2, '13NGBuMxqyms3nCt8TgZytwUMdZAiKC9qB');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (13, 121, 2, '13jr6ddSeJPLmcK6kuU17XbmdhowU1eDPL');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (14, 122, 2, '1Px15VijY7yXGuK95rjN968c6d6jBCzjJP');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (15, 123, 2, '1BQa1rofz7WWZFt7HWWj1wFj3qmdHWq5vH');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (16, 124, 2, '1KfwYF2DjHvT2gPAY7VZWfXjnqnQGzEdYt');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (17, 125, 2, '1PpkJSJoELBvGR8Y5vPjUr9bZ6iiPQzMzM');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (18, 126, 2, '1P5xVj47XyoXQ5jbSWWH92KZ6fvRnQzZJ');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (19, 127, 2, '1JvApJRMU6kSDMpaLY9KXtr2925eSMjCHr');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (20, 128, 2, '1EQNZryxSeLYebHLcfyVVXR36LqfsqsKsS');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (21, 129, 2, '1B1VcPEYPg9YmAu2wH6KtJ5mtBumnJ11fY');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (22, 130, 2, '1n3BmwH7zB3wgVFqJXXpprNoot6A26txB');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (23, 131, 2, '1DC6hfviyxTkQ5ByNcKx7iYCxt1uCM41A6');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (24, 132, 2, '1LQJ6vSXSHAeFiFjtYweWjsFbNybcnU1Kk');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (25, 133, 2, '1JnbEJHu8jXMRqiv4W9QDU83XodW81zhAA');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (26, 134, 2, '1Pt6cDpdkxJs9jqQd9BLL7ipFTWJKQtsj5');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (27, 135, 2, '1HmiDxfQKivyp53i2h2Q8eEeJByxBjYenL');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (28, 136, 2, '1FwpxvMxjosGxEP3wrEnQjLqjD9KQdFgRa');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (29, 137, 2, '193ucVrtQDJ6kvTVEhUKo3epviCwyV8QGX');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (30, 138, 2, '1BppY3HoAQySRmaSHwuNMZD8US8wPfgN6E');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (31, 139, 2, '1DZRbApsGfEZEDoh3w76oyE3Pw8G1zk4w4');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (32, 140, 2, '1AGP1tS3MATk1FXAz5zhjAWkYgZVsNy4jy');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (33, 141, 2, '1RqkzVUfPuPeGfs4EF1w5vxXTAv4x3pmj');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (34, 142, 2, '1N2bhE5jnwDzpbuem5C9ME3EPn1UnpfCtU');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (35, 143, 2, '13sPDdEwXPcMHwUdmR9vpQtbBWJMgwhs4S');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (36, 144, 2, '13CKFCkA4wuk9eXReQbLjZc5LuV2yDm6rY');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (37, 145, 2, '1JdaB9CrsNeF9MrJTXEnTnAWLfHHKxBiH5');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (38, 146, 2, '1PVzng83aaP7GSPaFTGPrkcfAVRy7EH1W');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (39, 147, 2, '1JRUR8iy8EAsRxaKKpp9TxJJb9PzQ5VHFo');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (40, 148, 2, '1EL7kgKW2XL3eiWKN47tsPpRXRufQwGK9s');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (41, 149, 2, '1PwzUyzeVijAcUQ4cALD7gaMPRJepJBi9X');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (42, 150, 2, '12dWtDkva5npzqkFCKbgsAsRRHn7RXd3CG');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (43, 151, 2, '1MuC2CMZ1GbtH8gJuPHcfD8D3Swnk9mLeB');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (44, 152, 2, '1L9AuWHsYCD72qdSiy1JTQPQYC1NCuVWDL');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (45, 153, 2, '1CnG6cCgHjN8uvPe5PMuQubSE12yeGoJeB');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (46, 154, 2, '1ATarBLH2snPFhnKD71UaxhknY3Lpko4Xq');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (47, 155, 2, '15De8Y6PePG1wm1BJS2YK5EMnqJCffnKCF');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (48, 156, 2, '1GQmQoWRqx8j8e8FC1db7VWToRv6Dm15PK');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (49, 157, 2, '194DM3bDdArTtnpcsuWdN2gMGr1sDYJmsj');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (50, 158, 2, '18fAzzVnfEgLkxd1Q2RmouAtFNaHC4eRbb');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (51, 159, 2, '1ExQBkNNar2SRGAv7hTw3jMyJRSWcLEEW6');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (52, 160, 2, '1PFgLB79Xj6kd7jaaKdN9voHbJh2jirXrM');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (53, 161, 2, '1M86eJoKKcP2jX92JQxvp13Q5bBRtdW4ro');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (54, 162, 2, '1PE3tp6c1F7Vj5iWDbQ7NVoW4UbyUq8iZD');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (55, 163, 2, '1NHEd2Lg7AANgEEXu5VDPAgkkrtr9mSfrB');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (56, 164, 2, '1JFM9w8XWY6KhuoVvbR8FTgoQjZkUodWup');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (57, 165, 2, '1PkftthVcTJtS48KgxWdDZbxmduGmgErK1');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (58, 166, 2, '1He1Rw3sFnn34xFyZES4oDzteMvzNhzBd9');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (59, 167, 2, '157BpFRT5HYUzYVMXeytNmXQozYSQvK6px');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (60, 168, 2, '1FPgwgg2Z7m2p48ttaAxFyjk7rrUH8vDzs');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (61, 169, 2, '1EocK4NwxZCg8HoRJpR3h1Ah1dgQ7daboN');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (62, 170, 2, '1G4aUDYbgv2wyXBmPhRiz4qWygVCd1ba5w');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (63, 171, 2, '188z8Ah7oY2UQdYTDnpqK5ZbKboBdQbLC6');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (64, 172, 2, '1HG3eW4njxtjcbMz6vwkViEP7YPMmatwbr');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (65, 173, 2, '1CDeyx1dxZxeZK8UorKizhHswWsZktgWPx');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (66, 174, 2, '1MEsUtvbXJ7CtrPQ3EFTNSqw1h4JKvxXja');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (67, 175, 2, '1BPXh9x6DcmdS14QUu8Rtdgmni8gkxWk6r');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (68, 176, 2, '1GAgDzjiieMsukdc8wyjjWoZ6V3jCUTDsV');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (69, 177, 2, '18wfd9HRZFPaQBbTPLeZrLH5Kn1kmf9nMa');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (70, 178, 2, '1H7ejMb7FuB97YiCceaSq73NvwMmabTXkt');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (71, 179, 2, '1LqxAdqd2wMMSSD3hXuCQB3kNUJ6msL3Cb');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (72, 180, 2, '14aKRixQqywumuVJSQsWBXb4EuA93nvEQz');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (73, 181, 2, '1Dr6PETo1Efna2mrUXozzjLsZn2tTVX8eh');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (74, 182, 2, '1Hjm9wBfiDzE8GSa8PFS8RAj4bBLaRH4J8');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (75, 183, 2, '1GiNavrCQTq3yDR8eCgWaFErrCVDZYsgYA');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (76, 184, 2, '1Az3wYzFhQsBVrbHvtB5cAdjomkCeV6zy8');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (77, 185, 2, '16idJ17R555AcEryqQ6Mewhq4BRtBvAxgJ');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (78, 186, 2, '1Aqjht8qnjauzNUk7FXvPcFzy9V6JMeSCX');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (79, 187, 2, '1Jh57jA6H3B27YdWQ7nasxofsXga2PvESZ');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (80, 188, 2, '1JcN2RNj3MH6tjsH9PQMzUKZqpSpcW5bEZ');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (81, 189, 2, '1P6pLhubw4YJZ7fBcxv22f11gaaq8keuXv');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (82, 190, 2, '1MsRirqwSDSxwSXSZZY7iYGXRfXbyVDwMc');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (83, 191, 2, '1P8SZR3KF5iYFSpFYiLaTwK1W5NYp1X5oD');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (84, 192, 2, '17D2FNyfNbotAqPABXNKrdhkR8cBAxP6Ya');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (85, 193, 2, '1LmYimqNDRvHXv38uyXeuGxYfPCnVytWgk');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (86, 194, 2, '15nQVpBMY7CdnDwtbBWaasu2Qx8c2UgYK7');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (87, 195, 2, '1ASeUvCdkTudAcy2CDazaEyBufXxQ3VXvW');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (88, 196, 2, '1E6Cime9DsqcX5i2YoQPuezP6ESaccinJG');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (89, 197, 2, '12Po1YsaJGXnagqX5qqNt55San8zzBYRcT');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (90, 198, 2, '194dhQNQ7xAUeaxpMiNiRiMZFcCxPtd6Z3');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (91, 199, 2, '1HTZs4M7FAozkpZAWnXbiM83pnWs6bEPKF');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (92, 200, 2, '19g9Bgeu6AWMBxUmkSYAitkHY6ww8yvpti');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (93, 201, 2, '1BS2FGvihfQGZHz9N8PyEL8uubP5JzqXxr');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (94, 202, 2, '1LjVkBZxpHtfp5gfSy2UrRecA7rReMd1xK');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (95, 203, 2, '148BTxkHzB9cLQ5kfQ7hVFuqiVmGW7MQ8P');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (96, 204, 2, '17X2nGxtbErY3Q1aLvCMTJr3Ew3migykCV');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (97, 205, 2, '127ufG1xM2z7bVg2osGcUdiMmjyaS2Qrz3');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (98, 206, 2, '1PtaeyXjXuvCH8ajD3m3311mH8hsW4JEYS');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (99, 207, 2, '1FuJgX8iE7CADiQHf3wbBiwdhU84WFGd6m');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (100, 208, 2, '1Lg7BqENDsEaZ5pK8Viqd8k8JrVrqUC6tp');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (101, 209, 2, '1GSpvAdL9fy4cQPNA7ivz2xGVrwQQZktyX');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (102, 210, 2, '177WB4C67bqKVFY1PWLymkEimoqmwYYqGi');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (103, 211, 2, '1GPKrgEsos7LaKZc5NCASg66yTmGmEsni5');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (104, 212, 2, '1GAfQFEQH8bihnzCryfpH9Re6XwG16Cv5b');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (105, 213, 2, '15mLzUXtCiBAqDarvUWLhzPnHEts3x8X63');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (106, 214, 2, '1618k2Pd8L7zRLj2h5cFyZkw4NLMx3XgnQ');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (107, 215, 2, '19irjr4ExdkNCCKuWA3CVo4EyzpTVcLxcM');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (108, 216, 2, '1369U7fo9HbNuWdgLr6HqY6UEPbVZiz4t7');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (1, 217, 3, '17ScbouzB6SQmQTvY6jjBWvPsYRbVcr6Hk');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (3, 218, 3, '16vmAwXBNRjjnsWbcT8NhEENrTwrZBq4RL');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (5, 219, 3, '18f95L4cocNypVaq9SeDEEQsQk9AYW41y4');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (6, 220, 3, '1GfBojG9v4kryZbdHGnnb2unrd19NFHtfu');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (7, 221, 3, '1438gHBmfYBhQ8P62Sr9zhZdi1bfB9J9bL');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (8, 222, 3, '13TGpXTU4KEra8ieSxiA59jVEW9r25a8qt');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (9, 223, 3, '1qX7F7DoknqTwWMjrN92Dzh4QeNxU8hQN');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (10, 224, 3, '14bvXJqc6eKydCzjWnUjJfWJcHNKRG7P4i');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (12, 225, 3, '1DsVqVHDbqRry8KEaG2CVRFU5A1WfKHzt5');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (13, 226, 3, '1DMHogHbNLkmr5e6GUdrEKpZ5zjCmrf4Bz');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (14, 227, 3, '1ERX6bMRTyhG5NRoCSpVgC6MPCti12ahP3');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (16, 228, 3, '19tL1mpiJDEH5d2EQNWexHT5pCRTAkKMVA');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (17, 229, 3, '1F8MXP2UTyL21NYZGDofc3zegsEZGDioG1');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (18, 230, 3, '16TpFxYAPXiLk2XteFMYwMgN1Af8ZQB1YG');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (19, 231, 3, '1JtQgZ5fTQRN7Y2htkDxPZ1fhvVVxZUYRf');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (20, 232, 3, '1HxUiqreccxpWW154TaQ1giZ12ntDUd8Zy');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (23, 233, 3, '1F79PQxmjEuy53RhVj1VuWKySRHRAANV6G');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (24, 234, 3, '164NcJhBAsPohcUDTd7WAVeGzwR1FZuwMr');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (27, 235, 3, '1Hrvm44YstDpkgiwCen2ScmDErFtDGcuWn');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (28, 236, 3, '1PTgNV3HVMNfVjMNt3TEVkaZksRuVfUYE2');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (30, 237, 3, '112DvLv2e1onTdDuW7hStwf5atFq14FBNH');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (32, 238, 3, '18T3172weJn3ZqtCDm8hogQBdfnGzDFMzU');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (33, 239, 3, '1J16RNX5jYajZmU49Y7jU4Q68Bfgyj1rGe');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (34, 240, 3, '16xJCymYeke4L2nEK7BvYgRKtEX4PijUYu');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (36, 241, 3, '1FkjcFsJYhs8YTtZEPA4neH524c7UdY6sC');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (37, 242, 3, '1F7pbhCHnTiJSqeetgbEFUB8qK5bJ7wphn');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (38, 243, 3, '15A7oRmhUsndKBxjDych7nHNiysw7dm9L4');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (40, 244, 3, '167iy7zssJyk1wFJznvTUSaBR5vu1fYyJ2');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (41, 245, 3, '1Ag2wfsms5p4fCnVfaMpghgNtm8Ef9nE2K');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (43, 246, 3, '1AsR1A5T3r4uJicagmo3AaWCebbftB3p2p');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (44, 247, 3, '1Led3Sk6ePHY6U8LWSzduKH4N6vAnH41zk');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (50, 248, 3, '1KfLTqr6mszmf7wNF24YEbxTxQgTo3b4Nz');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (55, 249, 3, '1DX24KbfG4v62vE1rw9P8yGdRdnkp5naZL');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (59, 250, 3, '1P83Kcs7we623shyA94d4bActaCDHAjP8A');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (61, 251, 3, '1C6vsPfJGbWrR5W6jSts2m4S5rYAr5Hbpv');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (63, 252, 3, '19TRjE6QWSs5hxC5J6uQpCE9YR7veVPT5a');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (64, 253, 3, '1AJXggobCNun7FhR63iVXcdpASnfiAy2uw');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (65, 254, 3, '1CM3E1s67E3W5shCZvSDQeEtiMS5iCuQeq');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (67, 255, 3, '14CzdzWbykKpL7qSRcNDm72Go1fLH31iCA');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (69, 256, 3, '1MkY5JDrJy8jWxZktWwXF3bHFQvBEQxg7w');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (70, 257, 3, '1C7QkRhWr2oCWczXbjB9Vwwq2Yue2m4MQD');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (73, 258, 3, '1PBmBzB1NamgC3WQDtv4VBgpy87XeBjrZr');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (76, 259, 3, '1CsLfApR9GAduS2CMUJvFDC9aouxujicVg');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (81, 260, 3, '1Fqu6RbhGu3y8DXtPUFAC9TAhWABZNYXvH');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (82, 261, 3, '12wZDPPr5s8tYkmpwnsa2AYkGLhT4v2A4L');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (84, 262, 3, '1MZwmson3DWMpFb3b817YjrkoRHEPFx46m');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (86, 263, 3, '1DDQ9tWeaaNgDeyeEXBeqB7y17WrbF32n3');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (87, 264, 3, '1Cdn1ZKoiCPmeiHx2nAdWxexKN7chCJpPa');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (88, 265, 3, '17L6GB6crtgzhKLsiMVbqku1L6kC3HQ9Ap');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (89, 266, 3, '16RaVFnM8KhSMBNxFfBQfpbpETVGEivYC5');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (90, 267, 3, '1BZKgdr2Uv9f5SKT2jqK1CTrL1bTfUnPiB');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (92, 268, 3, '18Ltw78iWqyWGmXtPKPFDcD6viRSBANJNY');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (93, 269, 3, '1C7RS8cfeuZghSrMYXWmZPbfD82FTwC1ty');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (94, 270, 3, '1Gw5zfM2dGhyGzc5fYgpMBHWVbVFhCbDYY');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (95, 271, 3, '16PRfChGWjVb3GXLioxruav7ZVtn9PwqBA');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (96, 272, 3, '12Tx76CyysgGCcE9cH46A7cyKyvu449JCb');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (97, 273, 3, '1PiV1pDee3EpfGFMJxU5qjUoKTyWbNV7r7');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (98, 274, 3, '173N5vXX2spuTPusAm9UG8fUGCqS8GUC9r');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (99, 275, 3, '15hEngMoz6zMSwBT6QiD7eNLG1DP5a5u2s');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (100, 276, 3, '1EigCRHKjhb5ecdrcPfSjD5BGzY3UBWbej');

ALTER TABLE tesPendaftar
ADD CONSTRAINT cek_maksimal_seleksi CHECK (
    (CASE WHEN idWawancara IS NOT NULL THEN 1 ELSE 0 END +
     CASE WHEN idPsikotest IS NOT NULL THEN 1 ELSE 0 END +
     CASE WHEN idTesKesehatan IS NOT NULL THEN 1 ELSE 0 END) <= 3
);

ALTER TABLE tesPendaftar
ADD CONSTRAINT unique_selections
UNIQUE (idMahasiswa, idWawancara, idTesKesehatan);