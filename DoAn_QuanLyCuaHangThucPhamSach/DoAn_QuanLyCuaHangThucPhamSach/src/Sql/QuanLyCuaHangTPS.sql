
SET time_zone = "+00:00";

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';

CREATE TABLE cthoadon (
  MaHD int NOT NULL,
  MaSP int NOT NULL,
  SoLuong int NOT NULL,
  DonGia int NOT NULL,
  ThanhTien int NOT NULL
) 
CREATE TABLE ctphieunhap(
  MaPN int  NOT NULL, 
  MaSP int NOT NULL,
  SoLuong int NOT NULL,
  DonGia int NOT NULL,
  ThanhTien int NOT NULL
)
CREATE TABLE giamgia (
  MaGiam int NOT NULL,
  TenGiamGia varchar2(50) NOT NULL,
  PhanTramGiam int NOT NULL,
  DieuKien int NOT NULL,
  NgayBD date NOT NULL,
  NgayKT date NOT NULL
) 
CREATE TABLE hoadon (
  MaHD int NOT NULL,
  MaKH int NOT NULL,
  MaNV int NOT NULL,
  NgayLap date NOT NULL,
  TongTien int NOT NULL,
  GhiChu varchar2(50) NOT NULL
)
CREATE TABLE khachhang (
  MaKH int NOT NULL,
  Ho varchar2(255) NOT NULL,
  Ten varchar2(255) NOT NULL,
  GioiTinh varchar2(3) NOT NULL,
  TongChiTieu int DEFAULT 0 NOT NULL ,
  TinhTrang int NOT NULL
)
CREATE TABLE loai(
  MaLoai int NOT NULL,
  TenLoai varchar2(25) NOT NULL
)
CREATE TABLE nhacungcap (
  MaNCC int NOT NULL,
  TenNCC varchar2(255) NOT NULL,
  DiaChi varchar2(255) NOT NULL,
  DienThoai varchar2(25) NOT NULL
)
CREATE TABLE phanquyen (
  Quyen varchar2(255) NOT NULL,
  NhapHang int NOT NULL,
  QLSanPham int NOT NULL,
  QLNhanVien int NOT NULL,
  QLKhachHang int NOT NULL,
  ThongKe int NOT NULL
)
CREATE TABLE nhanvien (
  MaNV int NOT NULL,
  Ho varchar2(255) NOT NULL,
  Ten varchar2(255) ,
  GioiTinh varchar2(3) ,
  ChucVu varchar2(255) NOT NULL
)

CREATE TABLE phieunhap (
  MaPN int NOT NULL,
  MaNCC int NOT NULL,
  MaNV int NOT NULL,
  NgayLap date NOT NULL,
  TongTien int NOT NULL
)
CREATE TABLE sanpham(
  MaSP int NOT NULL,
  TenSP varchar2(255) NOT NULL,
  MaLoai int NOT NULL,
  SoLuong int NOT NULL,
  DonViTinh varchar2(255) NOT NULL,
  HinhAnh varchar2(255) NOT NULL,
  DonGia int NOT NULL
)

