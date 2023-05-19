create database nguyenvandat_22CNTT1A
use	nguyenvandat_22CNTT1A
/*Thứ tử tao bang
/thu tu tao ban : TBLKHACHHANG , TBLHANGHOA , TBLPHIEUDAT , TBLCHITIETDAT ,*/
/* CÂU 1 */
CREATE TABLE tblKhachhang
(
MaKH int PRIMARY KEY,
Hoten varchar(50),
Diachi varchar(50),
Dienthoai varchar(15)
)
SELECT * FROM tblKhachhang

CREATE TABLE tblHangHoa 
(
Mahang int PRIMARY KEY,
Tenhang varchar(50),
DVT varchar(10)
)
SELECT * FROM tblHangHoa

CREATE TABLE tblPhieudat 
(
Sophieu int PRIMARY KEY,
Ngaylap date,
Nguoilap varchar(50),
MaKH int,
FOREIGN KEY (MaKH) REFERENCES tblKhachhang(MaKH)
)
SELECT * FROM tblPhieudat

CREATE TABLE tblChitietdat
(
Sophieu int,
Mahang int,
Soluong int,
Dongia float,
PRIMARY KEY (Sophieu, Mahang),
FOREIGN KEY (Sophieu) REFERENCES tblPhieudat(Sophieu),
FOREIGN KEY (Mahang) REFERENCES tblHangHoa(Mahang)
)
SELECT * FROM tblChitietdat
/*Ràng buộc giữa bảng tblPhieudat và tblKhachhang */
ALTER TABLE tblPhieudat ADD CONSTRAINT fk_MaKH FOREIGN KEY (MaKH) REFERENCES tblKhachhang(MaKH)

/* Ràng buộc giữa bảng tblChitietdat và tblPhieudat */
ALTER TABLE tblChitietdat ADD CONSTRAINT fk_Sophieu FOREIGN KEY (Sophieu) REFERENCES tblPhieudat(Sophieu)

/* Ràng buộc giữa bảng tblChitietdat và tblHangHoa */
ALTER TABLE tblChitietdat ADD CONSTRAINT fk_Mahang FOREIGN KEY (Mahang) REFERENCES tblHangHoa(Mahang)

--------------------------------------------------------------
INSERT INTO tblKhachhang (MaKH, Hoten, Diachi, Dienthoai)
VALUES
(1, 'Nguyen Van A', 'Ha Noi', '0987654321'),
(2, 'Tran Thi B', 'Hai Phong', '0123456789'),
(3, 'Le Van C', 'Ho Chi Minh', '0969696969');

INSERT INTO tblHangHoa (Mahang, Tenhang, DVT)
VALUES
(1, 'Banh mi', 'cay'),
(2, 'Tra sua', 'ly'),
(3, 'Pizza', 'cai');

INSERT INTO tblPhieudat (Sophieu, Ngaylap, Nguoilap, MaKH)
VALUES
(1, '2018-12-20', 'Nguyen Van A', 1),
(2, '2018-12-21', 'Tran Thi B', 2),
(3, '2018-12-22', 'Le Van C', 3);

INSERT INTO tblChitietdat (Sophieu, Mahang, Soluong, Dongia)
VALUES
(1, 1, 2, 10000),
(1, 2, 1, 25000),
(2, 3, 3, 200000);
-------------------------------
SELECT * FROM tblKhachhang
go
SELECT * FROM tblHangHoa
go
SELECT * FROM tblPhieudat
go
SELECT * FROM tblChitietdat


/* CÂU 2 */
---------------------------------------
 /* Họ tên, địa chỉ), thông tin mặt hàng mà khách đã mua (Tên hàng, số lượng, đơn giá, tổng tiền) vào ngày ’20-12-18’ */

SELECT kh.MaKH, kh.Hoten, kh.Diachi, hh.Tenhang, ctd.Soluong, ctd.Dongia, ctd.Soluong * ctd.Dongia AS Tongtien
FROM tblKhachhang kh
JOIN tblPhieudat pd ON kh.MaKH = pd.MaKH
JOIN tblChitietdat ctd ON pd.Sophieu = ctd.Sophieu
JOIN tblHangHoa hh ON ctd.Mahang = hh.Mahang
WHERE pd.Ngaylap = '2018-12-20'
go
--------------------------
/*Thống kê  số lượng hàng  hóa  được bán  ra  bởi nhân  viên lập phiếu  có tên “Nguyễn Văn A”. */
SELECT hh.Tenhang, SUM(ctd.Soluong) AS TongSoLuong
FROM tblHangHoa hh
JOIN tblChitietdat ctd ON hh.Mahang = ctd.Mahang
JOIN tblPhieudat pd ON ctd.Sophieu = pd.Sophieu
WHERE pd.Nguoilap = 'Nguyen Van A'
GROUP BY hh.Tenhang
go