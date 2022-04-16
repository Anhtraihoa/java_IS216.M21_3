CREATE TABLE NGUOIQUANLY(
    MaNV varchar2(20) not null,
    Hoten varchar2(50),
    Tuoi int,
    Sdt varchar2(15),
    CMND varchar2(15),
    Quequan varchar2(20),
    Phucap double,
    Luongcoban double,
    Tienluong double
);
ALTER TABLE NGUOIQUANLY 
    ADD CONSTRAINT NQL_PK PRIMARY KEY (MaNV);