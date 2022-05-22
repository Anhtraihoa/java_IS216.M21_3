
CREATE TABLE KHACHHANGTHANTHIET(
    MaKH varchar2(20) not null,
    TenKH varchar2(50),
    CMND varchar2(15),
    Diachi varchar2(20),
    Sdt varchar2(15),
    DIEMTICHLUY int
);
ALTER TABLE KHACHHANGTHANTHIET
    ADD CONSTRAINT KH_PK PRIMARY KEY (MaKH);
