/* Table: BANG_CHUYEN_MON                                       */
/*==============================================================*/
create table BANG_CHUYEN_MON (
   MACHUYENMON          nvarchar(50)             not null,
   TENCHUYENMON         nvarchar(50)             null,
   constraint PK_BANG_CHUYEN_MON primary key nonclustered (MACHUYENMON)
)
go

/*==============================================================*/
/* Table: BANG_GIAO_VIEN                                        */
/*==============================================================*/
create table BANG_GIAO_VIEN (
   MAGV                 nvarchar(50)             not null,
   HOTEN                nvarchar(50)             null,
   NGAYSINH             datetime             null,
   GIOITINH             nvarchar(10)             null,
   SODIENTHOAI          int                  null,
   EMAIL                nvarchar(50)             null,
   KINHNGHIEMGIANGDAY   int                  null,
   constraint PK_BANG_GIAO_VIEN primary key nonclustered (MAGV)
)
go

/*==============================================================*/
/* Table: BANG_HOC_VIEN                                         */
/*==============================================================*/
create table BANG_HOC_VIEN (
   MAHOCVIEN            nvarchar(50)             not null,
   HOTEN                nvarchar(50)             null,
   NGAYSINH             datetime             null,
   GIOITINH             nvarchar(10)             null,
   SODIENTHOAI          int                  null,
   EMAIL                nvarchar(50)             null,
   DIACHI               nvarchar(50)             null,
   TRINHDOHOCVAN        nvarchar(50)             null,
   MUCTIEUHOCTAP        nvarchar(50)             null,
   constraint PK_BANG_HOC_VIEN primary key nonclustered (MAHOCVIEN)
)
go

/*==============================================================*/
/* Table: BANG_KHOA_HOC                                         */
/*==============================================================*/
create table BANG_KHOA_HOC (
   MAKHOAHOC            nvarchar(50)             not null,
   TENKHOAHOC           nvarchar(50)             null,
   TRINHDODAUVAO         nvarchar(50)             null,
   TRINHDODAURA         nvarchar(50)             null,
   HOCPHI               nvarchar(50)             null,
   MOTA                 nvarchar(200)                 null,
   constraint PK_BANG_KHOA_HOC primary key nonclustered (MAKHOAHOC)
)
go

/*==============================================================*/
/* Table: BANG_LICH_DAY_HOC                                     */
/*==============================================================*/
create table BANG_LICH_DAY_HOC (
   MALICHDAY            nvarchar(50)             not null,
   MAGV                 nvarchar(50)             not null,
   NGAYDAY              datetime             null,
   THOIGIANBATDAU       time             null,
   THOIGIANKETTHUC      time             null,
   NOIDUNGGIANGDAY      nvarchar(200)                 null,
   constraint PK_BANG_LICH_DAY_HOC primary key nonclustered (MALICHDAY)
)
go

/*==============================================================*/
/* Index: LICHHOC_FK                                            */
/*==============================================================*/
create index LICHHOC_FK on BANG_LICH_DAY_HOC (
MAGV ASC
)
go

/*==============================================================*/
/* Table: BANG_LICH_HOC                                         */
/*==============================================================*/
create table BANG_LICH_HOC (
   MALICHHOC            nvarchar(50)             not null,
   MAPHONGHOC           nvarchar(50)             not null,
   MALOPHOC             nvarchar(50)             not null,
   NGAYHOC              datetime             null,
   THOIGIANBATDAU       time             null,
   THOIGIANKETTHUC      time             null,
   constraint PK_BANG_LICH_HOC primary key nonclustered (MALICHHOC)
)
go

/*==============================================================*/
/* Index: HOC_FK                                                */
/*==============================================================*/
create index HOC_FK on BANG_LICH_HOC (
MALOPHOC ASC
)
go

/*==============================================================*/
/* Index: PHONGHOC_FK                                           */
/*==============================================================*/
create index PHONGHOC_FK on BANG_LICH_HOC (
MAPHONGHOC ASC
)
go

/*==============================================================*/
/* Table: BANG_LOP_HOC                                          */
/*==============================================================*/
create table BANG_LOP_HOC (
   MALOPHOC             nvarchar(50)             not null,
   TENLOP               nvarchar(50)             null,
   TRINHDO              nvarchar(50)             null,
   SOLUONGHOCVIEN       int                  null,
   constraint PK_BANG_LOP_HOC primary key nonclustered (MALOPHOC)
)
go

