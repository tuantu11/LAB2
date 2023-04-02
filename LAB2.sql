----cau1----
select*from QLBanHang.INFORMATION_SCHEMA.COLUMNS
----cau2----
select masp,tensp,tenhang,soluong,mausac,giaban,donvitinh,mota
from tbSANPHAM inner join tbHANGSX on tbSANPHAM.mahangsx = tbHANGSX.mahangsx
order by giaban desc
----cau3----
select masp,tensp,tenhang,soluong,mausac,giaban,donvitinh,mota
from tbSANPHAM inner join tbHANGSX on tbSANPHAM.mahangsx = tbHANGSX.mahangsx
where tenhang = 'samsung'
----cau4----
select*from tbNHANVIEN
where phong = 'ke toan' and gioitinh = N'nu'
----cau5----
select tbNHAP.sohdn,tbSANPHAM.masp,tbSANPHAM.tensp,tenhang,tbNHAP.soluongN,tbNHAP.dongiaN,tbNHAP.soluongN*tbNHAP.dongiaN as tiennhap,tbSANPHAM.mausac,tbSANPHAM.donvitinh,tbNHAP.ngaynhap,tbNHANVIEN.tennv,tbNHANVIEN.phong
from tbNHAP
join tbSANPHAM on tbNHAP.masp = tbSANPHAM.masp
join tbHANGSX on tbSANPHAM.mahangsx= tbHANGSX.mahangsx
join tbNHANVIEN on tbNHAP.manv = tbNHANVIEN.manv
order by tbNHAP.sohdn asc
----cau6-----
select tbXUAT.sohdx,tbSANPHAM.masp,tbSANPHAM.tensp,tbHANGSX.tenhang,tbXUAT.soluongX,tbSANPHAM.giaban,tbXUAT.soluongX*tbSANPHAM.giaban as tienxuat,tbSANPHAM.mausac,tbSANPHAM.donvitinh,tbXUAT.ngayxuat,tbNHANVIEN.tennv,tbNHANVIEN.phong
from tbXUAT
inner join tbSANPHAM on tbXUAT.masp = tbSANPHAM.masp
inner join tbHANGSX on tbSANPHAM.mahangsx= tbHANGSX.mahangsx
inner join tbNHANVIEN on tbXUAT.manv = tbNHANVIEN.manv
where MONTH(tbXUAT.ngayxuat) = 10 and YEAR(tbXUAT.ngayxuat) = 2018
order by tbXUAT.sohdx asc
----cau7----
select sohdn,tbSANPHAM.masp,tensp,soluongN,dongiaN,ngaynhap,tennv,phong
from tbNHAP
join tbSANPHAM on tbNHAP.masp = tbSANPHAM.masp
join tbHANGSX on tbSANPHAM.mahangsx= tbHANGSX.mahangsx
join tbNHANVIEN on tbNHAP.manv = tbNHANVIEN.manv
where tbHANGSX.tenhang = 'samsung' and YEAR(ngaynhap) = 2017
----cau8----
select top 10 tbXUAT.sohdx, tbSANPHAM.tensp, tbXUAT.soluongX
from tbXUAT inner join tbSANPHAM on tbXUAT.masp = tbSANPHAM.masp
where YEAR(tbXUAT.ngayxuat) = '2020'
order by tbXUAT.soluongX desc
----cau9----
select top 10 masp,tensp,soluong,mausac,MAX(giaban),donvitinh,mota
from tbSANPHAM
group by masp,tensp,soluong,mausac,giaban,donvitinh,mota
order by tbSANPHAM.giaban desc
----cau10----
select masp,tensp,soluong,mausac,giaban,donvitinh,mota,tbHANGSX.tenhang 
from tbSANPHAM inner join tbHANGSX on tbSANPHAM.mahangsx = tbHANGSX.mahangsx
where (tbSANPHAM.giaban between 100 and 500) AND tbHANGSX.tenhang = 'samsung'
----cau11----
select tbNHAP.sohdn,tbSANPHAM.masp,tbSANPHAM.tensp,tenhang,tbNHAP.soluongN,tbNHAP.dongiaN,SUM(tbNHAP.soluongN)*SUM(tbNHAP.dongiaN) as tiennhap,tbSANPHAM.mausac,tbSANPHAM.donvitinh,tbNHAP.ngaynhap,tbNHANVIEN.tennv,tbNHANVIEN.phong
from tbNHAP
join tbSANPHAM on tbNHAP.masp = tbSANPHAM.masp
join tbHANGSX on tbSANPHAM.mahangsx= tbHANGSX.mahangsx
join tbNHANVIEN on tbNHAP.manv = tbNHANVIEN.manv
where YEAR(tbNHAP.ngaynhap) = 2018 and tbHANGSX.tenhang = 'samsung'
group by tbNHAP.sohdn,tbSANPHAM.masp,tbSANPHAM.tensp,tenhang,tbNHAP.soluongN,tbNHAP.dongiaN,tbSANPHAM.mausac,tbSANPHAM.donvitinh,tbNHAP.ngaynhap,tbNHANVIEN.tennv,tbNHANVIEN.phong
----cau12----
select tbXUAT.sohdx,tbSANPHAM.masp,tbSANPHAM.tensp,tbHANGSX.tenhang,tbXUAT.soluongX,tbSANPHAM.giaban,
tbSANPHAM.mausac,tbSANPHAM.donvitinh,tbXUAT.ngayxuat,tbNHANVIEN.tennv,tbNHANVIEN.phong,SUM(tbXUAT.soluongX*tbSANPHAM.giaban) as 'tongiendaxuat'
from tbXUAT
inner join tbSANPHAM on tbXUAT.masp = tbSANPHAM.masp
inner join tbHANGSX on tbSANPHAM.mahangsx= tbHANGSX.mahangsx
inner join tbNHANVIEN on tbXUAT.manv = tbNHANVIEN.manv
where tbXUAT.ngayxuat = '2018-02-09'
group by tbXUAT.sohdx,tbSANPHAM.masp,tbSANPHAM.tensp,tbHANGSX.tenhang,tbXUAT.soluongX,tbSANPHAM.giaban,tbSANPHAM.mausac,tbSANPHAM.donvitinh,tbXUAT.ngayxuat,tbNHANVIEN.tennv,tbNHANVIEN.phong
----cau13----

