﻿create database bt222_22cntt1a
use bt222_22cntt1a 
/*Tạo bảng: nêu trình tự tạo bảng
1/ Xác định khóa chính, khóa ngoại trong từng  bảng?
2/ Xác định thứ tự theo 3 mức ưu tiên? 
UT1: PHONGBAN
UT2: NHANVIEN, DEAN
UT3: DIADIEM_PHG, PHANCONG,THANNHAN*/

create table PHONGBAN
(
	MAPHG int not null, TENPHG nvarchar(50) not null, TRPHG int not null,
	NG_NHANCHUC date not null,
	/*Khóa chính*/
	constraint pk_PHONGBAN primary key(MAPHG)
)
INSERT INTO PHONGBAN(TENPHG,MAPHG,TRPHG,NG_NHANCHUC) VALUES ('Nghiên Cứu',5,333445555,'1998/05/10')
INSERT INTO PHONGBAN(TENPHG,MAPHG,TRPHG,NG_NHANCHUC) VALUES ('Điều Hành',4,987987987,'1985/01/01')
INSERT INTO PHONGBAN(TENPHG,MAPHG,TRPHG,NG_NHANCHUC) VALUES ('Quản Lý',1,888665555,'1971/06/19')
select * from PHONGBAN
create table NHANVIEN
(
MANV int not null,
HONV nvarchar(20) not null, TENLOT nvarchar(100) not null,TENNV nvarchar(20) not null,
NGSINH date, DCHI nvarchar(300),PHAI nchar(50),LUONG int not null, 
MA_NQL int not null,PHG int not null,
/*Khóa chính*/
constraint pk_NHANVIEN primary key(MANV),
/*Khóa ngoai*/
constraint fk_NHANVIEN foreign key(PHG) references PHONGBAN(MAPHG)
on update cascade on delete cascade
)
INSERT INTO NHANVIEN(HONV,TENLOT,TENNV,MANV,NGSINH,DCHI,PHAI,LUONG,MA_NQL,PHG) VALUES ('Dinh','Ba','Tien',123456789,'1955/01/09','731 Tran Hung Dao Q1 TPHCM','Nam',30000,333445555,5)
INSERT INTO NHANVIEN(HONV,TENLOT,TENNV,MANV,NGSINH,DCHI,PHAI,LUONG,MA_NQL,PHG) VALUES ('Nguyen','Thanh','Tung',333445555,'1945/12/08','638 Nguyen Văn Cu, Q5,TPHCM','Nam',40000,888665555,5)
INSERT INTO NHANVIEN(HONV,TENLOT,TENNV,MANV,NGSINH,DCHI,PHAI,LUONG,MA_NQL,PHG) VALUES ('Bui','Thuy','Vu',999887777,'1958/07/19','322 Nguyen Thai Hoc,Q1,TPHCM','Nam',25000,987654321,4)
INSERT INTO NHANVIEN(HONV,TENLOT,TENNV,MANV,NGSINH,DCHI,PHAI,LUONG,MA_NQL,PHG) VALUES ('Le','Thi','Nhan',987654321,'1931/06/20','291 Ho Van Hue,QPN,TPHCM','Nu',43000,888665555,4)
INSERT INTO NHANVIEN(HONV,TENLOT,TENNV,MANV,NGSINH,DCHI,PHAI,LUONG,MA_NQL,PHG) VALUES ('Nguyen','Manh','Hung',666884444,'1952/09/15','975 Ba Ria, Vung Tau','Nam',38000,333445555,5)
INSERT INTO NHANVIEN(HONV,TENLOT,TENNV,MANV,NGSINH,DCHI,PHAI,LUONG,MA_NQL,PHG) VALUES ('Tran','Thanh','Tam',453453453,'1962/07/31','543 Mai Thi Luu,Q1,TPHCM','Nam',25000,333445555,5)
INSERT INTO NHANVIEN(HONV,TENLOT,TENNV,MANV,NGSINH,DCHI,PHAI,LUONG,MA_NQL,PHG) VALUES ('Tran','Hong','Quang',987987987,'1959/03/29','980 Le Hong Phong,Q10,TPHCM','Nam',25000,987654321,4)
INSERT INTO NHANVIEN(HONV,TENLOT,TENNV,MANV,NGSINH,DCHI,PHAI,LUONG,MA_NQL,PHG) VALUES ('Vuong','Ngoc','Quyen',888665555,'1927/10/10','450 Trung Vuong, Ha Noi','Nu',55000,444555689,1)
select * from NHANVIEN
create table DEAN
(
MADA int not null,TENDA nvarchar(100) not null,
DDIEM_DA nvarchar(50) not null,PHONG int not null,
/*Khóa chính*/
constraint pk_DEAN primary key(MADA),
/*Khóa ngoai*/
constraint fk_DEAN_PHONGBAN foreign key(PHONG) references PHONGBAN(MAPHG)
on update cascade on delete cascade
)
INSERT INTO DEAN(TENDA,MADA,DDIEM_DA,PHONG) VALUES ('San Pham X',1,'Vung Tau',5)
INSERT INTO DEAN(TENDA,MADA,DDIEM_DA,PHONG) VALUES ('San Pham Y',2,'NHA TRANG',5)
INSERT INTO DEAN(TENDA,MADA,DDIEM_DA,PHONG) VALUES ('San Pham Z',3,'TP HCM',5)
INSERT INTO DEAN(TENDA,MADA,DDIEM_DA,PHONG) VALUES ('Tin hoc hoa',10,'HA NOI',4)
INSERT INTO DEAN(TENDA,MADA,DDIEM_DA,PHONG) VALUES ('Cap Quang',20,'TP HCM',1)
INSERT INTO DEAN(TENDA,MADA,DDIEM_DA,PHONG) VALUES ('Dao tao',30,'HA NOi',4)
select * from DEAN
create table DIADIEM_PHG
(
MAPHG int not null,
DIADIEM nvarchar(50) not null,
/*Khóa chính*/
constraint pk_DIADIEM_PHG primary key(MAPHG,DIADIEM),
/*Khóa ngoai*/
constraint fk_DIADIEM_PHONGBAN foreign key(MAPHG) references PHONGBAN(MAPHG)
on update cascade on delete cascade
)
INSERT INTO DIADIEM_PHG(MAPHG,DIADIEM) VALUES (1,'TP HCM')
INSERT INTO DIADIEM_PHG(MAPHG,DIADIEM) VALUES (4,'HA NOI')
INSERT INTO DIADIEM_PHG(MAPHG,DIADIEM) VALUES (5,'VUNG TAU')
INSERT INTO DIADIEM_PHG(MAPHG,DIADIEM) VALUES (5,'NHA TRANG')
INSERT INTO DIADIEM_PHG(MAPHG,DIADIEM) VALUES (5,'TP HCM')
select * from DIADIEM_PHG
create table THANNHAN
(
MA_NVIEN int not null,
TENTN nvarchar(100) not null,
PHAI nchar(50), NGSINH date, QUANHE nvarchar(100),
/*Khóa chính*/
constraint pk_THANNHAN primary key(MA_NVIEN,TENTN),
/*Khóa ngoai*/
constraint fk_THANNHAN_NHANVIEN foreign key(MA_NVIEN) references NHANVIEN(MANV)
on update cascade on delete cascade
)
INSERT INTO THANNHAN(MA_NVIEN,TENTN,PHAI,NGSINH,QUANHE) VALUES (333445555,'Quang','Nu','1976/04/05','Con gai')
INSERT INTO THANNHAN(MA_NVIEN,TENTN,PHAI,NGSINH,QUANHE) VALUES (333445555,'Khang','Nam','1973/10/25','Con Trai')
INSERT INTO THANNHAN(MA_NVIEN,TENTN,PHAI,NGSINH,QUANHE) VALUES (333445555,'Duong','Nu','1948/05/03','Vo Chong')
INSERT INTO THANNHAN(MA_NVIEN,TENTN,PHAI,NGSINH,QUANHE) VALUES (987654321,'Dang','Nam','1932/02/29','Vo Chong')
INSERT INTO THANNHAN(MA_NVIEN,TENTN,PHAI,NGSINH,QUANHE) VALUES (123456789,'Duy','Nam','1978/01/01','Con Trai')
INSERT INTO THANNHAN(MA_NVIEN,TENTN,PHAI,NGSINH,QUANHE) VALUES (123456789,'Chau','Nu','1978/12/31','Con gai')
INSERT INTO THANNHAN(MA_NVIEN,TENTN,PHAI,NGSINH,QUANHE) VALUES (123456789,'Phuong','Nu','1957/05/05','Vo Chong')
select * from THANNHAN
create table PHANCONG
(
MA_NVIEN int not null,
SODA int not null,
THOIGIAN numeric(3,1) not null,
/*Khóa chính*/
constraint pk_PHANCONG primary key(MA_NVIEN,SODA),
/*Khóa ngoai*/
constraint fk_PHANCONG_DEAN foreign key(SODA) references DEAN(MADA)
on update cascade on delete cascade
)
INSERT INTO PHANCONG(MA_NVIEN,SODA,THOIGIAN) VALUES (123456789,2,7.5)
INSERT INTO PHANCONG(MA_NVIEN,SODA,THOIGIAN) VALUES (123456789,20,10.0)
INSERT INTO PHANCONG(MA_NVIEN,SODA,THOIGIAN) VALUES (333445555,5,7.5)
INSERT INTO PHANCONG(MA_NVIEN,SODA,THOIGIAN) VALUES (333445555,2,6.0)
INSERT INTO PHANCONG(MA_NVIEN,SODA,THOIGIAN) VALUES (333445555,7,9.0)
INSERT INTO PHANCONG(MA_NVIEN,SODA,THOIGIAN) VALUES (333445555,8,9.0)
INSERT INTO PHANCONG(MA_NVIEN,SODA,THOIGIAN) VALUES (333445555,10,6.0)
INSERT INTO PHANCONG(MA_NVIEN,SODA,THOIGIAN) VALUES (333445555,15,3.0)
INSERT INTO PHANCONG(MA_NVIEN,SODA,THOIGIAN) VALUES (123456789,3,10.7)
INSERT INTO PHANCONG(MA_NVIEN,SODA,THOIGIAN) VALUES (666884444,3,40.0)
INSERT INTO PHANCONG(MA_NVIEN,SODA,THOIGIAN) VALUES (453353453,10,10.0)
INSERT INTO PHANCONG(MA_NVIEN,SODA,THOIGIAN) VALUES (453353453,20,10.0)
select * from PHANCONG
---------------------------------------------------
select * from PHONGBAN
go
select * from NHANVIEN
go
select * from DEAN
go
select * from DIADIEM_PHG
go
select * from THANNHAN
go
select * from PHANCONG
------------------------------------------------
---- câu 1: Tìm tên và địa chỉ của các nhân viên của phòng "Nghiên cứu".
select TENNV,DCHI from NHANVIEN
where PHG in(select MAPHG from PHONGBAN where TENPHG ='Nghien cuu')

