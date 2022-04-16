CREATE TABLE HANGHOA(
    Mahang varchar2(20) not null,
    Tenhang varchar2(20),
    DVT varchar2(10),
    Tinhtrang varchar2(20),
    NSX date,
    HSD date,
    Mahangnhap varchar2(20),
    Gia float
);
ALTER TABLE HANGHOA
    ADD CONSTRAINT HH_PK PRIMARY KEY (Mahang);
ALTER TABLE HANGHOA
    ADD CONSTRAINT HH_FK FOREIGN KEY (Mahangnhap) REFERENCES CHITIETNHAPHANG (Mahangnhap);