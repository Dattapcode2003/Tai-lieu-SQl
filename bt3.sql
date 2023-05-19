create database btkt03_22cntt1a
use	btkt03_22cntt1a
create table GIAOVIEN
(
MAGV int ,
HOTEN  nvarchar(100) not null,
NTNS date not null ,
DC int not null,
/* tao khao chinh*/
constraint pk_GIAOVIEN primary key(MAGV),
)
alter table GIAOVIEN alter column DC varchar(100)
insert into GIAOVIEN(MAGV,HOTEN,NTNS,DC) values(1,'Tran Thanh','02-01-59','12/4 Tran B.Trong Q1')
insert into GIAOVIEN(MAGV,HOTEN,NTNS,DC) values(2,'Nguyen Nam','04-02-60','30 Dien Bien Phu Q1 ')
insert into GIAOVIEN(MAGV,HOTEN,NTNS,DC) values(3,'Ho Nhan','04-03-60','123 Ho Quy Cap Q1 ')
insert into GIAOVIEN(MAGV,HOTEN,NTNS,DC) values(4,'Duong Hung','03-03-58','23 Hai Ba Trung ')
insert into GIAOVIEN(MAGV,HOTEN,NTNS,DC) values(5,'Le Thuong','07-05-65','61/4 Huynh Man Dat ')	
select * from GIAOVIEN
create table LOPHOC
(
MALOP int not null,
TENLOP nvarchar(50) not null,
MAKH nvarchar(50) not null,
MAGV int ,
SISODK int not null,
LTRG int not null,
PHHOC int not null,
/* tao khao chinh*/
constraint pk_LOPHOC primary key(MALOP),
/*tạo khóa ngoại*/
constraint fk_LOPHOC_KHOC  foreign key(MAKH) references KHOC(MAKH) 
on update cascade on delete cascade ,
)
alter table LOPHOC alter column LTRG int null
/*thêm 1 khóa ngoại vòa bảng LOPHOC */
ALTER TABLE LOPHOC
ADD CONSTRAINT fk__LOPHOC_GVIEN 
FOREIGN KEY (MAGV)
REFERENCES GIAOVIEN (MAGV);
insert into LOPHOC(MALOP,TENLOP,MAKH,MAGV,SISODK,LTRG,PHHOC) values(1,'Tieng Phap pho Thong 1.1','PT197',1,10,9,101)
insert into LOPHOC(MALOP,TENLOP,MAKH,MAGV,SISODK,LTRG,PHHOC) values(2,'Tieng Phap pho Thong 2.1','PT297',2,10,6,201)
insert into LOPHOC(MALOP,TENLOP,MAKH,MAGV,SISODK,LTRG,PHHOC) values(3,'Tieng Phap pho Thong 1.2','PT297',3,20,17,202)
insert into LOPHOC(MALOP,TENLOP,MAKH,MAGV,SISODK,LTRG,PHHOC) values(4,'Tieng Phap chuyen tu A','CT197',4,15,null,203)
select * from LOPHOC
create table KHOC
(
MAKH   nvarchar(50) not null,
TENKH  nvarchar(50) not null,
BD date not null,
KT  date not null,
/* tao khao chinh*/
constraint pk_KHOC primary key(MAKH),
/*tạo khóa ngoại*/
/*constraint fk_KHOC_BIENLAI  foreign key(MAKH) references BIENLAI(MAKH) 
on update cascade on delete cascade*/
)
insert into KHOC(MAKH,TENKH,BD,KT) values('PT197','Tieng Phap pho Thong khoa 1/97','1997-02-15','1997-05-15')
insert into KHOC(MAKH,TENKH,BD,KT) values('PT297','Tieng Phap pho Thong khoa 2/97','1997-05-30','1997-08-30')
insert into KHOC(MAKH,TENKH,BD,KT) values('CT197','Tieng Phap pho Thong khoa 2/97','1997-05-30','1997-08-30')
select * from KHOC
create table BIENLAI
(
MAKH  nvarchar(10) not null,
MALH int not null,
MAHV int not null,
SOBL int not null,
DIEM FLOAT not null,
KQUA nvarchar(50) not null,
XEPLOAI nvarchar(50) not null,
TIENNOP int,
constraint CHK_DIEM check (DIEM <=10 and DIEM >=0),
constraint BIENLAI_KQUA check (KQUA  = N'DAU' or KQUA  = N'KHONG DAU'),
constraint BIENLAI_XEPLOAI check ( XEPLOAI = N'GIOI' or XEPLOAI  = N'KHA' or XEPLOAI  = N'YEU' or XEPLOAI  = N'TB'),
/* tao khao chinh*/
constraint pk_BIENLAI primary key(MAKH,MAHV),
)
/*sửa kiểu dữ liệu lại cho cột MAKH của bảng BIENLAI*/
ALTER TABLE BIENLAI
ALTER column  MAKH nvarchar(50) not null;
/*tạo khóa ngoại*/
ALTER TABLE BIENLAI
ADD CONSTRAINT fk_BIENLAI_KHOC
FOREIGN KEY (MAKH)
REFERENCES KHOC(MAKH);
/*tạo khóa ngoại*/
ALTER TABLE BIENLAI
ADD CONSTRAINT fk_BIENLAI_HOCVIEN
FOREIGN KEY (MAHV)
REFERENCES HOCVIEN(MAHV);
insert into BIENLAI(MAKH,MALH,MAHV,SOBL,DIEM,KQUA,XEPLOAI,TIENNOP) values('PT197',1,1,1,8,'DAU','KHA',100000)
insert into BIENLAI(MAKH,MALH,MAHV,SOBL,DIEM,KQUA,XEPLOAI,TIENNOP) values('PT197',1,2,2,4,'KHONG DAU','YEU',100000)
insert into BIENLAI(MAKH,MALH,MAHV,SOBL,DIEM,KQUA,XEPLOAI,TIENNOP) values('PT197',1,3,3,4,'KHONG DAU','YEU',100000)
insert into BIENLAI(MAKH,MALH,MAHV,SOBL,DIEM,KQUA,XEPLOAI,TIENNOP) values('PT197',1,4,4,3,'KHONG DAU','YEU',100000)
insert into BIENLAI(MAKH,MALH,MAHV,SOBL,DIEM,KQUA,XEPLOAI,TIENNOP) values('PT197',1,5,5,4,'KHONG DAU','YEU',100000)
select * from BIENLAI
create table HOCVIEN
(
MAHV int not null ,
HO  nvarchar(50) not null,
TEN nvarchar(50) not null,
NTNS date not null ,
DC int not null,
NNGHIEP  nvarchar(100) not null,
/* tao khao chinh*/
constraint pk_HOCVIEN primary key(MAHV),
)
alter table HOCVIEN alter column DC varchar(100)
insert into HOCVIEN(MAHV,HO,TEN,NTNS,DC,NNGHIEP) values(0,'Ho Thanh','Son','1968-01-01','209 Tran Hung Dao Q5','Bac si')
insert into HOCVIEN(MAHV,HO,TEN,NTNS,DC,NNGHIEP) values(1,'Tran Tam','Thanh','1960-03-04','109/2 CMTT F10 QTB','Giao Vien')
insert into HOCVIEN(MAHV,HO,TEN,NTNS,DC,NNGHIEP) values(2,'Do Nghiem','Phung','1979-01-12','34 Do Duy Duong Q5','Hoc Sinh')
insert into HOCVIEN(MAHV,HO,TEN,NTNS,DC,NNGHIEP) values(3,'Tran Nam','Son','1980-08-03','190/2A Ho Tung Mau Q1','Hoc Sinh')
insert into HOCVIEN(MAHV,HO,TEN,NTNS,DC,NNGHIEP) values(4,'Nguyen Tien','Dung','1969-03-04','23/8 Thai Van Lung Q1','Giao Vien')
insert into HOCVIEN(MAHV,HO,TEN,NTNS,DC,NNGHIEP) values(5,'Mai Thanh','Nam','1976-08-02','12 DBP Q','Cong Nhan')
select * from HOCVIEN
