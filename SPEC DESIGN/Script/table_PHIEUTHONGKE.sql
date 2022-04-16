CREATE TABLE PHIEUTHONGKE(
    Sophieu varchar2(20) not null,
    NgayTK date,
    Doanhthu float,
    Thu float,
    Chi float,
    Nguoitaophieu varchar2(20)
);
ALTER TABLE PHIEUTHONGKE
    ADD CONSTRAINT PTK_PK PRIMARY KEY (Sophieu);
ALTER TABLE PHIEUTHONGKE
    ADD CONSTRAINT PTK_FK FOREIGN KEY (Nguoitaophieu) REFERENCES NGUOIQUANLY (MaNV);