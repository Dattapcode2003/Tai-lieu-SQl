create database nguyenvandat_22cntt1a
use nguyenvandat_22cntt1a
create table tblKhachhang
(  
   MAKH int not null, Hoten nvarchar(100) not null, DiaChi int not null, DienThoai int not null,
   constraint pk_tblKhachhang primary key(MAKH)
)
alter table tblKhachhang
add CONSTRAINT fk_tblKhachhang_tblPhieudat
foreign key (MAKH)
references tblPhieudat(MAKH);
ALTER TABLE tblKhachhang
ALTER COLUMN diachi nvarchar(100) not null;
INSERT INTO tblKhachhang values (001,'nguyễn vô tư','12 nguyễn chí thanh',093422562)
INSERT INTO tblKhachhang values (002,'trần đăng thiên','85 lý tự trọng', 081242151)
INSERT INTO tblKhachhang values (003,'phạm bất lực','12 nguyễn hoàng',076521255)
select *from tblKhachhang
create table tblHangHoa
( 
   MaHang int not null, tenhang nvarchar(50) not null, DVT nvarchar(50)
   constraint pk_tblHangHoa primary key(mahang)
)
INSERT INTO tblHangHoa values(123,'ngũ cốc','vnđ')
INSERT INTO tblHangHoa values(145,'đồ chơi','vnđ')
INSERT INTO tblHangHoa values(167,'áo quần','vnđ')
select *from tblHangHoa
create table tblPhieudat
( 
   sophieu int not null, ngaylap date not null, nguoilap nvarchar(100) not null, MAKH int not null
   constraint pk_tblPhieudat primary key(sophieu)
)
alter table tblPhieudat
add CONSTRAINT fk_tblPhieudat_tblKhachhang
foreign key (MAKH)
references tblKhachhang(MAKH);
alter table tblPhieudat
add CONSTRAINT fk_tblPhieudat_tblChitietdat
foreign key (sophieu)
references tblChitietdat(sophieu);
INSERT INTO tblPhieudat values(001,'2016/08/14','thi',001)
INSERT INTO tblPhieudat values(002,'2020/05/21','trân',002)
INSERT INTO tblPhieudat values(003,'2022/04/20','my',003)
select *from tblPhieudat
create table tblChitietdat
(
   sophieu int not null, mahang int not null,soluong int not null, dongia int not null
   constraint pk_tblChitietdat primary key(sophieu)
)
alter table tblChitietdat
add CONSTRAINT fk_tblChitietdat_tblHangHoa
foreign key (mahang)
references tblHangHoa(mahang);
INSERT INTO tblChitietdat values(001,123,45,1250000)
INSERT INTO tblChitietdat values(002,145,72,1600000)
INSERT INTO tblChitietdat values(003,167,35,1900000)
select *from tblChitietdat
SELECT kh.MaKH, kh.Hoten, kh.Diachi, hh.Tenhang, ctd.Soluong, ctd.Dongia, ctd.Soluong * ctd.Dongia AS Tongtien
FROM tblKhachhang kh
JOIN tblPhieudat pd ON kh.MaKH = pd.MaKH
JOIN tblChitietdat ctd ON pd.Sophieu = ctd.Sophieu
JOIN tblHangHoa hh ON ctd.Mahang = hh.Mahang
WHERE pd.Ngaylap = '2022/04/20'
go
SELECT hh.Tenhang, SUM(ctd.Soluong) AS TongSoLuong
FROM tblHangHoa hh
JOIN tblChitietdat ctd ON hh.Mahang = ctd.Mahang
JOIN tblPhieudat pd ON ctd.Sophieu = pd.Sophieu
WHERE pd.Nguoilap = 'thi'
GROUP BY hh.Tenhang
go
select *from tblChitietdat
go
select *from tblHangHoa
go
select *from tblKhachhang
go
select *from tblPhieudat
go