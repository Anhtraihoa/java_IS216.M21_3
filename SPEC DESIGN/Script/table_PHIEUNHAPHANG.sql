CREATE TABLE PHIEUNHAPHANG(
    Sophieu varchar2(20) not null,
    Ngaytao date,
    Soluong int,
    Nhacungcap varchar2(20),
    Nguoitaophieu varchar2(20)
);
ALTER TABLE PHIEUNHAPHANG
    ADD CONSTRAINT PNH_PK PRIMARY KEY (Sophieu);
ALTER TABLE PHIEUNHAPHANG
    ADD CONSTRAINT PNH_FK FOREIGN KEY (Nguoitaophieu) REFERENCES THUKHO (MaNV);