---C2: Với mỗi đề án ở Hà Nội, cho biết tên đề án, tên phòng ban, họ tên và
-- ngày nhận chức của trưởng phòng của phòng ban chủ trì đề án đó.
--- TÌM MÃ 
select TRPHG FROM PHONGBAN ,DIADIEM_PHG
WHERE DIADIEM_PHG.MAPHG = PHONGBAN.MAPHG AND DIADIEM = 'HA NOI'

SELECT HONV, TENNV FROM NHANVIEN ,PHONGBAN
WHERE NHANVIEN.MANV = PHONGBAN.TRPHG AND  PHONGBAN.TRPHG IN(select TRPHG FROM PHONGBAN ,DIADIEM_PHG
WHERE DIADIEM_PHG.MAPHG = PHONGBAN.MAPHG AND DIADIEM = 'HA NOI')
 
-- nối bảng ---
select da.MADA, da.PHONG,nv.HONV, nv.TENNV, nv.NGSINH, nv.DCHI from NHANVIEN AS nv,DEAN as da, PHONGBAN as pb
where da.PHONG = pb.MAPHG and pb.TRPHG = nv.MANV and MANV in( select TRPHG from PHONGBAN where MAPHG in (select PHONG from DEAN where DDIEM_DA = 'HA NOI'))

