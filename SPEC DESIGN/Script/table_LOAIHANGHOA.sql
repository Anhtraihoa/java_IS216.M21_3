CREATE TABLE LOAIHANGHOA(
    MALOAIHANGHOA varchar2(25),
    TENLOAIHANGHOA varchar2(25),
    SOLUONGHANG int,
    MAKHUYENMAI varchar2(25)
);
ALTER TABLE LOAIHANGHOA
    ADD CONSTRAINT LHH_PK PRIMARY KEY (MALOAIHANGHOA);
ALTER TABLE LOAIHANGHOA
    ADD CONSTRAINT LHH_FK FOREIGN KEY (MAKHUYENMAI) REFERENCES KHUYENMAI (MAKHUYENMAI);