/*==============================================================*/
/* Table: BANG_PHONG_HOC                                        */
/*==============================================================*/
create table BANG_PHONG_HOC (
   MAPHONGHOC           nvarchar(50)             not null,
   TENPHONG             nvarchar(50)             null,
   DIENTICH             nvarchar(50)             null,
   SOLUONGCHONGOI       int                  null,
   TRANGTHIETBI         nvarchar(200)                 null,
   constraint PK_BANG_PHONG_HOC primary key nonclustered (MAPHONGHOC)
)
go

/*==============================================================*/
/* Table: BANG_TAI_LIEU_HOC_TAP                                 */
/*==============================================================*/
create table BANG_TAI_LIEU_HOC_TAP (
   MATAILIEU            nvarchar(50)             not null,
   TENTAILIEU           nvarchar(50)             null,
   LOAITAILIEU          nvarchar(50)             null,
   constraint PK_BANG_TAI_LIEU_HOC_TAP primary key nonclustered (MATAILIEU)
)
go

/*==============================================================*/
/* Table: CHUYENMON                                             */
/*==============================================================*/
create table CHUYENMON (
   MAGV                 nvarchar(50)             not null,
   MACHUYENMON          nvarchar(50)             not null,
   constraint PK_CHUYENMON primary key (MAGV, MACHUYENMON)
)
go

/*==============================================================*/
/* Index: CHUYENMON_FK                                          */
/*==============================================================*/
create index CHUYENMON_FK on CHUYENMON (
MAGV ASC
)
go

/*==============================================================*/
/* Index: CHUYENMON2_FK                                         */
/*==============================================================*/
create index CHUYENMON2_FK on CHUYENMON (
MACHUYENMON ASC
)
go

/*==============================================================*/
/* Table: DANGKY                                                */
/*==============================================================*/
create table DANGKY (
   MAHOCVIEN            nvarchar(50)             not null,
   MAKHOAHOC            nvarchar(50)             not null,
   constraint PK_DANGKY primary key (MAHOCVIEN, MAKHOAHOC)
)
go

/*==============================================================*/
/* Index: DANGKY_FK                                             */
/*==============================================================*/
create index DANGKY_FK on DANGKY (
MAHOCVIEN ASC
)
go

/*==============================================================*/
/* Index: DANGKY2_FK                                            */
/*==============================================================*/
create index DANGKY2_FK on DANGKY (
MAKHOAHOC ASC
)
go

/*==============================================================*/
/* Table: GIANGDAY                                              */
/*==============================================================*/
create table GIANGDAY (
   MALOPHOC             nvarchar(50)             not null,
   MAGV                 nvarchar(50)             not null,
   constraint PK_GIANGDAY primary key (MALOPHOC, MAGV)
)
go

/*==============================================================*/
/* Index: GIANGDAY_FK                                           */
/*==============================================================*/
create index GIANGDAY_FK on GIANGDAY (
MALOPHOC ASC
)
go

/*==============================================================*/
/* Index: GIANGDAY2_FK                                          */
/*==============================================================*/
create index GIANGDAY2_FK on GIANGDAY (
MAGV ASC
)
go

/*==============================================================*/
/* Table: LOPHOC                                                */
/*==============================================================*/
create table LOPHOC (
   MALOPHOC             nvarchar(50)             not null,
   MAKHOAHOC            nvarchar(50)             not null,
   constraint PK_LOPHOC primary key (MALOPHOC, MAKHOAHOC)
)
go

/*==============================================================*/
/* Index: LOPHOC_FK                                             */
/*==============================================================*/
create index LOPHOC_FK on LOPHOC (
MALOPHOC ASC
)
go

/*==============================================================*/
/* Index: LOPHOC2_FK                                            */
/*==============================================================*/
create index LOPHOC2_FK on LOPHOC (
MAKHOAHOC ASC
)
go

/*==============================================================*/
/* Table: PHONGDAYHOC                                           */
/*==============================================================*/
create table PHONGDAYHOC (
   MALICHDAY            nvarchar(50)             not null,
   MAPHONGHOC           nvarchar(50)             not null,
   constraint PK_PHONGDAYHOC primary key (MALICHDAY, MAPHONGHOC)
)
go

