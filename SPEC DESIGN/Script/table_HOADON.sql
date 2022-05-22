CREATE TABLE HOADON(
    SoHD varchar2(20) not null,
    NgayHD date,
    MaKH varchar2(20),
    MaNV varchar2(20),
    Trigia NUMBER(11,2)
);
ALTER TABLE HOADON
    ADD CONSTRAINT HD_PK PRIMARY KEY (SoHD);
ALTER TABLE HOADON
    ADD CONSTRAINT HD_FK01 FOREIGN KEY (MaKH) REFERENCES KHACHHANG (MaKH);
ALTER TABLE HOADON    
    ADD CONSTRAINT HD_FK02 FOREIGN KEY (MaNV) REFERENCES NHANVIEN (MaNV);