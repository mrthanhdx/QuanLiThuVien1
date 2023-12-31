CREATE DATABASE QUANLITHUVIEN
USE QUANLITHUVIEN

CREATE TABLE THELOAI(
	ID INT IDENTITY NOT NULL PRIMARY KEY,
	MATHELOAI VARCHAR(10) NOT NULL,
	TENTHELOAI NVARCHAR(50) NULL
)

CREATE TABLE NHAXUATBAN(
	ID INT IDENTITY NOT NULL PRIMARY KEY,
	TENNXB NVARCHAR(50) NULL
)

CREATE TABLE SACH(
	ID INT IDENTITY NOT NULL PRIMARY KEY,
	MASACH VARCHAR(10) NULL,
	TENSACH NVARCHAR(50) NULL,
	NAMXB INT NULL,
	NGAYNHAP DATETIME NULL,
	TINHTRANG NVARCHAR(50) NULL,
	IDNHAXB INT FOREIGN KEY REFERENCES NHAXUATBAN(ID),
)

CREATE TABLE THELOAISACH(
	ID INT IDENTITY NOT NULL PRIMARY KEY,
	IDTHELOAI INT FOREIGN KEY REFERENCES THELOAI(ID),
	IDSACH INT FOREIGN KEY REFERENCES SACH(ID)
)


CREATE TABLE TACGIA(
	ID INT IDENTITY NOT NULL PRIMARY KEY,
	MATACGIA VARCHAR(10) NOT NULL,
	TENTACGIA NVARCHAR(50) NULL,
	GIOITINH NVARCHAR(50) NULL,
	QUOCTICH NVARCHAR(50) NULL
)

CREATE TABLE TACGIASACH(
	ID INT IDENTITY NOT NULL,
	IDSACH INT FOREIGN KEY REFERENCES SACH(ID),
	IDTACGIA INT FOREIGN KEY REFERENCES TACGIA(ID),
	VAITRO NVARCHAR(50) NULL
)

CREATE TABLE TAIBAN(
	ID INT IDENTITY NOT NULL PRIMARY KEY,
	IDSACH INT NOT NULL FOREIGN KEY REFERENCES SACH(ID),
	LANTAIBAN INT NULL,
	THOIGIANTB DATETIME NULL,
	TRANGTHAI NVARCHAR(50) NULL
)

CREATE TABLE VITRI (
	ID INT IDENTITY NOT NULL PRIMARY KEY,
	DAYSO VARCHAR(10) NULL,
)

CREATE TABLE QUYENSACH(
	ID INT IDENTITY NOT NULL PRIMARY KEY,
	MAQUYENSACH VARCHAR(10) NOT NULL,
	TINHTRANG NVARCHAR(50) NULL,
	IDVITRI INT NOT NULL FOREIGN KEY REFERENCES VITRI(ID),
	IDTAIBAN INT NOT NULL FOREIGN KEY REFERENCES TAIBAN(ID)
)

CREATE TABLE HANGTHANHVIEN (
	ID INT IDENTITY NOT NULL PRIMARY KEY,
	MAHTV VARCHAR(10) NOT NULL,
	TEN NVARCHAR(50) NULL,
	DONGIA MONEY NULL,
	PHITHUESACH MONEY NULL,
	THOIGIANHIEULUC TIME NULL,
)
DROP TABLE THETHANHVIEN
	CREATE TABLE THETHANHVIEN (
		ID INT IDENTITY NOT NULL PRIMARY KEY,
		MATHETV VARCHAR(10) NULL,
		IDHANGTV INT NOT NULL FOREIGN KEY REFERENCES HANGTHANHVIEN(ID),
		NGAYCAP DATETIME NULL,
		NGAYHIEULUC DATETIME NULL,
		TGHIEULUC TIME NULL,
		IDTHANHVIEN INT NOT NULL FOREIGN KEY REFERENCES THANHVIEN(ID),
		OLDID INT NULL,
		TRANGTHAI NVARCHAR(50) NULL
	)

CREATE TABLE THANHVIEN(
	ID INT IDENTITY NOT NULL PRIMARY KEY,
	MATHANHVIEN VARCHAR(50) NULL,
	TENTHANHVIEN NVARCHAR(50) NULL,
	SDT VARCHAR(10) NULL,
	DIACHI NVARCHAR(100) NULL,
	EMAIL VARCHAR(100) NULL,
	CCCD VARCHAR(50) NULL,
	NGAYSINH DATE NULL,
	NGAYDANGKI DATE NULL
)

CREATE TABLE NHANVIEN(
	ID INT IDENTITY NOT NULL PRIMARY KEY,
	TENNHANVIEN NVARCHAR(50) NULL,
	MANHANVIEN VARCHAR(50) NULL,
	USERNAMENV VARCHAR(50) NULL,
	PASSWORDNV VARCHAR(50) NULL,
	VAITRO NVARCHAR(50) NULL,
	TRANGTHAI NVARCHAR(50) NULL
)

CREATE TABLE PHIEUMUON (
	ID INT NOT NULL IDENTITY PRIMARY KEY,
	IDTHANHVIEN INT NOT NULL FOREIGN KEY REFERENCES THANHVIEN(ID),
	IDNHANVIEN INT NOT NULL FOREIGN KEY REFERENCES NHANVIEN(ID),
	NGAYMUON DATETIME NULL,
	NGAYPHAITRA DATE NULL,
	TIENCOC MONEY
)
CREATE TABLE PHIEUMUONCT (
	ID INT NOT NULL IDENTITY PRIMARY KEY,
	IDPHIEUMUON INT NOT NULL FOREIGN KEY REFERENCES PHIEUMUON(ID),
	IDQUYENSACH INT NOT NULL FOREIGN KEY REFERENCES QUYENSACH(ID)
)

CREATE TABLE PHIEUTRA(
	ID INT NOT NULL IDENTITY PRIMARY KEY,
	IDTHANHVIEN INT NOT NULL FOREIGN KEY REFERENCES THANHVIEN(ID),
	IDNHANVIEN INT NOT NULL FOREIGN KEY REFERENCES NHANVIEN(ID),
	TRANGTHAI NVARCHAR(50) NULL,
	TIENPHAT MONEY NULL,
	LIDOPHAT NVARCHAR(100) NULL,
	NGAYTRATHUCTE DATE NULL,
	TIENTRA MONEY NULL
)

CREATE TABLE PHIEUTRACT (
	IDPHIEUMUONCT INT NOT NULL FOREIGN KEY REFERENCES PHIEUMUONCT(ID),
	IDPHIEUTRA INT NOT NULL FOREIGN KEY REFERENCES PHIEUTRA(ID),
	TINHTRANGSACH NVARCHAR(50) NULL,
	GHICHU NVARCHAR(100) NULL
)