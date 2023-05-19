create database bt02_22cntt1a
use bt02_22cntt1a
/* th? t? t?o b?ng: NHANVIEN, PHONGBAN, DIADIEM_PHG, DEAN, PHANCONG, THANNHAN*/
create table PHONGBAN
(
    TENPHONG  nvarchar(50) not null,
    MAPHG int not null,
	TRPHG int not null,
	NG_NHANCHUC int not null ,
	/*Tao khoa chính */
	constraint pk_PHONGBAN primary key(MAPHG) 
)
INSERT INTO PHONGBAN(TENPHONG,MAPHG,TRPHG,NG_NHANCHUC) VALUES ('Nghiên C?u',5,333445555,'1978/05/22')
create table NHAN_VIEN
(
	HONV nvarchar(20) not null,
	TENLOT nvarchar(100) not null,
	TENNV nvarchar(20) not null,
	MANV int not null,
	NGSINH date,
	DCHI nvarchar(300),
	PHAI nchar(4),
	LUONG int not null,
	MA_NQL int not null,
	PHG int not null,
	/*Khoá chính*/
	constraint pk_NHAN_VIEN primary key(MANV),
	/*Khoá ngoài*/
	constraint fk_NHAN_VIEN foreign key(PHG) references PHONGBAN(MAPHG)
	on update cascade on delete cascade
)
create table DEAN
(
	MADA int not null,
	TENDA nvarchar(100) not null,
	DDIEM_DA nvarchar(50) not null,
	PHONG int not null,
	/*Khoá chính*/
	constraint pk_DEAN primary key(MADA),
	/*Khoá Ph?*/
	constraint fk_DEAN_PHONGBAN foreign key(PHONG) references PHONGBAN(MAPHG)
	on update cascade on delete cascade
)
create table DIADIEM_PNG
(
	MAPHG int not null,
	DIADIEM nvarchar(50) not null,
	/*KHoa chinh*/
	constraint pk_DIADIEM_PNG primary key(MAPHG,DIADIEM),
	/*Khoa ngoai*/
	constraint fk_DIADIEM_PHONGBAN foreign key(MAPHG) references PHONGBAN(MAPHG)
	on update cascade on delete cascade
)
create table THANHNHAN
(
	MA_NHAN_VIEN int not null,
	TENTN nvarchar(100) not null,
	PHAI nvarchar(50),
	NGSINH date,
	QUANHE nvarchar(100),
	/*KHoa chinh*/
	constraint pk_THANNHAN primary key(MA_NHAN_VIEN,TENTN),
	/*Khoa ngoai*/
	constraint fk_THANHNHAN_NVIEN foreign key(MA_NHAN_VIEN) references NHAN_VIEN(MANV)
	on update cascade on delete cascade
)
create table PHANCONG
(
	MA_NHAN_VIEN int not null,
	SODA int not null,
	THOIGIAN numeric(3,1) not null,
	/*KHoa chinh*/
	constraint pk_PHANCONG primary key(MA_NHAN_VIEN,SODA),
	/*Khoa ngoai*/
	constraint fk_PHANCONG_DEAN foreign key(SODA) references DEAN(MADA)
	on update cascade on delete cascade
)

---------------------------------------------------------------------------
INSERT INTO PHONGBAN(TENPHONG,MAPHG,TRPHG,NG_NHANCHUC) VALUES ('Nguyên C?u',5,333445555,'22/05/1978')