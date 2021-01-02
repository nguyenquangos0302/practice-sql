create database quanlysinhvien;
use quanlysinhvien;

create table dmkhoa(
	makhoa nvarchar(255),
    tenkhoa nvarchar(255)
);

create table dmnganh(
	manganh int,
    tennganh nvarchar(255),
    makhoa nvarchar(255)
);

create table dmlop(
	malop nvarchar(255),
    tenlop nvarchar(255),
    manganh int,
    khoahoc int,
    hedt nvarchar(255),
    namnhaphoc nvarchar(255)
);

create table sinhvien(
	masv nvarchar(255),
    hoten nvarchar(255),
    malop nvarchar(255),
    gioitinh boolean,
    ngaysinh nvarchar(255),
    diachi nvarchar(255)
);

create table diemhp(
	masv nvarchar(255),
    mahp int,
    diemhp decimal(10,2)
);

create table dmhocphan(
	mahp int,
    tenhp nvarchar(255),
    sodvht int,
    manganh int,
    hocky int
);

alter table dmkhoa add primary key (makhoa);
alter table dmnganh add primary key (manganh);
alter table dmlop add primary key (malop);
alter table sinhvien add primary key (masv);
alter table diemhp add constraint pk_diemhp primary key (masv, mahp);
alter table dmhocphan add primary key (mahp);

alter table dmnganh add foreign key (makhoa) references dmkhoa(makhoa);
alter table dmlop add foreign key (manganh) references dmnganh (manganh);
alter table sinhvien add foreign key (malop) references dmlop (malop);
alter table diemhp add foreign key (masv) references sinhvien (masv);
alter table diemhp add foreign key (mahp) references dmhocphan (mahp);

insert into dmkhoa values ('CNTT', 'Công nghệ thông tin');
insert into dmkhoa values ('KT', 'Kế Toán');
insert into dmkhoa values ('SP', 'Sư phạm');

insert into dmnganh values (140902, 'Sư phạm toán tin', 'SP');
insert into dmnganh values (480202, 'Tin học ứng dụng', 'CNTT');

insert into dmlop values ('CT11', 'Cao đăng tin học', 480202, 11, 'TC', '2013');
insert into dmlop values ('CT12', 'Cao đăng tin học', 480202, 12, 'CĐ', '2013');
insert into dmlop values ('CT13', 'Cao đăng tin học', 480202, 13, 'CĐ', '214');

insert into sinhvien values ('001', 'Phan Thanh', 'CT12', false, '09/12/1990', 'Tuy Phước');
insert into sinhvien values ('002', 'Nguyễn Thị Cẩm', 'CT12', true, '01/12/1994', 'Quy Nhơn');
insert into sinhvien values ('003', 'Võ Thị Hà', 'CT12', true, '07/02/1995', 'An Nhơn');
insert into sinhvien values ('004', 'Trần Hoài Nam', 'CT12', false, '04/05/1994', 'Tây Sơn');
insert into sinhvien values ('005', 'Trần Văn Hoàng', 'CT13', false, '08/04/1995', 'Vĩnh Thạnh');
insert into sinhvien values ('006', 'Đặng Thị Thảo', 'CT13', true, '06/12/1995', 'Quy Nhơn');
insert into sinhvien values ('007', 'Lê Thị Sen', 'CT13', true, '08/12/1994', 'Phú Cát');
insert into sinhvien values ('008', 'Nguyễn Văn Huy', 'CT11', false, '06/04/1995', 'Phú mỹ');
insert into sinhvien values ('009', 'Trần Thị Hoa', 'CT11', true, '08/09/1994', 'Hoài Nhơn');

insert into dmhocphan values ('001', 'Toán cao cấp A1', 4, 480202, 1);
insert into dmhocphan values ('002', 'Tiếng Anh 1', 3, 480202, 1);
insert into dmhocphan values ('003', 'Vật lý đại cương', 4, 480202, 1);
insert into dmhocphan values ('004', 'Tiéng anh 2', 7, 480202, 1);
insert into dmhocphan values ('005', 'Tiếng anh 1', 3, 140909, 2);
insert into dmhocphan values ('006', 'Xác suất thống kê', 3, 140902, 2);

insert into diemhp values ('002', '002', 5.9);
insert into diemhp values ('002', '003', 4.5);
insert into diemhp values ('003', '001', 4.3);
insert into diemhp values ('003', '002', 6.7);
insert into diemhp values ('003', '003', 7.3);
insert into diemhp values ('004', '001', 4.0);
insert into diemhp values ('004', '002', 5.2);
insert into diemhp values ('004', '003', 3.5);
insert into diemhp values ('005', '001', 9.8);
insert into diemhp values ('005', '002', 7.9);
insert into diemhp values ('005', '003', 7.5);
insert into diemhp values ('006', '001', 6.1);
insert into diemhp values ('006', '002', 5.6);
insert into diemhp values ('006', '003', 4.0);
insert into diemhp values ('007', '001', 6.2);