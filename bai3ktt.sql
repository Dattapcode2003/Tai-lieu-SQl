create database bt3ktt_22cntt1a
use bt3ktt_22cntt1a
/*Tạo bảng: nêu trình tự tạo bảng
1/ Xác định khóa chính, khóa ngoại trong từng  bảng?
2/ Xác định thứ tự theo 3 mức ưu tiên? 
UT1: GIAOVIEN
UT2: HOCVIEN, KHOAHOC
UT3: LOPHOC, BIENLAI*/

create table GIAOVIEN
(
    MAGV int not null,
    HOTEN nvarchar(50) not null,
	NTNS date not null,
	DC nvarchar(300) ,
	/*Tao khoa chính */
	constraint pk_GIAOVIEN primary key(MAGV),
)
alter table GIAOVIEN alter column DC varchar(100)
INSERT INTO GIAOVIEN(MAGV,HOTEN,NTNS,DC) VALUES (1,'Tran Thanh','1959/01/02','12/4 Tran B.Trong Q1')
INSERT INTO GIAOVIEN(MAGV,HOTEN,NTNS,DC) VALUES (2,'Nguyen Nam','1960/02/04','30 Dien Bien Phu Q1')
INSERT INTO GIAOVIEN(MAGV,HOTEN,NTNS,DC) VALUES (3,'Ho Nhan','1960/03/04','123 Ho Quy Cap Q1')
INSERT INTO GIAOVIEN(MAGV,HOTEN,NTNS,DC) VALUES (4,'Duong Hung','1958/03/03','23 Hai Ba Trung')
insert into GIAOVIEN(MAGV,HOTEN,NTNS,DC) values(5,'Le Thuong','07-05-65','61/4 Huynh Man Dat ')
select * from GIAOVIEN
create table LOPHOC
(
	MALOP int not null,
	TENLOP nvarchar(50) not null,
	MAKH varchar(30) not null,
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
INSERT INTO LOPHOC(MALOP,TENLOP,MAKH,MAGV,SISODK,LTRG,PHHOC) VALUES (1,'Tieng Phap pho Thong 1.1','PT197',1,10,9,101)
INSERT INTO LOPHOC(MALOP,TENLOP,MAKH,MAGV,SISODK,LTRG,PHHOC) VALUES (2,'Tieng Phap pho Thong 2.1','PT297',2,10,6,201)
INSERT INTO LOPHOC(MALOP,TENLOP,MAKH,MAGV,SISODK,LTRG,PHHOC) VALUES (3,'Tieng Phap pho Thong 1.2','PT297',3,20,17,202)
INSERT INTO LOPHOC(MALOP,TENLOP,MAKH,MAGV,SISODK,LTRG,PHHOC) VALUES (4,'Tieng Phap chuyen Tu A','CT297',4,15,18,203)
select * from LOPHOC
create table HOCVIEN
(
	MAHV int not null,
	HO nvarchar(20) not null,
	TEN nvarchar(50) not null,
	NTNS date not null,
	DC nvarchar(300) not null,
	NNGHIEP nvarchar(20) not null
	/*Tạo khóa chính*/
	constraint pk_HOCVIEN primary key(MAHV),
	/*Tạo khóa ngoai*/
	/*constraint fk_HOCVIEN foreign key(MAHV) references GIAOVIEN(MAGV)
	on update cascade on delete cascade*/
)
INSERT INTO HOCVIEN(MAHV,HO,TEN,NTNS,DC,NNGHIEP) VALUES (0,'Ho Thanh','Son','1968/01/01','209 Tran Hung Dao Q5','Bac Si')
INSERT INTO HOCVIEN(MAHV,HO,TEN,NTNS,DC,NNGHIEP) VALUES (1,'Tran Tam','Thanh','1960/03/04','109/2 CMTT F10 QTB','Giao Vien')
INSERT INTO HOCVIEN(MAHV,HO,TEN,NTNS,DC,NNGHIEP) VALUES (2,'Do Nghiem','Phung','1979/01/12','34 Do Duy Duong Q5','Hoc Sinh')
INSERT INTO HOCVIEN(MAHV,HO,TEN,NTNS,DC,NNGHIEP) VALUES (3,'Tran Nam','Son','1980/08/03','190/2A Ho Tung Mau Q1','Hoc Sinh')
INSERT INTO HOCVIEN(MAHV,HO,TEN,NTNS,DC,NNGHIEP) VALUES (4,'Nguyen Tien','Dung','1969/08/04','23/8 Thai Van Lung Q1','Giao Vien')
INSERT INTO HOCVIEN(MAHV,HO,TEN,NTNS,DC,NNGHIEP) VALUES (5,'Mai Thanh','Nam','1976/08/02','12 DBP Q1','Cong Nhan')
INSERT INTO HOCVIEN(MAHV,HO,TEN,NTNS,DC,NNGHIEP) VALUES (6,'Tran Doan','Hung','1968/01/19','189 Tran Van Bo Q4','Giao Vien')
select * from HOCVIEN
create table KHOAHOC
(
	MAKH varchar(5) not null,
	TENKH nvarchar(30) not null,
	BD date ,
	KT date,
	/*tạo kháo chính*/
	constraint pk_KHOAHOC primary key(MAKH),
	/*Tạo khóa ngoai*/
	/*constraint fk_KHOAHOC foreign key(MAKH) references GIAOVIEN(MAGV)
	on update cascade on delete cascade*/
)
INSERT INTO KHOAHOC(MAKH,TENKH,BD,KT) VALUES ('PT197','Tieng phap pho thong khoa 1/97','1997/02/15','1997/05/15')
INSERT INTO KHOAHOC(MAKH,TENKH,BD,KT) VALUES ('PT297','Tieng phap pho thong khoa 2/97','1997/05/30','1997/08/30')
INSERT INTO KHOAHOC(MAKH,TENKH,BD,KT) VALUES ('CT197','Tieng phap chuyen tu khoa 2/97','1997/05/30','1997/08/30')
select * from KHOAHOC
create table BIENLAI
(
	MAKH varchar(30) not null,
	MALH int not null,
	MAHV int not null,
	SOBL int not null,
	DIEM int not null,
	KQUA nvarchar(30) not null,
	XEPLOAI nvarchar(30) not null,
	TIENNOP int not null,
	/*Tạo khóa chính*/
	constraint pk_BIENLAI primary key(SOBL),
	/*Tạo khóa ngoai
	constraint fk_BIENLAI foreign key(SOBL) references GIAOVIEN(MAGV)
	on update cascade on delete cascade*/
)
INSERT INTO BIENLAI(MAKH,MALH,MAHV,SOBL,DIEM,KQUA,XEPLOAI,TIENNOP) VALUES ('PT197',1,1,1,8,'DAU','KHA',100.000)
INSERT INTO BIENLAI(MAKH,MALH,MAHV,SOBL,DIEM,KQUA,XEPLOAI,TIENNOP) VALUES ('PT197',1,2,2,4,'KHONG DAU','YEU',100.000)
INSERT INTO BIENLAI(MAKH,MALH,MAHV,SOBL,DIEM,KQUA,XEPLOAI,TIENNOP) VALUES ('PT197',1,3,3,4,'KHONG DAU','YEU',100.000)
INSERT INTO BIENLAI(MAKH,MALH,MAHV,SOBL,DIEM,KQUA,XEPLOAI,TIENNOP) VALUES ('PT197',1,4,4,3,'KHONG DAU','YEU',100.000)
INSERT INTO BIENLAI(MAKH,MALH,MAHV,SOBL,DIEM,KQUA,XEPLOAI,TIENNOP) VALUES ('PT297',1,5,5,4,'KHONG DAU','YEU',100.000)
INSERT INTO BIENLAI(MAKH,MALH,MAHV,SOBL,DIEM,KQUA,XEPLOAI,TIENNOP) VALUES ('PT297',1,6,6,9,'DAU','GIOI',100.000)
INSERT INTO BIENLAI(MAKH,MALH,MAHV,SOBL,DIEM,KQUA,XEPLOAI,TIENNOP) VALUES ('PT297',1,7,7,6.5,'DAU','TB',100.000)
select * from BIENLAI




--------------------------------------------------------------------------------------------------
select * from LOPHOC
go
select * from GIAOVIEN
go
select * from HOCVIEN
go
select * from KHOAHOC
go
select * from BIENLAI


/*------- câu 1 cho biết (điểm, kết quả , xếp loại) của các học viên do giáo viên “Tran Thanh” hoặc "Ho Nhan"dạy trong khoái có mã số “PT197”---------*/










/* Câu 3 cho biết họ tên, NTNS, địa chỉ của học viên co điểm cao nhất trong kháo có mã số PT297 */

SELECT 


/*-----cÂU 18- CHO BIẾT  CÁC HỌC VIÊN HỌC TẤT CẢ CÁC KHÓA" TIẾNG PHÁP PHỔ THÔNG MỞ VÀO NĂM 1997 */
SELECT MALOP, TENLOP, MAKH FROM LOPHOC WHERE TENLOP = 'PT197'
