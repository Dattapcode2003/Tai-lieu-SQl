create database bt13_22cntt1a
use bt13_22cntt1a
create table GIAOVIEN
(
MAGV int ,
HOTEN  nvarchar(100) not null,
NTNS date not null ,
DC int not null,
/* tao khao chinh*/
constraint pk_GIAOVIEN primary key(MAGV),
)

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
/*thêm 1 khóa ngoại vòa bảng LOPHOC */
ALTER TABLE LOPHOC
ADD CONSTRAINT fk__LOPHOC_GVIEN 
FOREIGN KEY (MAGV)
REFERENCES GIAOVIEN (MAGV);

create table KHOC
(
MAKH int  not null,
TENKH  nvarchar(50) not null,
BD date not null,
KT  date not null,
/* tao khao chinh*/
constraint pk_KHOC primary key(MAKH),
/*tạo khóa ngoại*/
constraint fk_KHOC foreign key(MAKH) references GIAOVIEN(MAGV) 
on update cascade on delete cascade
)
INSERT INTO KHOC(MAKH,TENKH,BD,KT) VALUES ('PT197','Tieng phap pho thong khoa 1/97','1997/02/15','1997/05/15')
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
select * from BIENLAI
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
INSERT INTO HOCVIEN(MAHV,HO,TEN,NTNS,DC,NNGHIEP) VALUES (0,'Ho Thanh','Son','1968/01/01','209 Tran Hung Dao Q5','Bac Si')
