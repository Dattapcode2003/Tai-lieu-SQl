create database bt33_22cntt1a
use bt33_22cntt1a
create table GIAOVIEN
(
    MAGV int not null,
    HOTEN nvarchar(50) not null,
	NTNS date,
	DC nvarchar(300) ,
	/*Tao khoa chính */
	constraint pk_GIAOVIEN primary key(MAGV),
)
INSERT INTO GIAOVIEN(MAGV,HOTEN,NTNS,DC) VALUES (1,'Tran Thanh','1959/01/02','12/4 Tran B.Trong Q1')
INSERT INTO GIAOVIEN(MAGV,HOTEN,NTNS,DC) VALUES (2,'Nguyen Nam','1960/02/04','30 Dien Bien Phu Q1')
INSERT INTO GIAOVIEN(MAGV,HOTEN,NTNS,DC) VALUES (3,'Ho Nhan','1960/03/04','123 Ho Quy Cap Q1')
INSERT INTO GIAOVIEN(MAGV,HOTEN,NTNS,DC) VALUES (4,'Duong Hung','1958/03/03','23 Hai Ba Trung')
select * from GIAOVIEN

create table HOCVIEN
(
	MAHV int not null,
	HO nvarchar(20) not null,
	TEN nvarchar(50) not null,
	NTNS date,
	DC nvarchar(300),
	NNGHIEP nvarchar(20) not null
	/*Tạo khóa chính*/
	constraint pk_HOCVIEN primary key(MAHV),
	/*Tạo khóa ngoai*/
	constraint fk_HOCVIEN foreign key(MAHV) references GIAOVIEN(MAGV)
	on update cascade on delete cascade
)
INSERT INTO HOCVIEN(MAHV,HO,TEN,NTNS,DC,NNGHIEP) VALUES (0,'Ho Thanh','Son','1968/01/01','209 Tran Hung Dao Q5','Bac Si')
select * from HOCVIEN

create table KHOAHOC
(
	MAKH int not null,
	TENKH nvarchar(30) not null,
	BD int not null,
	KT int not null,
	/*tạo kháo chính*/
	constraint pk_KHOAHOC primary key(MAKH),
	/*Tạo khóa ngoai*/
	constraint fk_KHOAHOC foreign key(MAKH) references GIAOVIEN(MAGV)
	on update cascade on delete cascade
)
create table LOPHOC
(
	MALOP int not null,
	TENLOP nvarchar(50) not null,
	MAKH int not null,
	MAGV int not null,
	SISODK int not null,
	LTRG nvarchar(100) not null,
	PHHOC int not null,
	/*Tạo khóa chính*/
	constraint pk_LOPHOC primary key(MALOP),
	/*Tạo khóa ngoai*/
	constraint fk_LOPHOC foreign key(MALOP) references GIAOVIEN(MAGV)
	on update cascade on delete cascade
)
create table BIENLAI
(
	MAKH int not null,
	MALH int not null,
	MAHV int not null,
	SOBL int not null,
	DIEM int,
	KQUA int,
	XEPLOAI int not null,
	TIENNOP int not null,
	/*Tạo khóa chính*/
	constraint pk_BIENLAI primary key(MAHV),
	/*tạo khóa ngoại*/
	constraint fk_BIENLAI foreign key(MAHV) references GIAOVIEN(MAGV)
	on update cascade on delete cascade
)