CREATE TABLE taikhoan (
  MaNV int NOT NULL,
  TenDangNhap varchar2(255) NOT NULL,
  MatKhau varchar2(255) NOT NULL,
  Quyen varchar2(255) NOT NULL,
  TrangThai int NOT NULL
)
commit
-- Khoa chinh
ALTER TABLE cthoadon ADD CONSTRAINT CTHD_PK PRIMARY KEY (MaHD, MaSP);
ALTER TABLE ctphieunhap ADD CONSTRAINT CTPN_PK PRIMARY KEY (MaPN, MaSP);
ALTER TABLE giamgia ADD CONSTRAINT GG_PK PRIMARY KEY (MaGiam);
ALTER TABLE hoadon ADD CONSTRAINT HD_PK PRIMARY KEY (MaHD);
ALTER TABLE khachhang ADD CONSTRAINT KH_PK PRIMARY KEY (MaKH);
ALTER TABLE loai ADD CONSTRAINT Loai_PK PRIMARY KEY (MaLoai);
ALTER TABLE nhacungcap ADD CONSTRAINT NCC_PK PRIMARY KEY (MaNCC);
ALTER TABLE nhanvien ADD CONSTRAINT NV_PK PRIMARY KEY (MaNV);
ALTER TABLE phanquyen ADD CONSTRAINT PQ_PK PRIMARY KEY (Quyen);
ALTER TABLE phieunhap ADD CONSTRAINT PN_PK PRIMARY KEY (MaPN);
ALTER TABLE sanpham ADD CONSTRAINT SP_PK PRIMARY KEY (MaSP);
ALTER TABLE taikhoan ADD CONSTRAINT TK_PK PRIMARY KEY (MaNV);
-- khoa ngoai
ALTER TABLE cthoadon ADD CONSTRAINT CTHD_FK01 FOREIGN KEY (MaHD) REFERENCES hoadon (MaHD) 
ON DELETE CASCADE ;
ALTER TABLE ctphieunhap ADD CONSTRAINT CTPN_FK01 FOREIGN KEY (MaPN) REFERENCES phieunhap (MaPN) 
ON DELETE CASCADE ;
ALTER TABLE hoadon ADD CONSTRAINT HD_FK01 FOREIGN KEY (MaNV) REFERENCES nhanvien (MaNV)
ON DELETE CASCADE;
ALTER TABLE hoadon ADD CONSTRAINT HD_FK02 FOREIGN KEY (MaKH) REFERENCES khachhang (MaKH)
ON DELETE CASCADE;
ALTER TABLE phieunhap ADD CONSTRAINT PN_FK01 FOREIGN KEY (MaNCC) REFERENCES nhacungcap (MaNCC)
ON DELETE CASCADE;
ALTER TABLE phieunhap ADD CONSTRAINT PN_FK02 FOREIGN KEY (MaNV) REFERENCES nhanvien (MaNV)
ON DELETE CASCADE;
ALTER TABLE sanpham ADD CONSTRAINT SP_FK01 FOREIGN KEY (MaLoai) REFERENCES loai (MaLoai)
ON DELETE CASCADE;
ALTER TABLE taikhoan ADD CONSTRAINT TK_FK01 FOREIGN KEY (Quyen) REFERENCES phanquyen (Quyen)
ON DELETE CASCADE;
ALTER TABLE taikhoan ADD CONSTRAINT TK_FK02 FOREIGN KEY (MaNV) REFERENCES nhanvien(MaNV)
ON DELETE CASCADE;
-- Load data
-- giam gia
INSERT INTO giamgia (MaGiam, TenGiamGia, PhanTramGiam, DieuKien, NgayBD, NgayKT) VALUES (1, 'Khong giam gia', 0, 0, '2022-01-01', '2025-12-31');
INSERT INTO giamgia (MaGiam, TenGiamGia, PhanTramGiam, DieuKien, NgayBD, NgayKT) VALUES (2, 'Giam 20% don hang tu 150000vnd', 20, 150000, '2022-04-22', '2024-05-13');
INSERT INTO giamgia (MaGiam, TenGiamGia, PhanTramGiam, DieuKien, NgayBD, NgayKT) VALUES (4, 'Giam 10% don hang tu 80000vnd', 10, 80000, '2022-03-26', '2022-05-31');
INSERT INTO giamgia (MaGiam, TenGiamGia, PhanTramGiam, DieuKien, NgayBD, NgayKT) VALUES (6, '30/04-01/05 giam 30% don hang tu 300000vnd', 30, 300000, '2022-04-20', '2023-05-08');

-- khachhang
INSERT INTO khachhang (MaKH, Ho, Ten, GioiTinh, TongChiTieu, TinhTrang) VALUES (1, 'Vo Thanh ', 'Tu', 'Nam', 1486400, 1);
INSERT INTO khachhang (MaKH, Ho, Ten, GioiTinh, TongChiTieu, TinhTrang) VALUES (2, 'Pham Ngoc', 'Nguyen', 'Nu', 1497300, 1);
INSERT INTO khachhang (MaKH, Ho, Ten, GioiTinh, TongChiTieu, TinhTrang) VALUES (3, 'Tang Pham Hoang', 'Hiep', 'Nam', 1468800, 1);
INSERT INTO khachhang (MaKH, Ho, Ten, GioiTinh, TongChiTieu, TinhTrang) VALUES (4, 'Hoang Thi', 'Hoa', 'Nu', 1013600, 1);
INSERT INTO khachhang (MaKH, Ho, Ten, GioiTinh, TongChiTieu, TinhTrang) VALUES (7, 'Pham Minh', 'Nhut', 'Nam', 3219700, 1);
INSERT INTO khachhang (MaKH, Ho, Ten, GioiTinh, TongChiTieu, TinhTrang) VALUES (8, 'Tran Trong', 'Tin', 'Nam', 1877000, 1);
INSERT INTO khachhang (MaKH, Ho, Ten, GioiTinh, TongChiTieu, TinhTrang) VALUES (9, 'Nguyen', 'Cong', 'Nu', 5743500, 1);
INSERT INTO khachhang (MaKH, Ho, Ten, GioiTinh, TongChiTieu, TinhTrang) VALUES (10, 'Nguyen Dinh ', 'Phuong', 'Nu', 3136800, 1);
INSERT INTO khachhang (MaKH, Ho, Ten, GioiTinh, TongChiTieu, TinhTrang) VALUES (11, 'Vo Pham Minh', 'Hy', 'Nam', 2260300, 1);

