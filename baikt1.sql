create database btkt1_22cntt1a
use	btkt1_22cntt1a
/*Thứ tử tao bang
/thu tu tao ban : SVIEN , MHOC , KHOC , DKIEN , KQUA*/
create table SVIEN 
(
	MASV int not null,
	TEN nvarchar(50) not null,
	NAM int,
	KHOA char(4), 
	constraint pk_SVIEN primary key (MASV) 
) 
/*thêm ràng buộc năm 1,2,3*/
alter table SVIEN 
add constraint ck_nam check (NAM between 1 and 3)
/* Truyền dữ liệu vào column */

insert into SVIEN (MASV , TEN , NAM , KHOA)
values (17, N'Sơn',1,'CNTT'),
(8, N'Bảo',2,'CNTT')
/* xóa 1 dòng insert into */
delete from SVIEN where MASV='8' or MASV= '17'
select*from SVIEN
create table MHOC
(
	MAMH char(8) not null,
	TEN_MH nvarchar(50) not null,
	TINCHI int,
	KHOA char(4),
	/*tao khoa chinh*/
	constraint pk_MHOC primary key(MAMH)
)
/* Truyền dữ liệu vào table MHOC */
insert into MHOC (MAMH , TEN_MH , TINCHI , KHOA)
values ('COSC1310', N'Nhập môn tin học',4,'CNTT'), 
('COSC3320', N'Cấu trúc dữ liệu',4,'CNTT'),
('MATH2410', N'Toán rời rạc',3,'CNTT'),
('COSC3380', N'Cơ sở dữ liệu',3,'CNTT')
delete from MHOC WHERE MAMH='COSC1310'
select*from MHOC
create table KHOC
(
	MAKH int not null,
	MAMH char(8) not null,
	HOCKY int,
	NAM int,
	GV nvarchar (50),
	/*tao khoa chinh*/
	constraint pk_KHOC primary key(MAKH),
	/*tao khoa ngoai*/
	constraint fk_KHOC_MHOC foreign key(MAMH) references MHOC(MAMH) 
	on update cascade on delete cascade 	
)
/* Thêm ràng buộc học kì 1,2 */
alter table KHOC 
add constraint ck_HOCKY check (HOCKY in (1 , 2))
/* Xóa  ràng buộc */
alter table KHOC
drop constraint ck_HOCKY
/* Truyền dữ liệu vào table KHOC */
insert into KHOC (MAKH , MAMH , HOCKY , NAM , GV)
values (85, N'MATH2410',1,86,N'Kim'),
(92, N'COSC1310',1,86,N'An'),
(102, N'COSC3320',2,87,N'Niên'),
(112, N'MATH2410',1,87,N'Chân'),
(119, N'COSC1310',1,87,N'An'),
(135, N'COSC3380',1,87,N'Sơn')
select*from KHOC
create table DKIEN
(
	MAMH char(8) not null,
	MAMH_TRUOC char(8) not null,
	/*tao khoa chinh*/
	constraint pk_DKIEN primary key(MAMH,MAMH_TRUOC),
	/*tao khoa ngoai*/
	constraint fk_DKIEN_MHOC foreign key(MAMH) references MHOC(MAMH)
	on update cascade on delete cascade
)
insert into DKIEN ( MAMH , MAMH_TRUOC )
values ('COSC3380','COSC3320'),
('COSC3380','MATH2410'), 
('COSC3320','COSC1310') 
select*from DKIEN 
create table KQUA
(
	MASV int not null,
	MAKH int not null,
	DIEM int,
	/*tao khoa chinh*/
	constraint pk_KQUA primary key(MASV,MAKH),
	/*tao khoa ngoai*/
	constraint fk_KQUA_SVIEN foreign key(MASV)references SVIEN(MASV),
	constraint fk_KQUA_KHOC foreign key(MAKH)references KHOC(MAKH)
)
alter table KQUA
add constraint ck_DIEM check ( DIEM >=0 and DIEM <=10 )
insert into KQUA ( MASV , MAKH , DIEM )
values ( 17 , 112 , 8 ),
( 17 , 119 , 6 ),
( 8 , 85 , 10 ),
( 8 , 92 , 10),
( 8 , 102 , 8),
( 8 , 135 , 10 )
drop table KQUA
delete from KQUA where MASV='17' 

