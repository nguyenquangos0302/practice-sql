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
	masv int,
    hoten nvarchar(255),
    malop nvarchar(255),
    gioitinh boolean,
    ngaysinh nvarchar(255),
    diachi nvarchar(255)
);

create table diemhp(
	masv int,
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
