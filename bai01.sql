create database bt01_22cntt1a
use bt01_22cntt1a
/* thứ tự tạo bảng: SVIEN, MHOC, KHOC, DKIEN, KQUA*/
create table SVIEN
(
	MASV int not null ,
	TEN nvarchar(50) not null,
	NAM int,
	KHOA char(4),
	/*Tao khoa chính */
	constraint pk_SVIEN primary key(MASV) 
)
create table MHOC
(
	MAMH char(8) not null,
	TEN_MH nvarchar(50) not null,
	TINCHI int,
	KHOA char(4),
	/*Tao khoa chính */
	constraint pk_MHOC primary key(MAMH)
)
Create table KHOC
(
	MAKH int not null,
	MAMH char(8) not null,
	HOCKY int,
	NAM int,
	GV nvarchar(50),
	/*Tao khoa chính */
	constraint pk_KHOC primary key(MAKH),
	/*Tao khoa ngoai */
	constraint fk_KHOC_MHOC foreign key(MAMH) references MHOC(MAMH) 
	on update cascade on delete cascade
)
create table DKIEN
(
	MAMH char(8) not null,
	MAMH_TRUOC char(8) not null,
	/*Tao khoa chính */
	constraint pk_DKIEN primary key(MAMH,MAMH_TRUOC),
	/*Tao khoa ngoai */
	constraint fk_DKIEN_MHOC foreign key(MAMH) references MHOC(MAMH) 
	on update cascade on delete cascade 
)
create table KQUA
(
	MASV int not null,
	MAKH int not null,
	DIEM int,
	/*Tao khoa chính */
	constraint pk_KQUA primary key(MASV,MAKH),
	/*Tao khoa ngoai */
	constraint fk_KQUA_SVIEN foreign key(MASV) references  SVIEN(MASV)
	on update cascade on delete cascade, 
	constraint fk_KQUA_KHOC foreign key(MAKH) references  KHOC(MAKH)
	on update cascade on delete cascade 
)
/*----------------------*/
/*in ra teân các tên sinh viên*/
select * from 
