CREATE TABLE NHANVIEN( 
    MANV varchar2(20) not null,
    TENNV varchar2(50),
    SDT int,
    CMND varchar2(15),
    PHUCAP NUMBER(11,2),
    LUONGCOBAN NUMBER(11,2), 
    TIENLUONG NUMBER(11,2),
    MATKHAU varchar2(25)
);

ALTER TABLE NHANVIEN 
    ADD CONSTRAINT NV_PK PRIMARY KEY (MaNV);
ALTER TABLE NHANVIEN
    ADD CONSTRAINT NV_FK01 FOREIGN KEY (MATKHAU) REFERENCES DANGNHAP (MATKHAU);