--Xem thông tin học viên theo mã học viên
CREATE PROCEDURE XemThongTinHocVien
    @IDHocVien nvarchar(50)
AS
BEGIN
	-- Kiểm tra xem IDHocVien có hợp lệ không
    IF NOT EXISTS (SELECT 1 FROM BANG_HOC_VIEN WHERE MAHOCVIEN = @IDHocVien)
    BEGIN
        PRINT 'Hoc vien khong ton tai';
        RETURN;
    END
	--Truy Vấn 
	select * from BANG_HOC_VIEN
	where MAHOCVIEN= @IDHocVien;
END;

EXEC XemThongTinHocVien @IDHocVien = 'HV20';

--Xem thông tin giáo viên theo mã giáo viên
CREATE PROCEDURE XemThongTinGiaoVien
    @IDGiaoVien nvarchar(50)
AS
BEGIN
	-- Kiểm tra xem IDHocVien có hợp lệ không
    IF NOT EXISTS (SELECT 1 FROM BANG_GIAO_VIEN WHERE MAGV = @IDGiaoVien)
    BEGIN
        PRINT 'Giao vien khong ton tai';
        RETURN;
    END
	--Truy Vấn 
	select * from BANG_GIAO_VIEN
	where MAGV= @IDGiaoVien;
END;

EXEC XemThongTinGiaoVien @IDGiaoVien = '10';

--Xem lịch học theo mã học viên
CREATE PROCEDURE XemLichHoc
    @IDHocVien nvarchar(50)
AS
BEGIN
	-- Kiểm tra xem IDHocVien có hợp lệ không
    IF NOT EXISTS (SELECT 1 FROM BANG_HOC_VIEN WHERE MAHOCVIEN = @IDHocVien)
    BEGIN
        PRINT 'Hoc vien khong ton tai';
        RETURN;
    END
	--Truy Vấn 
	select hv.MAHOCVIEN, hv.HOTEN, kh.TENKHOAHOC, TENLOP, TRINHDO, NGAYHOC, tenphong, 
	THOIGIANBATDAU, THOIGIANKETTHUC
	from BANG_HOC_VIEN as hv, DANGKY as dk, BANG_KHOA_HOC as kh, LOPHOC as lh, BANG_LOP_HOC as lop,
	BANG_LICH_HOC as lich, BANG_PHONG_HOC as ph
	where hv.mahocvien = @IDHocVien and hv.MAHOCVIEN = dk.mahocvien and dk.MAKHOAHOC = kh.MAKHOAHOC 
	and kh.MAKHOAHOC = lh.MAKHOAHOC and lh.MALOPHOC = lop.MALOPHOC and lop.MALOPHOC = lich.MALOPHOC 
	and lich.MAPHONGHOC = ph.MAPHONGHOC;
END;

EXEC XemLichHoc @IDHocVien = 'HV01';

--Xem lịch dạy theo mã giáo viên
CREATE PROCEDURE XemLichDay
    @IDGiaoVien nvarchar(50)
AS
BEGIN
	-- Kiểm tra xem IDHocVien có hợp lệ không
    IF NOT EXISTS (SELECT 1 FROM BANG_GIAO_VIEN WHERE MAGV = @IDGiaoVien)
    BEGIN
        PRINT 'Giao vien khong ton tai';
        RETURN;
    END
	--Truy vấn 
	SELECT BGV.MAGV, BGV.HOTEN, BLDH.NGAYDAY, BPH.TENPHONG, BLDH.NOIDUNGGIANGDAY, BLDH.THOIGIANBATDAU, 
	BLDH.THOIGIANKETTHUC
	FROM BANG_GIAO_VIEN AS BGV
	JOIN GIANGDAY AS GD ON BGV.MAGV = GD.MAGV
	JOIN BANG_LOP_HOC AS BLH ON GD.MALOPHOC = BLH.MALOPHOC
	JOIN BANG_LICH_DAY_HOC AS BLDH ON BGV.MAGV = BLDH.MAGV
	JOIN PHONGDAYHOC AS PDH ON BLDH.MALICHDAY = PDH.MALICHDAY
	JOIN BANG_PHONG_HOC AS BPH ON PDH.MAPHONGHOC = BPH.MAPHONGHOC
	WHERE BGV.MAGV = @IDGiaoVien;