-- loai
INSERT INTO loai (MaLoai, TenLoai) VALUES (1, 'Thit tuoi');
INSERT INTO loai (MaLoai, TenLoai) VALUES (2, 'Rau cu qua');
INSERT INTO loai (MaLoai, TenLoai) VALUES (3, 'Nguyen lieu');

-- nha cung cap
INSERT INTO nhacungcap (MaNCC, TenNCC, DiaChi, DienThoai) VALUES 
(1, 'Cong ty thit VinaFood', '273 An Duong Vuong, phuong 3, quan 5, TPHCM', '0396527908');
INSERT INTO nhacungcap (MaNCC, TenNCC, DiaChi, DienThoai) VALUES 
(2, 'Cong ty rau sach Hai Au', 'Ngai Tu, Tam Binh, Vinh Long', '0902669733');
INSERT INTO nhacungcap (MaNCC, TenNCC, DiaChi, DienThoai) VALUES 
(5, 'Xuong nguyen lieu Halodi', 'Minh Tan, Binh Duong', '0397682193');

-- San pham
INSERT INTO sanpham (MaSP, TenSP, MaLoai, SoLuong, DonViTinh, HinhAnh, DonGia) VALUES 
(111, 'Thit tuoi Bamboo', 1, 31, 'Kg', 'thitbobamboo.png', 123000);
INSERT INTO sanpham (MaSP, TenSP, MaLoai, SoLuong, DonViTinh, HinhAnh, DonGia) VALUES
(112, 'Bap cai trang', 2, 39, 'Cai', 'bapcaitrang.png', 12000);
INSERT INTO sanpham (MaSP, TenSP, MaLoai, SoLuong, DonViTinh, HinhAnh, DonGia) VALUES
(113, 'Thit tuoi', 1, 34, 'Kg', 'thittuoi.jpg', 75000);
INSERT INTO sanpham (MaSP, TenSP, MaLoai, SoLuong, DonViTinh, HinhAnh, DonGia) VALUES
(114, 'Ca roi', 2, 36, 'Cu', 'carot.png', 5000);
INSERT INTO sanpham (MaSP, TenSP, MaLoai, SoLuong, DonViTinh, HinhAnh, DonGia) VALUES
(115, 'Cu cai trang Nam My', 2, 38, 'Cu', 'cucaitrangNamMy.png', 19000);
INSERT INTO sanpham (MaSP, TenSP, MaLoai, SoLuong, DonViTinh, HinhAnh, DonGia) VALUES
(116, 'Thit bo dong lanh', 1, 100, 'Kg', 'thitbodonglanh.jpg', 89000);
INSERT INTO sanpham (MaSP, TenSP, MaLoai, SoLuong, DonViTinh, HinhAnh, DonGia) VALUES
(117, 'Cai thia', 2, 80, 'Ca', 'caithia.jpg', 19000);
INSERT INTO sanpham (MaSP, TenSP, MaLoai, SoLuong, DonViTinh, HinhAnh, DonGia) VALUES
(118, 'Su hao', 2, 52, 'Cu', 'suhao.jpg', 10000);
INSERT INTO sanpham (MaSP, TenSP, MaLoai, SoLuong, DonViTinh, HinhAnh, DonGia) VALUES
(119, 'Bun tuoi sach', 3, 42, 'Kg', 'buntuoisach.jpg', 14000);
INSERT INTO sanpham (MaSP, TenSP, MaLoai, SoLuong, DonViTinh, HinhAnh, DonGia) VALUES
(120, 'Hu tieu sach', 3, 12, 'Kg', 'hutieusach.jpg', 12000);
INSERT INTO sanpham (MaSP, TenSP, MaLoai, SoLuong, DonViTinh, HinhAnh, DonGia) VALUES
(121, 'Thit heo tuoi sach', 1, 42, 'Kg', 'thitheotuoisach.jpg', 85000);
INSERT INTO sanpham (MaSP, TenSP, MaLoai, SoLuong, DonViTinh, HinhAnh, DonGia) VALUES
(122, 'Thit heo ba chi ', 1, 15, 'Kg', 'thitheobachi.jpg', 90000);
INSERT INTO sanpham (MaSP, TenSP, MaLoai, SoLuong, DonViTinh, HinhAnh, DonGia) VALUES
(123, 'Pho tuoi sach', 3, 42, 'Kg', 'photuoisach.jpg', 14000);
INSERT INTO sanpham (MaSP, TenSP, MaLoai, SoLuong, DonViTinh, HinhAnh, DonGia) VALUES
(124, 'Muc ong tuoi', 1, 12, 'Kg', 'mucongtuoi.jpg', 12000);
-- nhân viên
INSERT INTO nhanvien (MaNV, Ho, Ten, GioiTinh, ChucVu) VALUES (0, 'Admin '  , ' ',         ' ',         'Admin');
INSERT INTO nhanvien (MaNV, Ho, Ten, GioiTinh, ChucVu) VALUES (1, 'Vo Thanh ',   'Liem',   'Nam',   'Quan ly');
INSERT INTO nhanvien (MaNV, Ho, Ten, GioiTinh, ChucVu) VALUES (2, 'Minh',             'Vinh',   'Nam',   'Quan ly');
INSERT INTO nhanvien (MaNV, Ho, Ten, GioiTinh, ChucVu) VALUES (3, 'Truong Han', 'Ni',       'Nu',      'Quan ly');
INSERT INTO nhanvien (MaNV, Ho, Ten, GioiTinh, ChucVu) VALUES (4, 'Ha Manh',      'Vinh',   'Nam',   'Nhan vien');
INSERT INTO nhanvien (MaNV, Ho, Ten, GioiTinh, ChucVu) VALUES (12, 'Tran Van',     'Ba',       'Nu',     'Nhan vien');
INSERT INTO nhanvien (MaNV, Ho, Ten, GioiTinh, ChucVu) VALUES (13, 'Nguyen Ngoc', 'Mai',       'Nu',      'Nhan vien');
INSERT INTO nhanvien (MaNV, Ho, Ten, GioiTinh, ChucVu) VALUES (14, 'Ha Van',      'Hung',   'Nam',   'Nhan vien');
INSERT INTO nhanvien (MaNV, Ho, Ten, GioiTinh, ChucVu) VALUES (15, 'Le Thu',     'Thuy',       'Nu',     'Quan ly');
-- phi?u nh?p
INSERT INTO phieunhap (MaPN, MaNCC, MaNV, NgayLap, TongTien) VALUES (4, 2, 0, '2022-04-19', 1027000);
INSERT INTO phieunhap (MaPN, MaNCC, MaNV, NgayLap, TongTien) VALUES (5, 2, 0, '2022-04-23', 268000);
INSERT INTO phieunhap (MaPN, MaNCC, MaNV, NgayLap, TongTien) VALUES (7, 2, 0, '2022-04-26', 90000);
INSERT INTO phieunhap (MaPN, MaNCC, MaNV, NgayLap, TongTien) VALUES (8, 2, 0, '2022-05-02', 1070000);
INSERT INTO phieunhap (MaPN, MaNCC, MaNV, NgayLap, TongTien) VALUES (9, 1, 0, '2022-05-04', 1000000);
INSERT INTO phieunhap (MaPN, MaNCC, MaNV, NgayLap, TongTien) VALUES (10, 5, 0, '2022-05-07', 11360000);