--câu 3--- TÌM TÊN NV , HONV 
--B1-- TÌM MÃ ĐỀ ÁN CỦA PHÒNG 5 CHU TRÌ
select MADA FROM DEAN WHERE PHONG =5
--B2--- THỐNG KÊ SỐ ĐỀ ÁN MÀ PHÒNG 5 CHỦ TRÌ
SELECT COUNT(MADA) FROM DEAN WHERE PHONG=5
---B3-- TÌM MÃ NHÂN VIÊN LÀM VIỆC CHO TẤT CẢ CÁC ĐỀ ÁN ĐÃ TÌM Ở B1
SELECT MA_NVIEN FROM PHANCONG
WHERE SODA IN (SELECT MADA FROM DEAN WHERE PHONG=5)
group by MA_NVIEN having count(MA_NVIEN)=(select count(MADA) from DEAN where PHONG=5)
----b4---
select TENLOT +' '+ TENNV AS 'Tên NV' FROM NHANVIEN
WHERE MANV IN(SELECT MA_NVIEN FROM PHANCONG
WHERE SODA IN (SELECT MADA FROM DEAN WHERE PHONG=5) GROUP BY MA_NVIEN HAVING COUNT(MA_NVIEN)=(SELECT COUNT(MADA) FROM DEAN WHERE PHONG=5))


