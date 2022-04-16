CREATE TABLE PHIEUKIEMKEHANGHOA(
    Sophieu varchar2(20) not null,
    NgayTK date,
    Soluong int,
    Nguoitaophieu varchar2(20)
);
ALTER TABLE PHIEUKIEMKEHANGHOA
    ADD CONSTRAINT PKKHH_PK PRIMARY KEY (Sophieu);
ALTER TABLE PHIEUKIEMKEHANGHOA
    ADD CONSTRAINT PKKHH_FK FOREIGN KEY (Nguoitaophieu) REFERENCES THUKHO (MaNV);