/*==============================================================*/
/* Index: PHONGDAYHOC_FK                                        */
/*==============================================================*/
create index PHONGDAYHOC_FK on PHONGDAYHOC (
MALICHDAY ASC
)
go

/*==============================================================*/
/* Index: PHONGDAYHOC2_FK                                       */
/*==============================================================*/
create index PHONGDAYHOC2_FK on PHONGDAYHOC (
MAPHONGHOC ASC
)
go

/*==============================================================*/
/* Table: TAILIEU                                               */
/*==============================================================*/
create table TAILIEU (
   MATAILIEU            nvarchar(50)             not null,
   MAKHOAHOC            nvarchar(50)             not null,
   constraint PK_TAILIEU primary key (MATAILIEU, MAKHOAHOC)
)
go

/*==============================================================*/
/* Index: TAILIEU_FK                                            */
/*==============================================================*/
create index TAILIEU_FK on TAILIEU (
MATAILIEU ASC
)
go

/*==============================================================*/
/* Index: TAILIEU2_FK                                           */
/*==============================================================*/
create index TAILIEU2_FK on TAILIEU (
MAKHOAHOC ASC
)
go

alter table BANG_LICH_DAY_HOC
   add constraint FK_BANG_LIC_LICHDAYHO_BANG_GIA foreign key (MAGV)
      references BANG_GIAO_VIEN (MAGV)
go

alter table BANG_LICH_HOC
   add constraint FK_BANG_LIC_LICHHOC_BANG_LOP foreign key (MALOPHOC)
      references BANG_LOP_HOC (MALOPHOC)
go

alter table BANG_LICH_HOC
   add constraint FK_BANG_LIC_PHONGHOC_BANG_PHO foreign key (MAPHONGHOC)
      references BANG_PHONG_HOC (MAPHONGHOC)
go

alter table CHUYENMON
   add constraint FK_CHUYENMO_CHUYENMON_BANG_GIA foreign key (MAGV)
      references BANG_GIAO_VIEN (MAGV)
go

alter table CHUYENMON
   add constraint FK_CHUYENMO_CHUYENMON_BANG_CHU foreign key (MACHUYENMON)
      references BANG_CHUYEN_MON (MACHUYENMON)
go

alter table DANGKY
   add constraint FK_DANGKY_DANGKY_BANG_HOC foreign key (MAHOCVIEN)
      references BANG_HOC_VIEN (MAHOCVIEN)
go

alter table DANGKY
   add constraint FK_DANGKY_DANGKY2_BANG_KHO foreign key (MAKHOAHOC)
      references BANG_KHOA_HOC (MAKHOAHOC)
go

alter table GIANGDAY
   add constraint FK_GIANGDAY_GIANGDAY_BANG_LOP foreign key (MALOPHOC)
      references BANG_LOP_HOC (MALOPHOC)
go

alter table GIANGDAY
   add constraint FK_GIANGDAY_GIANGDAY2_BANG_GIA foreign key (MAGV)
      references BANG_GIAO_VIEN (MAGV)
go

alter table LOPHOC
   add constraint FK_LOPHOC_LOPHOC_BANG_LOP foreign key (MALOPHOC)
      references BANG_LOP_HOC (MALOPHOC)
go

alter table LOPHOC
   add constraint FK_LOPHOC_LOPHOC2_BANG_KHO foreign key (MAKHOAHOC)
      references BANG_KHOA_HOC (MAKHOAHOC)
go

alter table PHONGDAYHOC
   add constraint FK_PHONGDAY_PHONGDAYH_BANG_LIC foreign key (MALICHDAY)
      references BANG_LICH_DAY_HOC (MALICHDAY)
go

alter table PHONGDAYHOC
   add constraint FK_PHONGDAY_PHONGDAYH_BANG_PHO foreign key (MAPHONGHOC)
      references BANG_PHONG_HOC (MAPHONGHOC)
go

alter table TAILIEU
   add constraint FK_TAILIEU_TAILIEU_BANG_TAI foreign key (MATAILIEU)
      references BANG_TAI_LIEU_HOC_TAP (MATAILIEU)
go

alter table TAILIEU
   add constraint FK_TAILIEU_TAILIEU2_BANG_KHO foreign key (MAKHOAHOC)
      references BANG_KHOA_HOC (MAKHOAHOC)
go