-- phân quyen
INSERT INTO phanquyen VALUES('Default', 0, 0, 0, 0, 0);
INSERT INTO phanquyen VALUES('Nhan vien', 0, 0, 0, 1, 0);
INSERT INTO phanquyen VALUES('Quan ly', 1, 0, 1, 1, 1);
INSERT INTO phanquyen VALUES('Quan tri', 1, 1, 1, 1, 1);

-- tài khoan
INSERT INTO taikhoan VALUES(0, 'admin', 'admin', 'Quan tri', 1);
INSERT INTO taikhoan VALUES(1, 'ql01', 'ql01', 'Quan ly', 1);
INSERT INTO taikhoan VALUES(2, 'ql02', 'ql02', 'Quan ly', 1);
INSERT INTO taikhoan VALUES(3, 'ql03', 'ql03', 'Quan ly', 1);
INSERT INTO taikhoan VALUES(4, 'nv01', 'nv01', 'Nhan vien', 1);

-- chi ti?t phi?u nh?p
INSERT INTO ctphieunhap (MaPN, MaSP, SoLuong, DonGia, ThanhTien) VALUES (4, 128, 100, 10000, 1000000);
INSERT INTO ctphieunhap (MaPN, MaSP, SoLuong, DonGia, ThanhTien) VALUES (4, 129, 3, 9000, 27000);
INSERT INTO ctphieunhap (MaPN, MaSP, SoLuong, DonGia, ThanhTien) VALUES (5, 124, 6, 10000, 60000);
INSERT INTO ctphieunhap (MaPN, MaSP, SoLuong, DonGia, ThanhTien) VALUES (5, 125, 3, 15000, 45000);
INSERT INTO ctphieunhap (MaPN, MaSP, SoLuong, DonGia, ThanhTien) VALUES (5, 126, 7, 10000, 70000);
INSERT INTO ctphieunhap (MaPN, MaSP, SoLuong, DonGia, ThanhTien) VALUES (5, 127, 2, 15000, 30000);
INSERT INTO ctphieunhap (MaPN, MaSP, SoLuong, DonGia, ThanhTien) VALUES (5, 130, 3, 9000, 27000);
INSERT INTO ctphieunhap (MaPN, MaSP, SoLuong, DonGia, ThanhTien) VALUES (5, 131, 9, 4000, 36000);
INSERT INTO ctphieunhap (MaPN, MaSP, SoLuong, DonGia, ThanhTien) VALUES (7, 126, 9, 10000, 90000);