---CAAU4--- DANH SÁCH MADA CÓ PHAAN CÔNG VỚI HỌ (HONV)=DINH HOẶC DANH SÁCH MADA CÓ TRƯỞNG PHONG CHỦ TRI DEAN VỚI HO (HONV) = DINH

SELECT MADA, MAPHG FROM DEAN, PHONGBAN
WHERE PHONGBAN.MAPHG = DEAN.PHONG AND PHONG IN(SELECT PHG FROM NHANVIEN WHERE HONV='Dinh') or TRPHG in(select MANV from NHANVIEN WHERE HONV='Dinh')

--- danh sách MADA có nhân công với ho (HONV) Dinh
SELECT MADA FROM DEAN
WHERE PHONG IN(SELECT PHG FROM NHANVIEN WHERE HONV='Dinh')
---- DANH SÁCH MADA CÓ TRƯỞNG PHÒNG CHỦ TRÌ DAEN VỚI HỌ (HONV) =DINH
SELECT MAPHG FROM PHONGBAN
WHERE TRPHG IN(SELECT MANV FROM NHANVIEN WHERE HONV='Dinh')
--5 DANH SÁCH NHỮNG NHÂN VIÊN(HONV, TENNV) CO TRÊN 2 THÂN NHÂN --
SELECT * FROM THANNHAN
SELECT HONV, TENNV FROM NHANVIEN, THANNHAN
WHERE NHANVIEN.MANV = THANNHAN.MA_NVIEN GROUP BY HONV, TENNV HAVING COUNT (THANNHAN.MA_NVIEN) > 2
--*6/------------------------------------------------------------------------------------------------

SELECT HONV, TENNV FROM NHANVIEN, THANHNHAN
WHERE NHANVIEN.MANV = THANNHAN.MA_NVIEN GROUP BY HONV, TENNV HAVING COUNT (THANNHAN.MA_NVIEN) < 1
----7--
SELECT TRPHG FROM PHONGBAN
WHERE TRPHG IN( SELECT MA_NVIEN FROM THANNHAN GROUP BY MA_NVIEN HAVING COUNT (MA_NVIEN) = 1 )

---8---
SELECT HONV, TENNV FROM NHANVIEN
WHERE MANV IN (SELECT MA_NVIEN FROM PHANCONG WHERE SODA IN (SELECT MADA FROM DEAN WHERE TENDA = 'San pham X' and  PHONG = 5) and THOIGIAN > 10 )
--10-- DANH SÁCH NHỮNG(HONV,TEN NV) ĐƯỢC "NGUYEN THANH TUNG" PHỤ TRÁCH TRỰC TIẾP
--- B1 TÌM MÃ NV CỦA NGL
---B2 IN RA TÊN NGƯỜI QL
---B3--- SELCT RỒI COPY B1
SELECT MANV FROM NHANVIEN WHERE HONV ='Nguyen' and TENLOT = 'Thanh' and TENNV = 'Tung'
SELECT HONV, TENNV FROM NHANVIEN WHERE MA_NQL IN
												(SELECT MANV FROM NHANVIEN WHERE HONV ='Nguyen' AND TENLOT = 'Thanh' AND TENNV = 'Tung')

	-----CÂU 11 ---
	SELECT DEAN.MADA, DEAN.TENDA, SUM(PHANCONG.THOIGIAN) AS 'Số giờ'
	FROM DEAN, PHANCONG
	WHERE DEAN.MADA = PHANCONG.SODA
	GROUP BY DEAN.MADA, DEAN.TENDA
-------- câu 12---DANH SÁCH NHÂN VIÊN (HONV, TENNV) LÀM VIỆC CHO TẤT CẢ ĐỀ ÁN
	---b1-- TÌM SỐ LƯỢNG MÃ DEAN THAM GIA NHIỀU NHẤT

	select (HONV+' '+TENNV) as HOTEN from NHANVIEN
	where MANV in (select MA_NVIEN from PHANCONG where SODA in ( select MADA from DEAN )
				group by MA_NVIEN
				having count (MA_NVIEN) = (select count (MADA) from DEAN))

-------CÂU 13 DANH SÁCH NHỮNG NHÂN VIÊN (HONV, TENNV) KHÔNG LÀM VIỆC CHO MỘT ĐỀ ÁN NÀO
	select MA_NVIEN from PHANCONG  where SODA not in ( select MADA from DEAN )

----câu14
	select TENPHG,AVG(LUONG) as 'luong trung binh' from PHONGBAN as pb ,NHANVIEN as nv
	where pb.maphg=nv.PHG
	group by TENPHG
