create database bt03_22cntt1a
use bt03_22cntt1a
/* thứ tự tạo bảng: KHOAHOC, HOCVIEN, GIAOVIEN, LOPHOC, BIENLAI*/
create table KHOAHOC
(
	MAKH int not null,
	TENKH nvarchar(30) not null,
	BD int not null,
	KT int not null,
	/*tạo kháo chính*/
	constraint pk_KHOAHOC primary key(MAKH)
)
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
	constraint fk_HOCVIEN foreign key(MAHV) references KHOAHOC(MAKH)
	on update cascade on delete cascade
)
create table GIAOVIEN
(
    MAGV int not null,
    HOTEN nvarchar(50) not null,
	NTNS date,
	DC nvarchar(300) ,
	/*Tao khoa chính */
	constraint pk_GIAOVIEN primary key(MAGV),
	/*Tạo khóa ngoai*/
	constraint fk_GIAOVIEN foreign key(MAGV) references KHOAHOC(MAKH)
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
	constraint fk_LOPHOC foreign key(MALOP) references KHOAHOC(MAKH)
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
	constraint fk_BIENLAI foreign key(MAHV) references KHOAHOC(MAKH)
	on update cascade on delete cascade

)