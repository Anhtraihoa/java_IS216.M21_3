CREATE TABLE HANGHOA(
    Mahang varchar2(20) not null,
    TENHANGHOA varchar2(20),
    NSX date,
    HSD date,
    MANHACUNGCAP varchar2(20),
    GIA NUMBER(11,2),
    MALOAIHANGHOA varchar2(25)
);
ALTER TABLE HANGHOA
    ADD CONSTRAINT HH_PK PRIMARY KEY (Mahang);
ALTER TABLE HANGHOA
    ADD CONSTRAINT HH_FK FOREIGN KEY (MANHACUNGCAP) REFERENCES CHITIETNHAPHANG (MANHACUNGCAP);