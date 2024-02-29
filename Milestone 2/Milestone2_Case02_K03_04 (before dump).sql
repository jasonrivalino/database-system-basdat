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

create table Pendaftar (
	idMahasiswa INT not null PRIMARY KEY,
	namaLengkap VARCHAR(50),
	jenisKelamin VARCHAR(50),
	tempatLahir VARCHAR(50),
	tanggalLahir DATE,
	alamat VARCHAR(50),
	noTelp VARCHAR(50),
	email VARCHAR(50),
	kelengkapan VARCHAR(50),
	idWawancara INT,
	nilaiWawancara DECIMAL(5,2),
	idPsikotest INT,
	nilaiPsikotest DECIMAL(5,2),
	idTesKesehatan INT,
	nilaiTesKesehatan DECIMAL(5,2),
	FOREIGN KEY (idWawancara) REFERENCES Wawancara(idWawancara),
	FOREIGN KEY (idPsikotest) REFERENCES Psikotest(idPsikotest),
	FOREIGN KEY (idTesKesehatan) REFERENCES TesKesehatan(idTesKesehatan)

);

create table Beasiswa (
	idMahasiswa INT,
	universitas VARCHAR(50),
	prodi VARCHAR(50),
	jumlahDana INT,
	FOREIGN KEY (idMahasiswa) REFERENCES Pendaftar(idMahasiswa)
);