-- hóa ??n

INSERT INTO hoadon (MaHD, MaKH, MaNV, NgayLap, TongTien, GhiChu) VALUES (18, 4, 3, '2021-01-18', 1013600, 'Da thanh toan');
INSERT INTO hoadon (MaHD, MaKH, MaNV, NgayLap, TongTien, GhiChu) VALUES (19, 1, 1, '2021-01-20', 482400, 'Da thanh toan');
INSERT INTO hoadon (MaHD, MaKH, MaNV, NgayLap, TongTien, GhiChu) VALUES (20, 2, 1, '2021-01-28', 840000, 'Da thanh toan');
INSERT INTO hoadon (MaHD, MaKH, MaNV, NgayLap, TongTien, GhiChu) VALUES (21, 3, 2, '2021-02-07', 1045600, 'Da thanh toan');
INSERT INTO hoadon (MaHD, MaKH, MaNV, NgayLap, TongTien, GhiChu) VALUES (22, 1, 1, '2021-02-14', 1004000, 'Da thanh toan');
INSERT INTO hoadon (MaHD, MaKH, MaNV, NgayLap, TongTien, GhiChu) VALUES (23, 7, 3, '2021-02-16', 576800, 'Da thanh toan');
INSERT INTO hoadon (MaHD, MaKH, MaNV, NgayLap, TongTien, GhiChu) VALUES (24, 7, 2, '2021-03-08', 601300, 'Da thanh toan');
INSERT INTO hoadon (MaHD, MaKH, MaNV, NgayLap, TongTien, GhiChu) VALUES (25, 2, 2, '2021-03-09', 391300, 'Da thanh toan');

-- chi ti?t hóa ??n
INSERT INTO cthoadon (MaHD, MaSP, SoLuong, DonGia, ThanhTien) VALUES (18, 114, 2, 159000, 318000);
INSERT INTO cthoadon (MaHD, MaSP, SoLuong, DonGia, ThanhTien) VALUES(18, 122, 3, 249000, 747000);
INSERT INTO cthoadon (MaHD, MaSP, SoLuong, DonGia, ThanhTien) VALUES(18, 124, 6, 19000, 114000);
INSERT INTO cthoadon (MaHD, MaSP, SoLuong, DonGia, ThanhTien) VALUES(18, 130, 2, 19000, 38000);
INSERT INTO cthoadon (MaHD, MaSP, SoLuong, DonGia, ThanhTien) VALUES(18, 132, 2, 25000, 50000);
INSERT INTO cthoadon (MaHD, MaSP, SoLuong, DonGia, ThanhTien) VALUES(19, 115, 2, 119000, 238000);
INSERT INTO cthoadon (MaHD, MaSP, SoLuong, DonGia, ThanhTien) VALUES(19, 120, 1, 239000, 239000);
INSERT INTO cthoadon (MaHD, MaSP, SoLuong, DonGia, ThanhTien) VALUES(19, 128, 4, 19000, 76000);
INSERT INTO cthoadon (MaHD, MaSP, SoLuong, DonGia, ThanhTien) VALUES(19, 131, 5, 10000, 50000);
INSERT INTO cthoadon (MaHD, MaSP, SoLuong, DonGia, ThanhTien) VALUES(20, 118, 1, 129000, 129000);
INSERT INTO cthoadon (MaHD, MaSP, SoLuong, DonGia, ThanhTien) VALUES(20, 120, 2, 239000, 478000);

