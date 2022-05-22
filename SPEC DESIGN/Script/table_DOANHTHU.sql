CREATE TABLE DOANHTHU(
    MADOANHTHU varchar2(20) not null,
    NGAYDOANHTHU date,
    DOANHTHU NUMBER(11,2),
    THU NUMBER(11,2),
    CHI NUMBER(11,2),
    NGUOITAO varchar2(20)
);

ALTER TABLE THONGKE
    ADD CONSTRAINT DT_PK PRIMARY KEY (MADOANHTHU);
ALTER TABLE DOANHTHU
    ADD CONSTRAINT DT_FK FOREIGN KEY (NGUOITAO) REFERENCES NGUOIQUANLY (MaNQL);