END;

EXEC XemLichDay @IDGiaoVien = '01';

--Xem khóa học đã đăng ký theo mã học viên
CREATE PROCEDURE XemKhoaHoc 
    @IDHocVien nvarchar(50)
AS
BEGIN
	-- Kiểm tra xem IDHocVien có hợp lệ không
    IF NOT EXISTS (SELECT 1 FROM BANG_HOC_VIEN WHERE MAHOCVIEN = @IDHocVien)
    BEGIN
        PRINT 'Hoc vien khong ton tai';
        RETURN;
    END
	--Truy Vấn 
	SELECT BHV.HOTEN, BKH.TENKHOAHOC, BKH.HOCPHI, BKH.TRINHDODAUVAO, BKH.TRINHDODAURA, BTL.TENTAILIEU
    FROM BANG_HOC_VIEN AS BHV
    JOIN DANGKY AS DK ON BHV.MAHOCVIEN = DK.MAHOCVIEN
    JOIN BANG_KHOA_HOC AS BKH ON DK.MAKHOAHOC = BKH.MAKHOAHOC
    JOIN TAILIEU AS TL ON BKH.MAKHOAHOC = TL.MAKHOAHOC
    JOIN BANG_TAI_LIEU_HOC_TAP AS BTL ON TL.MATAILIEU = BTL.MATAILIEU
    WHERE  BHV.MAHOCVIEN = @IDHocVien;
END;

EXEC XemKhoaHoc @IDHocVien = 'HV11'

--Xem thông tin học viên theo mã học viên trong bảng học viên

--Tạo login
exec sp_addlogin 'HocVien',   '123456',  'QuanLyDangKy' 
exec sp_addlogin 'GiaoVien',   '123456',  'QuanLyDangKy'
exec sp_addlogin 'QuanTri',   '123456',  'QuanLyDangKy' 
exec sp_addlogin 'QuanLyDaoTao',   '123456',  'QuanLyDangKy' 

--Tạo user
create user HocVienUser for login HocVien;
create user GiaoVienUser for login GiaoVien;
create user QuanLyDaoTaoUser for login QuanLyDaoTao;
create user QuanTriAdmin for login QuanTri;

--Phân quyền quản trị 
alter role db_owner add member QuanTriAdmin;	

--Phân quyền cho QuanLyDaoTao 
grant select, insert, update, delete on BANG_HOC_VIEN to QuanLyDaoTaoUser;
grant select, insert, update, delete on DANGKY to QuanLyDaoTaoUser;
grant select, insert, update, delete on BANG_LICH_HOC to QuanLyDaoTaoUser;
grant select, insert, update, delete on BANG_GIAO_VIEN to QuanLyDaoTaoUser;
grant select, insert, update, delete on GIANGDAY to QuanLyDaoTaoUser;
grant select, insert, update, delete on BANG_CHUYEN_MON to QuanLyDaoTaoUser;
grant select, insert, update, delete on CHUYENMON to QuanLyDaoTaoUser;
grant select, insert, update, delete on BANG_LICH_DAY_HOC to QuanLyDaoTaoUser;
grant select, insert, update, delete on PHONGDAYHOC to QuanLyDaoTaoUser;

--gán quyền cho HocVienUser
grant execute on XemThongTinHocVien to HocVienUser;
grant execute on XemKhoaHoc to HocVienUser;
grant execute on XemLichHoc to HocVienUser
--gán quyền cho GiaoVienUser
grant execute on XemThongTinGiaoVien to GiaoVienUser;
grant execute on XemLichDay to GiaoVienUser;





