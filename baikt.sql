create database bt134kt_22cntt1a
use bt134kt_22cntt1a
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
primary key(MALOP),
)
INSERT INTO LOPHOC(MALOP,TENLOP,MAKH,MAGV,SISODK,LTRG,PHHOC) VALUES (1,'Tieng Phap pho Thong 1.1','PT197',1,10,9,101)
INSERT INTO LOPHOC(MALOP,TENLOP,MAKH,MAGV,SISODK,LTRG,PHHOC) VALUES (2,'Tieng Phap pho Thong 2.1','PT297',2,10,6,201)
INSERT INTO LOPHOC(MALOP,TENLOP,MAKH,MAGV,SISODK,LTRG,PHHOC) VALUES (3,'Tieng Phap pho Thong 1.2','PT297',3,20,17,202)
INSERT INTO LOPHOC(MALOP,TENLOP,MAKH,MAGV,SISODK,LTRG,PHHOC) VALUES (4,'Tieng Phap chuyen Tu A','CT297',4,15,18,203)
select * from LOPHOC
alter table LOPHOC
add CONSTRAINT fk_LOPHOC_GIAOVIEN
foreign key (MAGV)
references GIAOVIEN(MAGV);
alter table LOPHOC
add CONSTRAINT fk_LOPHOC_KHOC
foreign key (MAKH)
references KHOC(MAKH);
create table GIAOVIEN
(
MAGV int ,
HOTEN  nvarchar(100) not null,
NTNS date not null ,
DC int not null,
/* tao khao chinh*/
primary key(MAGV),
)
alter table GIAOVIEN
alter column DC nvarchar(300)
INSERT INTO GIAOVIEN(MAGV,HOTEN,NTNS,DC) VALUES (1,'Tran Thanh','1959/01/02','12/4 Tran B.Trong Q1')
INSERT INTO GIAOVIEN(MAGV,HOTEN,NTNS,DC) VALUES (2,'Nguyen Nam','1960/02/04','30 Dien Bien Phu Q1')
INSERT INTO GIAOVIEN(MAGV,HOTEN,NTNS,DC) VALUES (3,'Ho Nhan','1960/03/04','123 Ho Quy Cap Q1')
INSERT INTO GIAOVIEN(MAGV,HOTEN,NTNS,DC) VALUES (4,'Duong Hung','1958/03/03','23 Hai Ba Trung')
select * from GIAOVIEN
create table KHOC
(
MAKH   nvarchar(50) not null,
TENKH  nvarchar(50) not null,
BD date not null,
KT  date not null,
/* tao khao chinh*/
primary key(MAKH),
)
INSERT INTO KHOC(MAKH,TENKH,BD,KT) VALUES ('PT197','Tieng phap pho thong khoa 1/97','1997/02/15','1997/05/15')
INSERT INTO KHOC(MAKH,TENKH,BD,KT) VALUES ('PT297','Tieng phap pho thong khoa 2/97','1997/05/30','1997/08/30')
INSERT INTO KHOC(MAKH,TENKH,BD,KT) VALUES ('CT297','Tieng phap chuyen tu khoa 2/97','1997/05/30','1997/08/30')
select * from KHOC

delete from KHOC where MAKH='CT197' or MAKH ='CT97'

alter table BIENLAI
alter column MAKH nvarchar(50)
alter table BIENLAI
add CONSTRAINT fk_BIENLAI_KHOC
foreign key (MAKH)
references KHOC(MAKH);
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
constraint pk_BIENLAI primary key(SOBL),
)
INSERT INTO BIENLAI(MAKH,MALH,MAHV,SOBL,DIEM,KQUA,XEPLOAI,TIENNOP) VALUES ('PT197',1,1,1,8,'DAU','KHA',100.000)
INSERT INTO BIENLAI(MAKH,MALH,MAHV,SOBL,DIEM,KQUA,XEPLOAI,TIENNOP) VALUES ('PT197',1,2,2,4,'KHONG DAU','YEU',100.000)
INSERT INTO BIENLAI(MAKH,MALH,MAHV,SOBL,DIEM,KQUA,XEPLOAI,TIENNOP) VALUES ('PT197',1,1,3,8,'DAU','KHA',100.000)
INSERT INTO BIENLAI(MAKH,MALH,MAHV,SOBL,DIEM,KQUA,XEPLOAI,TIENNOP) VALUES ('PT197',1,1,4,8,'DAU','KHA',100.000)
INSERT INTO BIENLAI(MAKH,MALH,MAHV,SOBL,DIEM,KQUA,XEPLOAI,TIENNOP) VALUES ('PT197',1,1,5,8,'DAU','KHA',100.000)
INSERT INTO BIENLAI(MAKH,MALH,MAHV,SOBL,DIEM,KQUA,XEPLOAI,TIENNOP) VALUES ('PT197',1,1,6,8,'DAU','KHA',100.000)
INSERT INTO BIENLAI(MAKH,MALH,MAHV,SOBL,DIEM,KQUA,XEPLOAI,TIENNOP) VALUES ('PT197',1,1,7,8,'DAU','KHA',100.000)

select * from BIENLAI

ALTER TABLE BIENLAI
ADD CONSTRAINT fk_BIENLAI_HOCVIEN
FOREIGN KEY (MAHV)
REFERENCES HOCVIEN(MAHV);
alter table BIENLAI
add CONSTRAINT fk_BIENLAI_KHOC
foreign key (MAKH)
references KHOC(MAKH);
create table HOCVIEN
(
MAHV int not null ,
HO  nvarchar(50) not null,
TEN nvarchar(50) not null,
NTNS date not null ,
DC int not null,
NNGHIEP  nvarchar(100) not null,
/* tao khao chinh*/
primary key(MAHV),
)
INSERT INTO HOCVIEN(MAHV,HO,TEN,NTNS,DC,NNGHIEP) VALUES (0,'Ho Thanh','Son','1968/01/01','209 Tran Hung Dao Q5','Bac Si')
INSERT INTO HOCVIEN(MAHV,HO,TEN,NTNS,DC,NNGHIEP) VALUES (1,'Tran Tam','Thanh','1960/03/04','109/2 CMTT F10 QTB','Giao Vien')
INSERT INTO HOCVIEN(MAHV,HO,TEN,NTNS,DC,NNGHIEP) VALUES (2,'Do Nghiem','Phung','1979/01/12','34 Do Duy Duong Q5','Hoc Sinh')
INSERT INTO HOCVIEN(MAHV,HO,TEN,NTNS,DC,NNGHIEP) VALUES (3,'Tran Nam','Son','1980/08/03','190/2A Ho Tung Mau Q1','Hoc Sinh')
INSERT INTO HOCVIEN(MAHV,HO,TEN,NTNS,DC,NNGHIEP) VALUES (4,'Nguyen Tien','Dung','1969/08/04','23/8 Thai Van Lung Q1','Giao Vien')
INSERT INTO HOCVIEN(MAHV,HO,TEN,NTNS,DC,NNGHIEP) VALUES (5,'Mai Thanh','Nam','1976/08/02','12 DBP Q1','Cong Nhan')
INSERT INTO HOCVIEN(MAHV,HO,TEN,NTNS,DC,NNGHIEP) VALUES (6,'Tran Doan','Hung','1968/01/19','189 Tran Van Bo Q4','Giao Vien')
select * from HOCVIEN
alter table HOCVIEN
alter column DC nvarchar(300)