create table Dokumen (
	idMahasiswa INT not null,
	idDokumen INT PRIMARY KEY not null,
	jenis INT not null,
	link VARCHAR(50) not null,
	FOREIGN KEY (idMahasiswa) REFERENCES Pendaftar(idMahasiswa)
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

insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (1, 'Egor Witheridge', 'Male', 'Gudauta', '2002-08-29', '875 Bobwhite Drive', '603-549-4131', 'ewitheridge0@flavors.me', true, 1, 143.10, 62, 154.16, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (2, 'Stoddard Bernet', 'Female', 'Annonay', '2002-03-17', '17848 Truax Place', '576-689-5360', 'sbernet1@macromedia.com', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (3, 'Marjory Brisley', 'Female', 'Maracaibo', '2002-10-25', '79535 Rowland Point', '469-834-6100', 'mbrisley2@nationalgeographic.com', true, 2, 253.11, 62, 308.29, 73, 251.93);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (4, 'Trisha Gregon', 'Female', 'Changliang', '2003-02-03', '8573 Lillian Alley', '321-158-4959', 'tgregon3@jigsy.com', true, 3, 294.14, 61, 363.95, 64, 74.86 );
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (5, 'Tommy Meffen', 'Male', 'La Unión', '2001-08-06', '71123 Elgar Lane', '607-739-1605', 'tmeffen4@exblog.jp', true, 4,175.19, 62, 332.16, 66, 243.71);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (6, 'Elnar Cicerone', 'Male', 'Chame', '2001-06-08', '3400 Scott Parkway', '655-266-1368', 'ecicerone5@geocities.com', true, 5, 110.12, NULL, NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (7, 'Farrel De Cristoforo', 'Male', 'Bagakay', '2001-08-11', '3632 Oakridge Parkway', '372-464-0125', 'fde6@addtoany.com', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (8, 'Francine Loughton', 'Female', 'Kalývia', '2001-12-01', '08226 Grover Point', '835-720-0244', 'floughton7@ebay.com', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (9, 'Gracie Cortez', 'Female', 'Grygov', '2002-01-07', '38 Sycamore Hill', '208-320-4078', 'gcortez8@posterous.com', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (10, 'Felisha Fielder', 'Genderfluid', 'Ipiaú', '2001-09-14', '62 Manley Road', '956-350-0247', 'ffielder9@woothemes.com', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (11, 'Tomkin Katzmann', 'Male', 'Dupi', '2001-10-08', '48907 Duke Center', '783-623-9431', 'tkatzmanna@mac.com', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (12, 'Joey Thomke', 'Male', 'Maliang', '2001-10-10', '1003 Autumn Leaf Junction', '785-611-2052', 'jthomkeb@blogspot.com', true, 6, 363.99, 61, 73.74, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (13, 'Malissa Figg', 'Female', 'Tubel', '2001-11-03', '741 Birchwood Crossing', '304-342-4098', 'mfiggc@redcross.org', true,7, 109.88, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (14, 'Cammie Barnicott', 'Female', 'Strum', '2002-12-23', '2 Ilene Way', '909-295-3966', 'cbarnicottd@wunderground.com', true, 8,76.30, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (15, 'Maxine Franks', 'Female', 'Sainte-Anne-des-Plaines', '2002-07-24', '1 East Plaza', '350-314-6880', 'mfrankse@cdc.gov', true, 9, 122.44, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (16, 'Walsh Roxburch', 'Polygender', 'Liushui', '2002-12-05', '679 Sunfield Junction', '477-182-0420', 'wroxburchf@guardian.co.uk', true, 10, 288.76, 61, 131.34, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (17, 'Marci Le Estut', 'Female', 'Landskrona', '2001-04-30', '0 Stoughton Circle', '827-151-5644', 'mleg@reddit.com', true, 11, 169.20, 62, 163.30,NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (18, 'Saundra Bimson', 'Genderfluid', 'Ban Dung', '2001-07-01', '02 Carpenter Plaza', '280-395-8021', 'sbimsonh@hibu.com', true, 12, 290.39, 61, 98.95, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (19, 'Coop Celli', 'Male', 'Iguig', '2001-06-12', '9798 Hanson Road', '643-629-1775', 'ccellii@tuttocitta.it', true, 13, 173.89, 62, 216.34, 79, 276.54);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (20, 'Agnesse Ousley', 'Female', 'Leuburi', '2002-07-10', '72648 Hansons Pass', '339-443-7418', 'aousleyj@freewebs.com', true, 14, 354.89, 61, 308.99, 71, 299.82);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (21, 'Rebekah Hutten', 'Female', 'Santa Lucía', '2003-02-28', '20 Doe Crossing Hill', '488-635-1310', 'rhuttenk@wisc.edu', true, 15, 334.82, 61, 243.62, 78, 133.47);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (22, 'Kira Fuentes', 'Female', 'Houston', '2001-09-01', '25 Northport Street', '281-433-4672', 'kfuentesl@msn.com', true, 16, 95.66,NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (23, 'Tuesday Tinniswood', 'Female', 'Tampocon', '2002-04-02', '4953 Pankratz Center', '162-866-4015', 'ttinniswoodm@psu.edu', true, 17, 187.61, 62, 139.80, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (24, 'Druci Affuso', 'Female', 'Chiba', '2001-09-05', '1349 Kinsman Street', '313-294-1944', 'daffuson@cnn.com', true, 18, 254.39, 62, 63.21, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (25, 'Welby Fielder', 'Male', 'Melgar', '2001-06-10', '36689 Esch Street', '521-920-9583', 'wfieldero@ihg.com', true, 19, 341.24, 61, 320.72, 69, 368.10);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (26, 'Shaine Capp', 'Female', 'Hezhang', '2001-06-21', '59 Manufacturers Terrace', '171-999-4865', 'scappp@cdc.gov', true, 20, 343.83, 61, 202.07, 80, 170.37);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (27, 'Vilhelmina Giametti', 'Female', 'Suwalki', '2003-04-04', '9404 Atwood Drive', '894-879-4215', 'vgiamettiq@google.es', true, 21, 259.64, 62, 296.30, 74, 35.07);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (28, 'Tanya Haquard', 'Female', 'Abuko', '2001-11-04', '255 Sunbrook Plaza', '732-577-8962', 'thaquardr@google.de', true, 22, 224.18, 62, 364.02, 63, 109.26);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (29, 'Cass Portal', 'Female', 'Hörby', '2001-12-07', '390 Sunnyside Drive', '335-504-9250', 'cportals@oracle.com', true, 23, 268.35, 61, 324.73, 68, 40.99);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (30, 'Christopher Secretan', 'Male', 'Karangnongko', '2002-08-13', '615 Aberg Circle', '962-230-6610', 'csecretant@forbes.com', true, 24, 50.03, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (31, 'Marita Mocher', 'Female', 'Lobez', '2001-04-23', '420 Nobel Circle', '705-751-6228', 'mmocheru@thetimes.co.uk', true, 25, 358.01, 61, 166.46, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (32, 'Robers Troutbeck', 'Male', 'Baška Voda', '2001-04-30', '6168 Stang Place', '616-887-9730', 'rtroutbeckv@yale.edu', true, 26, 144.38, 62, 193.45, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (33, 'Philip Hulles', 'Male', 'Andapa', '2001-04-25', '357 Forest Run Way', '764-160-1605', 'phullesw@bbb.org', true, 27, 171.37, 62, 98.20, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (34, 'Mil Icom', 'Female', 'Patimuan', '2001-04-26', '85750 Grim Avenue', '752-771-6728', 'micomx@woothemes.com', true, 28, 118.92, NULL, NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (35, 'Retha Vickery', 'Female', 'Winterthur', '2001-04-09', '5946 Barnett Drive', '374-992-8571', 'rvickeryy@infoseek.co.jp', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (36, 'Talyah Fante', 'Female', 'Ladner', '2002-06-05', '958 Nevada Crossing', '342-800-9819', 'tfantez@phoca.cz', true, 29, 239.91, 62, 312.25, 71, 182.06);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (37, 'Normie Selcraig', 'Male', 'Nanping', '2002-08-08', '537 Kropf Avenue', '985-542-8287', 'nselcraig10@wisc.edu', true, 30, 117.16, NULL, NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (38, 'Allen Ovanesian', 'Male', 'Lazaro Cardenas', '2003-03-20', '6964 Manufacturers Park', '685-192-9151', 'aovanesian11@i2i.jp', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (39, 'Caryn Meader', 'Female', 'Olupona', '2003-03-12', '17939 Rowland Terrace', '564-497-0430', 'cmeader12@vimeo.com', true, 31, 192.55, 62, 251.20, 77, 67.93);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (40, 'Drusilla Bartolacci', 'Female', 'Lago dos Rodrigues', '2003-03-26', '2 Derek Pass', '546-476-4593', 'dbartolacci13@usda.gov', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (41, 'Lesli Harley', 'Female', 'Guinabsan', '2003-02-15', '8 Springs Crossing', '640-758-3342', 'lharley14@prnewswire.com', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (42, 'Daisy Roostan', 'Female', 'Tucuruí', '2002-07-07', '78673 Debra Way', '768-988-9564', 'droostan15@plala.or.jp', true, 32, 293.55, 61, 90.33, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (43, 'Kettie Kleinsmuntz', 'Female', 'Ábrego', '2002-04-28', '77 Artisan Alley', '648-813-9701', 'kkleinsmuntz16@google.com.au', true, 33, 340.39, 61, 335.74, 65, 134.48);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (44, 'Inigo Hambrook', 'Male', 'Mayakovski', '2002-11-20', '5 Quincy Crossing', '559-585-1395', 'ihambrook17@icq.com', true, 34, 365.60, 61, 329.61, 67, 196.86);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (45, 'Annadiana McAuliffe', 'Female', 'São Domingos de Rana', '2001-06-04', '64498 Sachs Point', '816-832-5168', 'amcauliffe18@reuters.com', true, 35, 301.11, 61, 168.35, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (46, 'Barrett Hanse', 'Male', 'Qingshan', '2001-11-23', '5 Bluestem Alley', '392-732-6881', 'bhanse19@cyberchimps.com', true, 36, 106.41, NULL, NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (47, 'Jabez Cordy', 'Male', 'Otuke', '2002-02-14', '1 Loftsgordon Hill', '212-720-2443', 'jcordy1a@biglobe.ne.jp', true, 37, 46.84, NULL, NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (48, 'Washington Mathe', 'Male', 'Cikaung', '2002-01-19', '61603 Pearson Hill', '713-601-9234', 'wmathe1b@slideshare.net', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (49, 'Emanuel Lourenco', 'Male', 'Wadi as Salqa', '2002-07-03', '9736 Sachtjen Hill', '470-903-2500', 'elourenco1c@cnet.com', true, 38, 170.70, 62, 94.73, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (50, 'Pepi Turfitt', 'Female', 'Beidaihehaibin', '2001-11-18', '9 Westport Park', '861-267-7452', 'pturfitt1d@cdc.gov', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (51, 'Gilly Chaffey', 'Female', 'Mrgavan', '2002-06-02', '75 Rockefeller Alley', '702-510-6729', 'gchaffey1e@fda.gov', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (52, 'Seana Goodacre', 'Female', 'Lidzbark', '2002-07-10', '6 Lyons Street', '517-528-5155', 'sgoodacre1f@stanford.edu', true, 39, 121.09, NULL, NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (53, 'Carrol Christofides', 'Male', 'Golbey', '2003-04-04', '711 Bashford Plaza', '638-224-2169', 'cchristofides1g@xrea.com', true, 40, 326.68, 61, 261.38, 76, 100.19);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (54, 'Coleman Brazener', 'Male', 'Knyaze-Volkonskoye', '2002-07-10', '3126 Waubesa Way', '913-891-4922', 'cbrazener1h@businessweek.com', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (55, 'Garnet Crosen', 'Genderqueer', 'Shuangkou', '2001-06-21', '50 Arrowood Road', '639-436-1099', 'gcrosen1i@vkontakte.ru', true, 41, 275.80 , 61, 41.83, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (56, 'Chelsy Rizzo', 'Female', 'Cikadu', '2001-05-21', '896 Grasskamp Way', '318-435-3049', 'crizzo1j@harvard.edu', true, 42, 173.87, 62, 312.38, 70, 87.55);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (57, 'Quinlan Raecroft', 'Male', 'Montgomery', '2001-10-24', '708 Northport Parkway', '334-298-7715', 'qraecroft1k@plala.or.jp', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (58, 'Charmain Wilcocks', 'Female', 'Anto', '2002-04-05', '7 Ridgeway Circle', '205-127-8441', 'cwilcocks1l@feedburner.com', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (59, 'Jelene Timpany', 'Female', 'Ifon', '2001-06-19', '53 Loomis Circle', '902-292-1394', 'jtimpany1m@merriam-webster.com', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (60, 'Morton Davern', 'Male', 'Kazimierz Dolny', '2002-06-14', '21851 Springs Circle', '126-383-8942', 'mdavern1n@diigo.com', true, 43, 310.83, 61, 312.38, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (61, 'Marlow Kightly', 'Male', 'Rosso', '2002-10-19', '38 Commercial Street', '921-431-4348', 'mkightly1o@mediafire.com', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (62, 'Ogdan Perrie', 'Male', 'Mateur', '2001-10-26', '50799 Center Junction', '128-780-2631', 'operrie1p@yelp.com', true, 44, 122.95, NULL, NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (63, 'Ernestine Vlahos', 'Female', 'San Vicente', '2002-04-22', '1495 Hazelcrest Street', '162-217-4656', 'evlahos1q@123-reg.co.uk', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (64, 'Ilsa Peiro', 'Female', 'Requena', '2003-01-17', '88909 Annamark Pass', '710-640-5499', 'ipeiro1r@bloglines.com', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (65, 'Heloise Hambric', 'Female', 'Staryy Oskol', '2002-05-01', '095 Twin Pines Road', '789-557-3512', 'hhambric1s@sun.com', true, 45, 203.08, 62, 187.88, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (66, 'Enrico Digginson', 'Male', 'Marugame', '2002-08-21', '19 Artisan Trail', '648-544-0468', 'edigginson1t@flavors.me', true, 60, 35.26, NULL, NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (67, 'Deana Mafham', 'Female', 'Padangtiji', '2001-10-21', '40 Merrick Parkway', '171-911-2442', 'dmafham1u@icio.us', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (68, 'Jaine Redwood', 'Female', 'Áno Kopanákion', '2001-07-09', '44 Coleman Point', '686-226-0659', 'jredwood1v@admin.ch', true, 46, 95.23, NULL, NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (69, 'Hayes Bau', 'Male', 'Reno', '2002-05-15', '75367 Petterle Road', '775-520-5838', 'hbau1w@guardian.co.uk', true, 47, 259.41, 62, 197.05, 82, 212.41);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (70, 'Ned Alderwick', 'Male', 'Witbank', '2002-08-31', '90349 Troy Alley', '142-726-1504', 'nalderwick1x@acquirethisname.com', true, 48, 358.68, 61, 199.53, 81, 90.91);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (71, 'Glenden Gopsall', 'Male', 'Chahe', '2001-11-03', '51 Sullivan Plaza', '619-831-9645', 'ggopsall1y@harvard.edu', true, 49, 71.41, NULL, NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (72, 'Ulrika Maciak', 'Female', 'Umm Kaddadah', '2003-03-25', '3276 Grim Point', '432-832-6218', 'umaciak1z@house.gov', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (73, 'Abbey Adenet', 'Male', 'Mora', '2001-09-05', '738 Lukken Road', '538-927-8313', 'aadenet20@forbes.com', true, 50, 124.52, NULL, NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (74, 'Daile Keave', 'Female', 'Horka nad Moravou', '2002-09-27', '1 Bartelt Crossing', '671-783-4722', 'dkeave21@themeforest.net', true, 51, 132.08, NULL, NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (75, 'Ximenez MacGaughy', 'Male', 'Dengyue', '2002-09-12', '85 Bay Circle', '685-338-4483', 'xmacgaughy22@usgs.gov', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (76, 'Nadya Abramowitch', 'Female', 'Puyang', '2002-10-13', '38 Coolidge Hill', '881-452-6195', 'nabramowitch23@paypal.com', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (77, 'Edgardo Elderton', 'Male', 'Tesetice', '2001-12-20', '23 Hayes Center', '825-512-3746', 'eelderton24@engadget.com', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (78, 'Crawford Klimczak', 'Non-binary', 'Parczew', '2001-04-22', '3 Summerview Circle', '269-181-1946', 'cklimczak25@goodreads.com', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (79, 'Geri Syplus', 'Male', 'Zhangjiaji', '2001-11-12', '8588 Loftsgordon Pass', '785-181-7356', 'gsyplus26@cbslocal.com', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (80, 'Corrine Abrahim', 'Female', 'Paris 19', '2001-04-27', '9349 Harbort Trail', '885-111-9531', 'cabrahim27@prweb.com', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (81, 'Jud McParland', 'Polygender', 'Xieshui', '2003-01-07', '052 Hanson Place', '146-720-7596', 'jmcparland28@ebay.com', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (82, 'Callean Giacopetti', 'Male', 'Samouco', '2002-02-28', '51692 Twin Pines Road', '639-967-2724', 'cgiacopetti29@hhs.gov', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (83, 'Valery Gong', 'Female', 'Severskaya', '2002-12-10', '525 Saint Paul Parkway', '532-818-8148', 'vgong2a@dmoz.org', true, 52, 257.61, 62, 169.20, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (84, 'Gwyn Bransden', 'Female', 'Tundagan', '2001-09-27', '6 Shopko Place', '286-796-1023', 'gbransden2b@engadget.com', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (85, 'Donnie Parlatt', 'Polygender', 'Huangcun', '2001-10-02', '13544 Eastlawn Road', '353-490-1417', 'dparlatt2c@nbcnews.com', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (86, 'Maure Spyby', 'Female', 'Nanjie', '2002-04-11', '4 Arapahoe Parkway', '135-208-8091', 'mspyby2d@mayoclinic.com', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (87, 'Axe Gymlett', 'Male', 'Xuguang', '2002-11-19', '1 Warrior Circle', '581-185-1149', 'agymlett2e@yandex.ru', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (88, 'Anjela Bosdet', 'Female', 'Kokubunji', '2002-06-24', '4282 Pierstorff Avenue', '433-705-8438', 'abosdet2f@ovh.net', true, 53, 300.34, 61, 295.66, 75, 148.56);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (89, 'Lazar Clampin', 'Male', 'Krapina', '2002-06-04', '5134 Lotheville Street', '446-530-0255', 'lclampin2g@jimdo.com', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (90, 'Paolo Chin', 'Male', 'Santa Rita do Passa Quatro', '2002-07-29', '43 Little Fleur Park', '129-710-6561', 'pchin2h@illinois.edu', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (91, 'Dayle Halpine', 'Female', 'Krapina', '2003-01-24', '26493 Gulseth Street', '177-772-6730', 'dhalpine2i@indiatimes.com', true, 54, 133.06, NULL, NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (92, 'Tiler Carnilian', 'Male', 'Dolinsk', '2002-12-21', '66220 Mosinee Park', '531-849-3851', 'tcarnilian2j@blogspot.com', true, 55, 121.31, NULL, NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (93, 'Saw Caslake', 'Male', 'Sarvabad', '2003-03-09', '1 Annamark Center', '619-202-1498', 'scaslake2k@nymag.com', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (94, 'Heida Sabie', 'Female', 'Kratovo', '2002-01-12', '469 Evergreen Lane', '222-842-9685', 'hsabie2l@berkeley.edu', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (95, 'Pietrek Faire', 'Male', 'New Glasgow', '2001-10-11', '2 Artisan Road', '335-696-9713', 'pfaire2m@harvard.edu', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (96, 'Caresse Vannoort', 'Female', 'Huaqiao', '2002-06-14', '428 Mccormick Trail', '775-759-3188', 'cvannoort2n@usatoday.com', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (97, 'Christabel Bigrigg', 'Female', 'Chendong', '2002-01-01', '75624 Marquette Drive', '488-448-7114', 'cbigrigg2o@china.com.cn', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (98, 'Camella Rosten', 'Female', 'Taytay', '2001-06-16', '77 Union Circle', '365-835-7869', 'crosten2p@samsung.com', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (99, 'Yardley Crab', 'Male', 'Minneapolis', '2003-03-18', '47507 Barby Lane', '651-599-7490', 'ycrab2q@canalblog.com', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (100, 'Sara MacCague', 'Female', 'Looc', '2002-06-03', '59 Southridge Hill', '784-145-4000', 'smaccague2r@yolasite.com', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (101, 'Cristina Bunney', 'Female', 'Klenje', '2003-01-19', '91623 Blaine Way', '375-921-5383', 'cbunney2s@shutterfly.com', true, 56, 142.86, 62, 86.76, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (102, 'Brenna Kyd', 'Female', 'Stalowa Wola', '2003-01-31', '07237 Butterfield Hill', '838-358-7864', 'bkyd2t@sbwire.com', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (103, 'Ferrel Vautrey', 'Male', 'Profítis Ilías', '2002-02-16', '688 Delaware Circle', '266-578-8608', 'fvautrey2u@umn.edu', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (104, 'Allianora Paule', 'Female', 'Miao’ertan', '2002-07-11', '636 East Place', '285-220-8389', 'apaule2v@nymag.com', true, 57, 317.07, 61, 132.59, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (105, 'Trudey McKilroe', 'Female', 'Kolbuszowa', '2002-11-06', '5791 Warner Junction', '367-190-2144', 'tmckilroe2w@cloudflare.com', true, 58, 88.72, NULL, NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (106, 'Dewitt Sine', 'Male', 'San Fernando', '2002-07-14', '6 Ridgeview Parkway', '309-834-0526', 'dsine2x@fda.gov', true, 59, 344.75, 61, 102.11, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (107, 'Salomon Esmead', 'Male', 'Dikwa', '2001-12-30', '759 Hovde Parkway', '229-152-9341', 'sesmead2y@pcworld.com', false, NULL, NULL, NULL ,NULL, NULL, NULL);
insert into Pendaftar (idMahasiswa, namaLengkap, jenisKelamin, tempatLahir, tanggalLahir, alamat, noTelp, email, kelengkapan,idWawancara, nilaiWawancara, idPsikotest, nilaiPsikotest, idTesKesehatan, nilaiTesKesehatan) values (108, 'Malynda Grissett', 'Female', 'Ostružnica', '2001-04-20', '59442 Mayfield Crossing', '425-989-0446', 'mgrissett2z@theguardian.com', false, NULL, NULL, NULL ,NULL, NULL, NULL);

insert into Beasiswa (idMahasiswa, universitas, prodi, jumlahDana) values (25, 'Academy of Arts', 'Graphic Design', 1090);
insert into Beasiswa (idMahasiswa, universitas, prodi, jumlahDana) values (20, 'Rocky Mountain College of Art and Design' ,'Fashion Design', 1238);
insert into Beasiswa (idMahasiswa, universitas, prodi, jumlahDana) values (19, 'University of the West of England, Bristol','Computer Science', 1316);
insert into Beasiswa (idMahasiswa, universitas, prodi, jumlahDana) values (3, 'China University of Geosciences Wuhan', 'Geology', 1312);
insert into Beasiswa (idMahasiswa, universitas, prodi, jumlahDana) values (5, 'World University of Bangladesh', 'Communication', 1025);
insert into Beasiswa (idMahasiswa, universitas, prodi, jumlahDana) values (69, 'Université Ibn Zohr Agadir', 'Pharmacy', 1488);
insert into Beasiswa (idMahasiswa, universitas, prodi, jumlahDana) values (44, 'Universidade Federal da Grande Dourados', 'Mechanical Engineering', 1223);
insert into Beasiswa (idMahasiswa, universitas, prodi, jumlahDana) values (36, 'Free University Institute "Carlo Cattaneo"', 'International Law', 1125);
insert into Beasiswa (idMahasiswa, universitas, prodi, jumlahDana) values (26, 'Alahgaff University', 'Architecture', 1408);
insert into Beasiswa (idMahasiswa, universitas, prodi, jumlahDana) values (88, 'Institute of Management Sciences, Lahore (IMS)', 'Management', 1016);

insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (1, 1, 3, '1AFfAwvarsZzTLVU5KwA7vQfHLFAo8zK8k'); 
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (3, 2, 3, '1GKJdE4TGHmiR8SJoaDBbkZ4SkyheJ9Pt8'); 
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (1, 3, 2, '1HEYo4K2oYiLamZDFqpvfHTnuYWnKY6mVf'); 
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (3, 4, 2, '1H2t7bqvZgQrjtcjGgwJ2UriUWMgxjYNi3'); 
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (1, 5, 1, '1AkTTjqHWL7V9fnVDEj3Xsoi4yNAe8yBpR'); 
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (4, 6, 3, '1N2MXuXQYiJGVvsawZG85CZBjoN1v3RqjY'); 
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (6, 7, 3, '13MhXSzwWq4xWAiAeNx3VdpduuQU3JZWoe'); 
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (12, 8, 3, '1FtQAvw3Krf4PqDheQRNKhDuwJAskg322e'); 
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (4, 9, 2, '1BkBNmMGGqsrBkWbA2mAq7hzDDLbaHgXEd'); 
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (3, 10, 1, '14Nv3bhtBrcNRC8sRUh7UVyfaMsfwWjVxU'); 
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (5, 11, 2, '1SX96T4qomWe47ko72a5CohukyFH94B8n'); 
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (5, 12, 3, '1CVrPckgL9RaTuJhNKfgVe7LF4NxhD9NZh');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (4, 13, 1, '16je62rurbUhdSAqQRFZEqkKx9Z2nGhVW5');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (13, 14, 3, '15geoHGpZ3xRwiG6XfaT5BQ5QcUsoXabxk');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (14, 15, 3, '15k7PRcNj1BNQvDdhdQsHhcbYWarWGCBHf');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (6, 16, 2, '1AegUJcJV59p9qgBbRzBX8PjLu7FxPuKBj');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (5, 17, 1, '1Lk6sp89RZspMUGc9noB9zBVA8Fz6eHY2a');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (12, 18, 2, '18McGk4hzPWf1H6ehmccMwtCM5mTp7c9FP');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (15, 19, 3, '14ebyVEuJtC4ZvxfNL1ek7cnBTk2mBAA2j');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (13, 20, 2, '1CT6pZ9zAPJ3HdRKVEQLjPckrVp1f1TLSq');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (6, 21, 1, '1La1unEAeMHfSCq1zVxRBK56Qr7unwPWwo');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (14, 22, 2, '1Ep7JipfVmNewRmY9cyY4KAwqhg9q1uJAZ');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (16, 23, 3, '171EqMzZNt2f8LkruK3ZwkYQJWmJGBjCfN');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (15, 24, 2, '1NZrNMjk9XwYrTnpKURFyj45jXq8n4CvqN');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (12, 25, 1, '1dRsZsgA7gAL1fKJPeBy52Buw7EBdo8hw');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (17, 26, 3, '17igkgnSk2KhP5BXViCiycVCYQzqHBsbnr');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (18, 27, 3, '1MLiuN7RtM2KQYhit2iNAsSpYp2fmK6xUG');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (16, 28, 2, '13KJ9is2vwyrwqpYYrsQqFoGPb9tjiwbt4');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (13, 29, 1, '1Pj2ksGwCZkgvdEH6ABxR5TqG5nixxXjxb');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (14, 30, 1, '14KdJ5jpEr8xYizMj5x2gSfamZEvhCRD1m');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (17, 31, 2, '1Csv6XtjGF93CfcTwGcKMqrk6TEXDc5Wds');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (19, 32, 3, '1KMhKFyewGvYRMgsscE9LVPYxXu2FasvPw');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (20, 33, 3, '1enL1wScZepDykrK4tfaDC95eetpFqKTi');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (15, 34, 1, '1C7GQmN8gf8eAyLtAvwe4ZL581ACYfHTPe');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (16, 35, 1, '1QALob2AnaaE2wxeZ7St8W2JRreY6xTph8');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (17, 36, 1, '1AjceoNCYvxdnf8t56EovAxafGYdX5ecLd');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (21, 37, 3, '1M2wyp9baRRaS64Drcu356ksJ8EZFTHNSp');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (18, 38, 1, '1AzN7Xtzgdm8aSBHsHTUe8BX55oyW4HWKL');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (18, 39, 2, '1DJ5CKLeZCMhUcygZpLwQ3Nj17MGT4nwVc');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (19, 40, 1, '1PpprSWHD2u1HKkqKc22hKNWyR5CSamB29');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (22, 41, 3, '1QLPcext3VHa5k1AKKKtECow43nFDgcMpU');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (20, 42, 1, '122MTTBjveX7ugtw1mPAwHjzRWhspgDmdk');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (19, 43, 2, '1fEu1nQGpJ3mNLL5D2y2TaSG1Sap1qeuC');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (23, 44, 3, '1DQGtXnUcrQ8euGzK2QcqhoxsichG5nNTY');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (21, 45, 1, '12KaPPJWoLo7yTMaUeBv6qHqaozZ2Khpoo');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (20, 46, 2, '1EeYYpyvA8Kuqfn3oiYyAKauEhs42DxMtu');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (21, 47, 2, '1G29buXBQEGiQCZwyHCcEbSWn3m7AFV1H5');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (22, 48, 2, '1AdL2gfq3bhiZ5dc46gSCPga5aNL3EMHKQ');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (23, 49, 2, '19N2bAAUSum29mXtd1HjD1qk5aNLUrUd2g');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (24, 50, 3, '15f63fsWKenrD36iuzQiWUAhuZLPfBibXZ');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (22, 51, 1, '1AM4i6g4pkzrDVGBuX8TTFdAKnYqAsYtd2');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (25, 52, 3, '1MXqWNViFFrwBduPT7rHFqeXBATDTqbm9R');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (24, 53, 2, '1LSqM2bceEN5bYcviD991WBa8ekY4KxMnp');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (27, 54, 1, '13GKxd7bgDtMZS2Rn25wVYpSdjFTDb4A1B');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (26, 55, 3, '19PnQr8PBY1R59VgxFcuhptZ8fMAKSyPMh');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (27, 56, 3, '1NrhZ324MGwqKQSdcyf6XhQEUJErPXowHZ');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (24, 57, 1, '16izABDdEcZJxkFb2QprTRsxTWePjP9RxT');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (28, 58, 3, '16JC6U9mU29N7t7DT2Xj2SMG1oSH6BvQPU');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (25, 59, 2, '1FSygEoF71XdkFDdMrkCXk1q5xhWzTUDh8');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (26, 60, 2, '12spi5NpZWuvPy25mHHr8Wk6a7xyzhfvGJ');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (29, 61, 3, '1CyMWE8Rcoh17jLa4DoZdtaQkxF9xRcioz');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (25, 62, 1, '16ZzxV4veaVpmcJ1iNqcYL8EkYLjtZ3M8a');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (30, 63, 3, '1NXuJ7c4oPD4udeCDLtTo9JKsvegJA6iZe');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (31, 64, 3, '1MWBo8BqRc89YZHfSJSitXeu6sguT7zNwk');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (26, 65, 1, '1DW2c584vd8Gjesn6yQZfDzjKKFhaPJcR1');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (28, 66, 1, '1MjGZQbt2nEetP6D1cExXh6QhvqtLuB3BY');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (29, 67, 1, '1APRK8ZJ6DVgdZnpUaASZPBsvCqe6xRKdE');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (30, 68, 1, '18N81cKjc3KcG8cJgjxjB3z9jR4pogaYa7');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (32, 69, 3, '16WAJ6u8QRkKe56meRvn8A8q78hfCxxDs2');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (33, 70, 3, '18bj2Wri9et2tYQz7L9JNmy4DHEDB975uN');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (34, 71, 3, '19MhhzYkn27FjMRMJdByPMzQeN6xiPBG3v');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (70, 72, 3, '149NcsA1wZEkFSNp9hYT5nBfPqKgeHxy3o');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (31, 73, 1, '1CkiWRTa6hyqDt5LVzo78GxidrCQGFQFzA');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (32, 74, 1, '1B7D2z1NZCwFBQu85jb3PxT6g5HchbRPe5');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (33, 75, 1, '1MYdMwEB6jtWZhueXSmJXa8aLtgzApvtox');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (34, 76, 1, '15S91wQKsBGgHiABvaXFTiFUfio4j9t9h9');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (36, 77, 3, '1AMLxnuinfwYXEer3oQTjPmfKKf6QSeNau');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (35, 78, 1, '1Npsf1v32XkRmVJe6zag2hqJMfHzD6jnW2');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (37, 79, 3, '1N195TA1Vy96WZ7waAdAf9GymWWMbVovsY');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (73, 80, 3, '16aK6WKKimWEDeKYBuKLoCT5wxMa9YgAwH');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (36, 81, 1, '1Q1o6SPni32qrJkHQJb3RBiEmBngohj3jf');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (37, 82, 1, '1FWVB3XerDoh214b2snqK82JQgnmcWnCyq');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (38, 83, 1, '177XjRfMjoerrnm8u2n4CwkgdhGm23zH4S');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (39, 84, 1, '16F2JubuD9yDSBtETJsd9HaZpaTPWFup2A');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (40, 85, 1, '1CBeVCoXzi4nagob7dF7yatiMjYL9kwZsg');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (39, 86, 3, '1N43Mo61L6vGqTVqSdnqGH1KXhC7NTwzda');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (61, 87, 1, '196bvVxfPZ65SUzXoii2ucf61vCDQASHAR');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (62, 88, 1, '1N85KagA3QNvoBvSSQAjHLhhsjfvGNrfZp');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (63, 89, 1, '1FCesGWMQkeL362oHPdc3mE8HDbdtjTXrt');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (64, 90, 1, '1B7r6Y4dSUMjygAjfSTsmQEeMGQQPXWSHF');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (65, 91, 1, '16CApNMLaWFGxBqNKgKqivPPPtm2riCpVq');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (66, 92, 1, '17PEBgVUzWqjD1pGiYSmoJGS7ddvxg2BER');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (67, 93, 1, '1J5g6A3EDMmjqVvBkjk2RwTcSSAMpaPzL9');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (83, 94, 3, '12DrKpY4kXWdpsRDLTvb8RPT6peEmq4SoF');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (68, 95, 1, '1K2LhoyASX1awQhTDXQTk4FCn2d25NquDA');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (69, 96, 1, '1JPdSmfwQHwgvEZ9Py884w6Uae7v4pSpsm');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (70, 97, 1, '1DwRXGYQF9VzBC5d4mmkaZnL1eovFYiyVc');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (61, 98, 3, '1D7PZfT4P6sHaN85AqJykT3yBevoeeR9nB');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (81, 99, 1, '19m1m1LALZXzZYwyLU3JVnVA1ZcwB7MVxW');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (82, 100, 1, '1EdMMZxX3RTPvRxT7bnaNyEXpuQnYhhpe7');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (83, 101, 1, '1DabJFh29rTv9bC2UQB2st226Myvt1o92f');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (84, 102, 1, '1JSUKH5ARLru827U5zU8noR1S7obiJ9sXZ');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (85, 103, 1, '15eYPswH6RrVcLd72wqhvimNbyewEr9FVw');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (51, 104, 1, '1Dnbn85f7WnYa4bYXpv2dWjcyyFt8umrDG');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (51, 105, 3, '13B23EqaKqVzwheqhqmYJNwXozpMEVCUxU');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (86, 106, 1, '1DEuoAW5kBcrKUBHKNjud3AiyWztHbToA8');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (71, 107, 3, '17dwMAB7zPeMZip1oKNE3B9yhH4AZZcQrC');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (72, 108, 3, '1M3tqmLS5HCVJEoH1atzitcZXXHiSckQ4S');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (71, 109, 1, '1Kh5aHJrPShocPLuWpsdRH7soBmgzrLChQ');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (73, 110, 1, '1HZtLDBd3uN2y93rBixQznxFk8eewXPzP5');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (63, 111, 3, '1PAvXXgyQas32uQofRtf6LJniiD317jb57');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (62, 112, 3, '1JTKvCcjGCr9Vtkpuf2bzykJ3SyJfC3rfF');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (74, 113, 1, '14p8f7PTd2EVcULuReYriehWRy3MbkPMcN');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (64, 114, 3, '1Cfvuo7RE9TpoQ8Vd8JymaHQDWxRpaL6iz');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (65, 115, 3, '1N8JJRBQL2R7yNLaYTYTRWt61VGmmDBXMi');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (87, 116, 1, '1EHJXuJqRyfDeVD6K8VniBBXff1PLYmYGV');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (66, 117, 3, '1NjfNT4nuTGMtwEK3fQE91WEBHigRnsawg');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (67, 118, 3, '1CXsuSn8yoV3MTXJRjskyWHGWnTuhR8RMM');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (88, 119, 1, '1LnbtV81ZgjH3JzNa3mKm7tze3F5pSKiZ8');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (68, 120, 3, '1BoyVzEuRMCnqZmZmzEeuE2oBrP4Bvh643');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (69, 121, 3, '1C9VibEMLQBLHZakcznV3DPNZVxAoNzLey');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (75, 122, 1, '14Mc7Hwj1VHoP94CZ5ge78eqHWddTU9XCv');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (74, 123, 3, '127A8XJwY9zxB5pxphDF5JQGMfsVkRKVF9');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (76, 124, 1, '1LiWdKJoqL4JFwic83GcUMZfKxVC34cLSZ');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (77, 125, 1, '138KUEd11LsYTLFFSxhoXQWC6GeJRW7kzR');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (76, 126, 3, '1E9XjqVP8vAf753rRP7pMyS9Y1yvv3mUbu');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (77, 127, 3, '1GZRiYxXCKUPMiVHJg6MniEoPfCR9EhCwA');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (78, 128, 3, '1GJ7vWxRia5iopCtwQtyejTFTYwiq6gN6n');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (79, 129, 3, '1KkpcQ1TRuGHSbbTM4giAeTdHPvLkhULZT');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (80, 130, 3, '1E7dq97TAvxSpJ4inNim9kdmaxYm1PH2v3');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (78, 131, 1, '1NrigegZk6EHntFh2cVrvYFyu3q4o3r6ci');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (91, 132, 3, '18VkzZpCyvWJj1mruRp1asXQqtN9jYzy4z');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (92, 133, 3, '1HWiSFHW33L1BoMqdkSNjx5mPkW1Z6YtUG');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (89, 135, 3, '1PcxfzhibkeW6oMmMkLpCsFEzqgUdXCxaX');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (93, 136, 3, '1NzyeFtdNK6oKjBBkF6XRakjSg27fjsxCC');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (27, 137, 2, '1NzFPNPFBJf8Lu4MiC7T1N74pGJiysB8Di');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (28, 138, 2, '19viosyFkSxuH3DGZfuQyAsHrem5Tf5YA3');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (29, 139, 2, '1EhwUJaExZDWHZT4xbRvpGufXvRTRJi2km');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (30, 140, 2, '1M8LkRQgcGwkymzbyYbiAv9ZgLe2yb9N2L');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (86, 141, 3, '1A9YiZS3bgu3JRgwJu9QF5fydyCQKtnnit');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (89, 142, 1, '1HS6vw6KbaBCsgMHsctQ3gVA6FvXuYesuv');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (41, 143, 3, '1NsZnFiTg26CGETRZaYSJmFM1FLmiNGwJ9');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (90, 144, 3, '1CnCC38Zf6i9wqy6eyuTmfrKsFw3tC9EEQ');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (31, 145, 2, '1BxH5fdLfdMq6Shv9m3L1otqoNvpt76XXp');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (32, 146, 2, '16TrXM3wD7TuC7bKuhwun5qwnu8vr1TtMS');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (90, 147, 1, '14oveWbGZhG9vphpsKQqcYzHqwoPJRK2Hj');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (93, 148, 1, '1DfFKDccQ6gobyqaVvfjQBVuv7A1dYUqTC');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (94, 149, 1, '18B9C2GkTPY5VrNay7uzxChyfmdY76ufhf');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (94, 150, 3, '1EqqH25rKTWesYaoA1dtZVmUrKPBsWBwhg');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (95, 151, 1, '143pQmBci2rxL9aXfNaSqhDjVpDUD6tuiM');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (95, 152, 3, '1Nsc28xiSFKsW35noE99VRx6G3PSrpoZQT');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (96, 153, 3, '12L3qKsri4jiC2S43yMwnAVqappmeEjaHd');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (97, 154, 1, '1ALXoaFf91KdpqxpZ5FsSdoQt34RvNF9by');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (33, 155, 2, '1Nd7NowoS8iDGz64gEHVCVdxbq7gg1YkjF');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (97, 156, 3, '1P18EWg7RoKs3yydq321b5FDdVcC8kYFFz');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (98, 157, 3, '17WeqAqe7mHkWVmfPzXFpopMjtvc1h4Pib');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (99, 158, 1, '14ddb5vjae6Gj2p1qa2rKaJFoEhbz6ZfYD');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (55, 159, 3, '1L7K9R5kqVCHfXqYrthfVd46Qqi9osQRyw');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (34, 160, 2, '1G2BLG1eKGFBKqAo6wuoS5zPtvDDFjoHQQ');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (60, 161, 3, '1JpKZsRjvJGcxz3BE3pVsFr58J9b5mxqZJ');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (100, 162, 3, '1Mi9eF3dArLP49rzFtJWsjMVheLKzMKJuX');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (100, 163, 1, '1P9mQW87L2H2LPVVjSQ4yaHjwKM4UWoQgv');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (101, 164, 1, '1GJHgnNNVLYLXnTAkVxmvZAKcFYiqo9i33');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (62, 165, 2, '1A2AhWE9SxLgmD9Tsf7hHrN3AjXmSrrQQi');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (36, 166, 2, '168Nfut13TmoRMd7QwYdsCCeUdbUBe1PTP');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (37, 167, 2, '19rNdTvQ4fGxcp9wqfdSva5CkqPR8m6Lgy');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (68, 168, 2, '1EGnjo3KMwnifQYbn9Sg99mJcNDNiWiq9X');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (56, 169, 1, '1DrWynfRbzCjF9bukEq9KBffcwHYX9qcTj');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (39, 170, 2, '1Q5MM96CBc4wh2MzSDVmzh1dVtHt5RY1kt');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (105, 171, 1, '1EULvWdHbhgsDqpbu35dCgjkXfwek4NzCN');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (106, 172, 3, '1J5DT3S98uaMMeC98qT8YQgCFkHZyQGPvr');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (69, 173, 2, '1BD78KuxhsqaeFtdmSTs5kxaTRHkUNt9Hn');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (56, 174, 3, '18Un6dFRs65nP7p88qE7jYRQm3GZc3UQbM');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (101, 175, 3, '17Ejzc85ymDnBtsviFwtxXNPqYS4KqpFrA');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (53, 176, 1, '1HicxYDawYL8gtW8UHN4HmuMaCS6VPyHjf');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (53, 177, 3, '1ARhDiLVLvchwpUuQqE6Mudh1b5xpGaMN');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (54, 178, 3, '1MHH3hTeBLeEnYEU1gpK1Jx47ivx9RyX4q');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (50, 179, 3, '1CwJCQynyXxW9sThTqscsP5GK3cf2YKcfJ');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (91, 180, 1, '14YUGxodDDVuPMZYMNQQ7WT6jWNS7Xvdtu');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (52, 181, 1, '19UM48HAp4EwLC26FJqBcD44tZ5ES9cKr8');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (70, 182, 2, '1AUrgTMiWGwrVMWpvbsexAWbAZzJNgLUTW');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (73, 183, 2, '1EyG23gneTk6oAfvbYKMzLcwdsj4d6b9Qr');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (42, 184, 3, '1Gfs7S3RpDiX13FrqffcAR15kbNeLJy2vw');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (49, 185, 1, '1LhSUQe5icwHy5FFaPFYzkwpvQRDbvvJFj');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (42, 186, 2, '1oUPEnF9d2SvB1gAKJH35n7FYnLRs8X49');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (42, 187, 1, '14ctbfNSAWY8njMF6GW8VvyotA6sVpvMzt');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (43, 188, 3, '14bJGCD54FzN4qqEZdUUnxzJdFkjocGj5a');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (43, 189, 1, '1Mvf7JpRiZGxQrnHN9pSP4ee9BfqF6W7Tq');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (44, 190, 3, '1L7sDUuFwhGSuVYZ76NBkQwYUrFt2K78jH');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (43, 191, 2, '1PVcYKZF4btfQPzz5x9qXkMRCyQxPzfGZW');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (44, 192, 2, '1LaGggGMoYXgeKtaD1GrJ1BWHcPdJqsi8L');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (45, 193, 2, '1KXG1EMBhVD4fbztWmYVJ1muG3Qse8wqza');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (46, 194, 3, '1Q4zGDt8DP2pspKd63PEXSg6cbdekCfPEC');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (44, 195, 1, '1AFECByk5huznhJHMtg5oEv1ojMfXjkMjK');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (45, 196, 1, '1HjJQhsnCfJVswVL6Mnkn7dUk829D3QhK8');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (45, 197, 3, '16jRc3kdf8kXRymdUTH2hhgtBs4A93Uj8P');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (46, 198, 2, '1GAgQa5KHznZgrqHYvaZRKujVju9YW1bEE');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (47, 199, 3, '1PTPsVeu1MxzTz6gMZA8RZEvBYtJTNC9Rs');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (46, 200, 1, '14rTEVg838TuiACnFv4izXiuJS8W6EdWjq');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (74, 201, 2, '19cSj9HKKpbc76dwzgMMgfuM9xvKyk3rRs');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (47, 202, 2, '19rVhzUJd5gyPZMTKVAq3AsiX47HL3Q6To');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (52, 203, 3, '1JP3h8VBTAs1NLEEh2EiWkXA97yF28gRMz');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (48, 204, 3, '1PXFUDvbm5WAG61Eb7c3yY4uwHu9MYgjtF');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (52, 205, 2, '1L44hsPCLoi1dfgTsekZnacohHwMBL4WWf');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (71, 206, 2, '1NVaGuV6WgWm8fNB3VZmqnrr3SjTem6yP8');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (47, 207, 1, '1FcXbnyvYnrGG7g1pKJiQPbAZrzJT3GPhN');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (49, 208, 2, '1DicD13FyEEYCGaq7o96n5Z8qHK65YkiiW');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (49, 209, 3, '19wWG1JDRxXYrqNVwhbmm3UFpwTVA3c4pg');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (56, 210, 2, '16NgG9PgvP7KHi6DuLSYbzktnkoeuxRfDL');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (88, 211, 2, '1MJdRAyD6R2JHRwY4rHK8Gwv4XEETLpNaT');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (92, 212, 1, '19MMR5NBpTdm5fSFnrnFQWqyykUXYEESXa');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (59, 213, 3, '1MZncgjTNVfw65XTdBrfFHN7iyLmYjnyth');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (53, 214, 2, '1MLumgQKbVgPChqmbTBLDdUpsvmpLRatXE');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (50, 215, 1, '1M4v1Wzse6YRgs2n54mDJfS3X5qGeUdoL8');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (54, 216, 1, '13SyFY1bDLFj6Gqpnu4yfFT4cZY2tDznBa');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (83, 217, 2, '1DA9nCrvjmpKWSFnQKPXi8pjAF1cMtppE5');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (91, 218, 2, '122VoPX83ZMbTEGBUSccfLeAExpc11vE5B');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (57, 219, 1, '154hwUm2vVXqZmaYKw6j5zra3TSoS1Kv2W');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (88, 220, 3, '18svmDAKeZTYXwnB329Hem6fjpHZ3hta3j');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (92, 221, 2, '1DqW2ES3fZNJRvzr5zAkjYs3FsQw7UCaWM');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (55, 222, 2, '1HBRwVzwcx8NYENGVqooFeCQ6tFbTHm6K7');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (55, 223, 1, '1G8psu2YxbjRA6HiZfYQFtkedxbBGqq88C');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (60, 224, 2, '17tH3dddNffAU92th7VEfswHkpU41LMarK');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (58, 225, 1, '1NmpXMPSTPikPjXujG9NgFMrt4DLu91u1a');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (59, 226, 1, '1AjJDLt1mzNzzL6g9w7eKegVFTfibfj6FU');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (60, 227, 1, '1698v2GjJ3fnKmPBbM7YRNttZnCHqyxxcm');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (105, 228, 3, '16NfTAs1o9NbcH1AwUscgUeDDjHYGaokgY');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (102, 229, 1, '1NJTH4o4igmd1jSdDQAJeHdZjz9S74DTbu');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (106, 230, 1, '19jR7mGb2APEEcUBT9pGpPtxFbnfgSH1uM');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (102, 231, 3, '13W4cEMjD2nwLB2UzmwqEq8nYv7KJAWXqS');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (103, 232, 1, '18YNUjkWgBzH8AravSUcnLBdhpvDpTwwzQ');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (103, 233, 3, '1Mia75rEXeBDyHCxb7jdxpeLjefDF9M6Mi');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (104, 234, 1, '1NvwLXjXnp6LazicnELpM212iFTB72vByC');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (104, 235, 3, '1ER91o3oDMijXFhHJqmd17UcseFzQRJCUB');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (108, 236, 1, '1CBxbRBrtGCzQoWA8hS6dodDtr7uVYxqua');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (106, 237, 2, '1JRgwFBUrE3aZJ4vnXbzpwHXu4rAjigVfJ');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (107, 238, 3, '12gdqEFuGHBS2BFRLvVn7Myf2GudNjcVmS');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (107, 239, 1, '1A6oF15SWtX9pszz2qyiTJDPEqqtAqemUJ');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (108, 240, 3, '15dT2n32h2zRJg4pNYhWcstsTbbcqcnZb6');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (23, 241, 1, '20N2bAAUSum29mXtd1HjD1qk5aNLUrUd2g');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (101, 242, 2, '21N2bAAUSum29mXtd1HjD1qk5aNLUrUd2g');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (104, 243, 2, '22N2bAAUSum29mXtd1HjD1qk5aNLUrUd2g');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (105, 244, 2, '23N2bAAUSum29mXtd1HjD1qk5aNLUrUd2g');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (65, 245, 2, '24N2bAAUSum29mXtd1HjD1qk5aNLUrUd2g');
insert into Dokumen (idMahasiswa, idDokumen, jenis, link) values (66, 246, 2, '25N2bAAUSum29mXtd1HjD1qk5aNLUrUd2g');