ALTER TABLE cthoadon
  ADD PRIMARY KEY (MaHD,MaSP),
  ADD KEY `cthoadon_ibfk_1 (MaHD);

-- Trigger
/* 
Trigger: status_user
Thao tác: Insert
Ý ngh?a: Khi t?o m?i m?t tài kho?n (taikhoan), thì tr?ng thái (TrangThai) c?a tài kho?n  ?ó m?c ??nh b?ng 1 (ch?a duy?t).
PL/SQL

*/
CREATE OR REPLACE TRIGGER status_user
BEFORE INSERT  ON taikhoan
FOR EACH ROW
BEGIN
       IF(INSERTING) THEN
:NEW.TrangThai := 1;
END IF;
END;

/*
	Trigger: ngay_hd

	Thao tác: Insert
	Ý ngh?a: Sau khi nhân viên them hóa ??n thì h? th?ng s? t? ??ng c?p nh?t th?i gian
thêm vào ngày l?p hóa ??n (NgayLap).
.

*/
--PL/SQL
/*
CREATE OR REPLACE TRIGGER ngay_hd
BEFORE INSERT OR UPDATE ON HOADON
FOR EACH ROW
BEGIN

IF(INSERTING) THEN
:NEW.NGAYLAP :=SYSDATE;

END IF;
END;*/
---
/*
	Procedure: khachhang_hd_nhieunhat_nam
	Tham s? truy?n vào:n?m
	Tham s? ra: tên, s? l??ng hóa ??n
	Ý ngh?a: Th? t?c này dùng ?? cho bi?t khách hàng có t?ng s? hóa ??n là nhi?u nh?t trong m?t n?m


*/
--PL/SQL
CREATE OR REPLACE PROCEDURE khachhang_hd_nhieunhat_nam (nam number, var_ten OUT varchar2 , tonghd OUT NUMBER)
AS
    var_makh KHACHHANG.MaKH%TYPE;
BEGIN
    SELECT  DISTINCT (K.MaKH),K.Ho||' '||K.Ten, COUNT(H.MAHD) INTO  var_maKH, var_ten, tonghd
    FROM KHACHHANG K JOIN HOADON H ON K.MAKH=H.MAKH
    WHERE EXTRACT(YEAR FROM H.NgayLap)=nam
    GROUP BY K.MaKH,K.Ho,K.Ten
    HAVING COUNT(H.MAHD)>=ALL(SELECT COUNT(HD.MAHD)
                         FROM KHACHHANG KH JOIN HOADON HD ON KH.MAKH=HD.MAKH
    WHERE EXTRACT(YEAR FROM HD.NgayLap)=nam
                         GROUP BY KH.HO,KH.TEN, KH.MAKH);
  
EXCEPTION
     WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('LOI: KHONG CO DU LIEU!');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('LOI: KHONG XAC DINH');
END;

-- G?i th? t?c

set serveroutput on;
DECLARE
    ten  varchar2(255);
    tonghd NUMBER;
BEGIN
    khachhang_hd_nhieunhat_nam('2021',ten,tonghd);
    DBMS_OUTPUT.PUT_LINE('Khach hang co so hoa don nhieu nhat: '||ten);
    DBMS_OUTPUT.PUT_LINE('Tong so hoa don: '||tonghd);

END;

/*

	Function: Get_MaHD
	Tham s? truy?n ra: mahd
	Ý ngh?a: T? ??ng c?p nh?t m?i mã b?ng cách thêm s? mã sau nh?t vào và t? ??ng t?ng lên 1


*/
--PL/SQL
create or replace FUNCTION Get_MaHD (x Number)
RETURN NUMBER
AS
mahd NUMBER;
BEGIN
              mahd := x+1;
return mahd;
END;

--- ma giam gia
create or replace FUNCTION Get_MaGiam (x Number)
RETURN NUMBER
AS
magiam NUMBER;
BEGIN
              magiam := x+1;
return magiam;
END;

-- khach hang
create or replace FUNCTION Get_MaKH (x Number)
RETURN NUMBER
AS
makh NUMBER;
BEGIN
              makh := x+1;
return makh;
END;