-----CÂU 15 LƯƠNG TRUNG BÌNH CỦA TẤT CẢ CÁC NHÂN VIÊN NỮ
SELECT AVG(NHANVIEN.LUONG) AS 'Luong trung binh' FROM NHANVIEN WHERE NHANVIEN.PHAI = 'Nu'
----- câu 16----

	SELECT DISTINCT (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' ' + NHANVIEN.TENNV) AS 'Họ tên nhân viên', NHANVIEN.DCHI
		FROM NHANVIEN, DEAN, DIADIEM_PHG
		WHERE NHANVIEN.PHG = DEAN.PHONG AND
			NHANVIEN.PHG = DIADIEM_PHG.MAPHG AND
			DEAN.DDIEM_DA LIKE '%HCM' AND
			DIADIEM_PHG.DIADIEM NOT LIKE '%HCM'
---câu 17-----
	select HONV , TENNV from NHANVIEN
	where MANV in (select TRPHG from PHONGBAN 
				where TRPHG not in ( select MA_NVIEN from THANNHAN))
----câu 18 ----
	SELECT DISTINCT (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' ' + NHANVIEN.TENNV) AS 'Họ tên nhân viên', NHANVIEN.DCHI FROM NHANVIEN, DEAN, DIADIEM_PHG
	WHERE NHANVIEN.PHG = DEAN.PHONG AND NHANVIEN.PHG = DIADIEM_PHG.MAPHG
								AND DIADIEM_PHG.DIADIEM not like DEAN.DDIEM_DA
---câu 19----
	select nv.HONV , nv.TENNV , nv.LUONG from NHANVIEN as nv 
	where LUONG > (select avg (LUONG) from NHANVIEN where PHG in ( select MAPHG from PHONGBAN where TENPHG = 'Nghiên Cứu'))




	SELECT (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' ' + NHANVIEN.TENNV) AS 'Mức lương TB "Nghiên cứu"' FROM NHANVIEN
	WHERE NHANVIEN.LUONG > (SELECT AVG(NHANVIEN.LUONG)
							FROM NHANVIEN, PHONGBAN
							WHERE NHANVIEN.PHG = PHONGBAN.MAPHG AND PHONGBAN.TENPHG = N' Nghiên Cứu')

/*20*/

select TENPHG , count (*) from NHANVIEN , PHONGBAN
where MAPHG = PHG
group by TENPHG 
Having avg(LUONG) > 30000

/*21*/
  
select nv.HONV , nv.TENNV , da.TENDA from NHANVIEN as NV , DEAN as da
where PHONG = PHG
group by nv.HONV , nv.TENNV , da.TENDA


--câu 22: tìm họ tên trưởng phòng của phòng ban có đông nhân viên nhất
-- CAU22: cách 1: tạo bảng phụ
TAOBANGPHU:	

SELECT PHONGBAN.TENPHG, PHONGBAN.TRPHG, COUNT(NHANVIEN.PHG) AS SL INTO SOLUONG 
FROM NHANVIEN, PHONGBAN
 WHERE NHANVIEN.PHG = PHONGBAN.MAPHG GROUP BY NHANVIEN.PHG, PHONGBAN.TRPHG, PHONGBAN.TENPHG
	
		
	SELECT SOLUONG.TENPHG, NHANVIEN.TENNV
	FROM SOLUONG, NHANVIEN
	WHERE SOLUONG.TRPHG = NHANVIEN.MANV AND SOLUONG.SL = SOME (SELECT MAX(SL) FROM SOLUONG )
	GROUP BY SOLUONG.TENPHG, NHANVIEN.TENNV

-- CÁCH 2: 
-- b1/ đếm số luong nhân viên theo phong
select  count(*) from NHANVIEN group by PHG

--b2/ Tim mã phòng co dong nhan vien nhât
select phg from NHANVIEN group by phg
having count(*) >= all(select  count(*) from NHANVIEN group by PHG)

--b3/tim mã trưởng phong của phong tìm ra ở b2 (ma phong 5)
select TRPHG from PHONGBAN where MAPHG = (select phg from NHANVIEN group by phg
having count(*) >= all(select  count(*) from NHANVIEN group by PHG))

--b4/ tìm ten nhan vien có mã tim ra ơ b3 (cụ thẻ: 333445555)
select TENNV from NHANVIEN where MANV = (select TRPHG from PHONGBAN 
			where MAPHG = (select phg from NHANVIEN group by phg
						having count(*) >= all(select  count(*) from NHANVIEN group by PHG)))