select*from SVIEN
go
select*from MHOC
go
select*from KHOC
go
select*from DKIEN
go
select*from KQUA
/* câu 6 in ra các tên SVIEN*/
select TEN from SVIEN
go
/* câu 7. In ra tên các môn học  vào số tín chỉ*/
select TEN_MH,TINCHI from MHOC

/* câu 8. Cho biết kế quả môn họcc tập của sinh viên có mã số 8 */
/*Bảng: KQUA
Cột: MASV,
ĐK: MASV=8 */
select MASV,DIEM from KQUA where MASV=8
/* câu 9.cho biết các mã số môn học phải học trước môn có mã số COSC3320 */
select MAMH_TRUOC from DKIEN where MAMH='COSC3320'

/* câu 10.cho biết các mã số môn học phải học sau môn có mã só COSC3320 */
select MAMH from DKIEN where MAMH_TRUOC='COSC1310'

/* câu 11. Cho biết tên sinh viên vào các môn học mà sinh viên đó tham gia với kết quả cuối khoá trên 7 điểm */
select TEN , TEN_MH ,DIEM from SVIEN,KQUA,KHOC,MHOC where (SVIEN.MASV=KQUA.MASV) and (KQUA.MAKH=KHOC.MAKH)and (KHOC.MAMH=MHOC.MAMH)and(DIEM>7)
-- thêm dũ liệu sinh vien Hoàng, 30, nam 2, Khoa Toán ---
insert into SVIEN(MASV, TEN, NAM, KHOA) values(30, N'Hoàng',2, 'Toán')
--Câu 12. Cho biết tên các sinh viên thuộc vào khoa có phụ trách môn học "Toán rời rạc"--
--B1: tim khoa day môn toán rời rạc
---b2: in tên sinh viên theo khóa ở B1 ---
select Ten, Khoa from SVIEN 
where KHOA in ( select KHOA from MHOC where TEN_MH= N'Toán rời rạc')

----Câu :13. Cho bieát teân caùc moân hoïc phaûi hoïc ngay tröôùc moân "Cô sôû döõ lieäu"---
--B1 tìm mã môn có tên cơ sở dữ liệu >COSC3380
select MAMH from MHOC where TEN_MH = N'Cơ sở dữ liệu'
--B2 tìm mã môn học trước cái mã môn tìm ra ở b1>COSC3320
select MAMH_TRUOC from DKIEN where MAMH in(select MAMH from MHOC where TEN_MH = N'Cơ sở dữ liệu')
--B3 tìm tên môn có mã đã tìm ra ở B2> cấu trúc dữ liệu và toán rời rạc
select TEN_MH from MHOC where MAMH in(select MAMH_TRUOC from DKIEN where MAMH in(select MAMH from MHOC where TEN_MH = N'Cơ sở dữ liệu'))

---Câu 14: Cho biết các câu nhập liền sau môn "cơ sợ dữ liệu"
--B1 
select MAMH from DKIEN where MAMH_TRUOC in( select MAMH from MHOC where TEN_MH= N'Tin Học Văn Phòng')


---Câu 15: Cho biết tên sinh viên và điểm trung bình của sinh viên đó từng học kỳ ---
--Cột: TenSv(SVIEN) Điểm TB(KQUA ) dùng hàm AVG(), HocKY(KHOC) --
--Bảng: SVIEN, KQUA, KHOC--
--Đkiện: Nối Bảng( ) and --
--Nhóm: TenSV, HOCKY --
SELECT TEN, SVIEN.MASV, HOCKY, AVG(KQUA.DIEM) AS TB FROM SVIEN, KQUA, KHOC
WHERE SVIEN.MASV = KQUA.MASV AND KQUA.MAKH = KHOC.MAKH GROUP BY SVIEN.TEN, SVIEN.MASV, KHOC.HOCKY
select * from KQUA
insert into KQUA(MASV, MAKH, DIEM) values(8,119,7)
---Câu 16: Cho biết tên sinh viên đạt điểm cao nhất --
select SV.TEN, KQ.DIEM from SVIEN as SV , KQUA as KQ where SV.MASV = KQ.MASV and DIEM=(select MAX(DIEM) from KQUA)
