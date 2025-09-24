---BTVN BUỔI 3: JOIN TABLE
--Liệt kê tất cả hóa đơn kèm tên khách hàng.

--Liệt kê tất cả hóa đơn kèm tên nhân viên lập hóa đơn.

--Liệt kê tất cả hóa đơn kèm tên khách hàng và tên nhân viên.

--Liệt kê chi tiết hóa đơn: số hóa đơn, ngày hóa đơn, tên sản phẩm và số lượng.

--Liệt kê chi tiết hóa đơn: số hóa đơn, tên khách hàng, tên sản phẩm, số lượng, đơn giá.

--Liệt kê tất cả khách hàng và các hóa đơn của họ (kể cả khách hàng chưa mua gì).

--Liệt kê tất cả sản phẩm và các hóa đơn đã bán ra (kể cả sản phẩm chưa bán).

--Liệt kê khách hàng và số hóa đơn mà họ đã lập (chỉ hiện số hóa đơn, chưa cần đếm).

--Liệt kê danh sách nhân viên cùng các hóa đơn mà họ lập.

--Liệt kê tất cả sản phẩm và thông tin chi tiết (mã hóa đơn, ngày hóa đơn, số lượng) nếu có.



--Liệt kê tất cả hóa đơn kèm tên khách hàng.:

SELECT HOADON.*, KHACHHANG.HOTEN FROM HOADON  JOIN KHACHHANG  ON HOADON.MAKH = KHACHHANG.MAKH

--Liệt kê tất cả hóa đơn kèm tên nhân viên lập hóa đơn.:
SELECT HOADON.* , NHANVIEN.HOTEN FROM HOADON JOIN NHANVIEN ON HOADON.MANV = NHANVIEN.MANV

--Liệt kê tất cả hóa đơn kèm tên khách hàng và tên nhân viên.:
SELECT HOADON.*, KHACHHANG.HOTEN AS 'TEN KHACH',NHANVIEN.HOTEN AS 'TEN NV ' FROM HOADON JOIN KHACHHANG ON HOADON.MAKH = KHACHHANG.MAKH JOIN NHANVIEN ON HOADON.MANV =  NHANVIEN.MANV 

----Liệt kê chi tiết hóa đơn: số hóa đơn, ngày hóa đơn, tên sản phẩm và số lượng.
SELECT HOADON.SOHD, HOADON.NGHD , SANPHAM.TENSP , CTHD.SL FROM HOADON JOIN CTHD ON HOADON.SOHD = CTHD.SOHD JOIN SANPHAM ON CTHD.MASP = SANPHAM.MASP

--Liệt kê chi tiết hóa đơn: số hóa đơn, tên khách hàng, tên sản phẩm, số lượng, đơn giá.
SELECT HOADON.SOHD,KHACHHANG.HOTEN ,SANPHAM.TENSP,CTHD.SL,SANPHAM.GIA FROM HOADON JOIN KHACHHANG ON HOADON.MAKH = KHACHHANG.MAKH JOIN CTHD ON HOADON.SOHD = CTHD.SOHD JOIN SANPHAM ON CTHD.MASP = SANPHAM.MASP

--Liệt kê tất cả khách hàng và các hóa đơn của họ (kể cả khách hàng chưa mua gì).
SELECT KHACHHANG.*, HOADON.* FROM KHACHHANG LEFT JOIN HOADON ON KHACHHANG.MAKH =  HOADON.MAKH

--Liệt kê tất cả sản phẩm và các hóa đơn đã bán ra (kể cả sản phẩm chưa bán).
select SANPHAM.* , HOADON.MAKH,HOADON.MANV,HOADON.NGHD,HOADON.TRIGIA,CTHD.SOHD FROM SANPHAM JOIN CTHD ON SANPHAM.MASP = CTHD.MASP RIGHT JOIN HOADON ON CTHD.SOHD = HOADON.SOHD

--Liệt kê khách hàng và số hóa đơn mà họ đã lập (chỉ hiện số hóa đơn, chưa cần đếm).
SELECT KHACHHANG.* , HOADON.SOHD FROM KHACHHANG RIGHT JOIN HOADON ON KHACHHANG.MAKH = HOADON.MAKH

--Liệt kê danh sách nhân viên cùng các hóa đơn mà họ lập.
select NHANVIEN.* , HOADON.* FROM NHANVIEN LEFT JOIN HOADON ON NHANVIEN.MANV = HOADON.MANV

select distinct NHANVIEN.*, HOADON.* FROM NHANVIEN LEFT JOIN HOADON ON NHANVIEN.MANV =  HOADON.MANV


--Liệt kê tất cả sản phẩm và thông tin chi tiết (mã hóa đơn, ngày hóa đơn, số lượng) nếu có.
SELECT CTHD.SOHD, HOADON.NGHD, CTHD.SL FROM CTHD JOIN HOADON ON CTHD.SOHD = HOADON.SOHD
