---BTVN SELECT QUERY:
--Liệt kê toàn bộ thông tin của tất cả khách hàng trong bảng KHACHHANG.
--Hiển thị tên sản phẩm (TENSP) và giá (GIA) của tất cả các sản phẩm trong bảng SANPHAM.
--Lấy ra danh sách họ tên và số điện thoại của các nhân viên trong bảng NHANVIEN.
--Liệt kê tất cả hóa đơn (SOHD, NGHD) có mã khách hàg là KH01.
--Tìm thông tin các khách hàng có DOANHSO > 300000.
--Hiển thị danh sách các sản phẩm có NUOCSX = 'VN' và giá nhỏ hơn 50,000.
--Lấy thông tin hóa đơn trong khoảng thời gian từ 01/01/2022 đến 31/12/2022.
--Hiển thị danh sách các khách hàng có họ tên bắt đầu bằng "Nguyen".
--Tìm tất cả hóa đơn có tổng trị giá (TRIGIA) lớn hơn 1,000,000.
--Liệt kê danh sách các khách hàng sinh năm 2000.
--Lấy danh sách nhân viên có ngày vào làm (NGVL) trong năm 2020.
--Hiển thị danh sách mã khách hàng (MAKH) xuất hiện trong bảng HOADON (dùng DISTINCT để tránh trùng).
--Tìm tất cả sản phẩm có giá nằm trong khoảng từ 20,000 đến 100,000.
--Liệt kê thông tin khách hàng sắp xếp theo DOANHSO giảm dần.
--Tìm các hóa đơn phát hành trong vòng 7 ngày gần nhất (so với ngày hiện tại).


--CÂU 1:Liệt kê toàn bộ thông tin của tất cả khách hàng trong bảng KHACHHANG.
select * from KHACHHANG 
--CÂU 2: Hiển thị tên sản phẩm (TENSP) và giá (GIA) của tất cả các sản phẩm trong bảng SANPHAM.
SELECT TENSP , GIA FROM SANPHAM
--CÂU 3: Lấy ra danh sách họ tên và số điện thoại của các nhân viên trong bảng NHANVIEN.
SELECT HOTEN,SODT FROM NHANVIEN
--CÂU 4:Liệt kê tất cả hóa đơn (SOHD, NGHD) có mã khách hàg là KH01.
SELECT SOHD,NGHD FROM HOADON WHERE MAKH = 'KH01'
--CÂU 5: Tìm thông tin các khách hàng có DOANHSO > 300000.
SELECT * FROM KHACHHANG WHERE DOANHSO > 300000 
--CÂU 6: Hiển thị danh sách các sản phẩm có NUOCSX = 'VN' và giá nhỏ hơn 50,000.
SELECT * FROM SANPHAM WHERE NUOCSX = 'Viet Nam' and GIA < 50000
--CÂU 7: Lấy thông tin hóa đơn trong khoảng thời gian từ 01/01/2022 đến 31/12/2022.
SELECT * FROM HOADON WHERE NGHD BETWEEN '2022-01-01' AND '2022-12-31'
--CÂU 8: Hiển thị danh sách các khách hàng có họ tên bắt đầu bằng "Nguyen".
SELECT * FROM KHACHHANG WHERE HOTEN LIKE 'Nguyen%'
--CÂU 9: Tìm tất cả hóa đơn có tổng trị giá (TRIGIA) lớn hơn 1,000,000.
SELECT * FROM HOADON WHERE TRIGIA > 1000000
--CÂU 10: Liệt kê danh sách các khách hàng sinh năm 2000.
select * FROM KHACHHANG  WHERE YEAR(NGSINH) = 2000
--CÂU 11: Lấy danh sách nhân viên có ngày vào làm (NGVL) trong năm 2020. 
SELECT * FROM NHANVIEN WHERE YEAR(NGVL) = 2020
--CÂU 12: Hiển thị danh sách mã khách hàng (MAKH) xuất hiện trong bảng HOADON (dùng DISTINCT để tránh trùng).
SELECT DISTINCT MAKH FROM HOADON 
--CÂU 13:Tìm tất cả sản phẩm có giá nằm trong khoảng từ 20,000 đến 100,000.
SELECT TENSP FROM SANPHAM WHERE GIA BETWEEN 20000 AND 100000
SELECT * FROM SANPHAM WHERE GIA >=20000 AND GIA <= 100000
--CÂU 14: Liệt kê thông tin khách hàng sắp xếp theo DOANHSO giảm dần.
SELECT * FROM KHACHHANG ORDER BY DOANHSO DESC 
--CÂU 15:Tìm các hóa đơn phát hành trong vòng 7 ngày gần nhất (so với ngày hiện tại).
SELECT * FROM HOADON WHERE NGHD BETWEEN GETDATE() AND (GETDATE() - 7) 
SELECT * FROM HOADON WHERE NGHD BETWEEN GETDATE() AND DATEADD(DAY,-7,GETDATE())


