----------tao------------
USE master
CREATE DATABASE QLBanHang
USE QLBanHang
CREATE TABLE tbSANPHAM
( MaSP nchar(10) NOT NULL PRIMARY KEY,
  tenSP nvarchar(20) NULL,
  soluong int NULL,
  mausac nvarchar(20) NULL,
  giaban money NULL,
  donvitinh nchar(10) NULL,
  mota nvarchar(max) NULL,
  mahangsx nchar(10) NULL FOREIGN KEY REFERENCES tbHANGSX (mahangsx),
);
CREATE TABLE tbHANGSX
( mahangsx nchar(10) NOT NULL PRIMARY KEY,
  tenhang nvarchar(20) NULL, 
  diachi nvarchar(30) NULL,
  sodt nvarchar(20) NULL,
  email nvarchar(30) NULL,
);
CREATE TABLE tbNHANVIEN
( manv nchar(10) NOT NULL PRIMARY KEY,
  tennv nvarchar(20)  NULL,
  gioitinh nchar(10) NULL,
  diachi nvarchar(30) NULL,
  sodt nvarchar(20) NULL,
  email nvarchar(30) NULL,
  phong nvarchar(30) NULL,
);
CREATE TABLE tbNHAP
( sohdn nchar(10) NOT NULL,
  masp nchar(10) NOT NULL FOREIGN KEY REFERENCES tbSANPHAM (masp),
  manv nchar(10) NULL FOREIGN KEY REFERENCES tbNHANVIEN (manv),
  ngaynhap date NULL,
  soluongN int NULL,
  dongiaN money NULL,
  CONSTRAINT NHAP_PK PRIMARY KEY (sohdn, masp),
);
CREATE TABLE tbXUAT
( sohdx nchar(10) NOT NULL,
  masp nchar(10) NOT NULL FOREIGN KEY REFERENCES tbSANPHAM (masp),
  manv nchar(10) NULL FOREIGN KEY REFERENCES tbNHANVIEN (manv),
  ngayxuat date NULL,
  soluongX int NULL,
  CONSTRAINT XUAT_PK PRIMARY KEY (sohdx, masp),
);
----------------------------------------------
----------dua ra thong tin vua nhap-----------
select *from QLBanHang.dbo.tbNHANVIEN
select *from QLBanHang.dbo.tbHANGSX
select *from QLBanHang.dbo.tbSANPHAM
select *from QLBanHang.dbo.tbNHAP
select *from QLBanHang.dbo.tbXUAT
---------------------------------
----------nhap du lieu------------
insert into tbHANGSX
values ('H01','Samsung','Korea','011-08271717','ss@gmail.com.kr')
insert into tbHANGSX
values ('H02','OPP0','China','081-08626262','oppo@gmail.com.cn')
insert into tbHANGSX
values ('H03','Vinfone','Viet Nam','084-098262626','vf@gmail.com.vn')
insert into tbNHANVIEN
values ('NV01','Nguyen Thi Thu','nu','Ha Noi','0982626521','thu@gmail.com','ke toan')
insert into tbNHANVIEN
values ('NV02','Le Van Nam','nam','Bac Ninh','0972525252','nam@gmail.com','vat tu')
insert into tbNHANVIEN
values ('NV03','Tran Hoa Binh','nu','Ha Noi','0328388388','hb@gmail.com','ke toan')
insert into tbSANPHAM
values ('SP01','F1 Plus','100','xam','7000000','chiec','hang can cao cap','H02')
insert into tbSANPHAM
values ('SP02','Galaxy Note 11','50','do','19000000','chiec','hang  cao cap','H01')
insert into tbSANPHAM
values ('SP03','F3 Lite','200','nau','3000000','chiec','hang pho thon','H02')
insert into tbSANPHAM
values ('SP04','Vjoy3','200','xam','1500000','chiec','hang pho thong','H03')
insert into tbSANPHAM
values ('SP05','Galaxy V21','500','nau','8000000','chiec','hang can cao cap','H01')
insert into tbNHAP
values ('N01','SP02','NV01','2019-02-05','10','17000000')
insert into tbNHAP
values ('N02','SP01','NV02','2020-04-07','30','6000000')
insert into tbNHAP
values ('N03','SP04','NV02','2020-05-17','20','1200000')
insert into tbNHAP
values ('N04','SP01','NV03','2020-03-22','10','6200000')
insert into tbNHAP
values ('N05','SP05','NV01','2020-07-07','20','7000000')
insert into tbXUAT
values ('X01','SP03','NV02','2020-06-14','5')
insert into tbXUAT
values ('X02','SP01','NV03','2019-03-05','3')
insert into tbXUAT
values ('X03','SP02','NV01','2020-12-12','1')
insert into tbXUAT
values ('X04','SP03','NV02','2020-02-06','2')
insert into tbXUAT
values ('X05','SP05','NV01','2020-05-18','1')
-------------------------------------------------