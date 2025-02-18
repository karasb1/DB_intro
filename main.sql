create database Academy;
go;
use Academy;
go;
create table Teachers (
    Id int primary key identity(1,1) not null,
    EmploymentDate date not null check (EmploymentDate >= '01.01.1990'),
    Name varchar(max) not null check (name != ''),
    Premium money not null check (Premium >= 0) default 0,
    Salary money not null check (salary > 0),
    SurName varchar(max) not null check (SurName != ''),
);
go;
create table Groups (
    Id int primary key identity(1,1) not null,
    Name nvarchar(10) not null check (Name != '') unique,
    Rating int not null check (Rating >= 0 and Rating <=5),
    Year int not null check (Year >= 1 and Year <=5),
);
go;
create table Faculties (
    Id int primary key not null identity(1,1),
    Name nvarchar(100) not null check (Name != '') unique,
);
go;
create table Departments (
    Id int primary key not null identity(1,1),
    Financing money not null check (Financing >= 0) default 0,
    Name nvarchar(100) not null check (Name != '') unique,
);
go;
insert into Teachers (EmploymentDate, Name, Premium, Salary, SurName) values
('01.01.1990', 'Ivan', 1000, 1000, 'Ivanov'),
('01.01.1990', 'Petr', 1000, 1000, 'Petrov'),
('01.01.1990', 'Sidor', 1000, 1000, 'Sidorov');
go;
insert into Groups (Name, Rating, Year) values
('Group1', 5, 1),
('Group2', 4, 2),
('Group3', 3, 3);
go;
insert into Faculties (Name) values
('Faculty1'),
('Faculty2'),
('Faculty3');
go;
insert into Departments (Financing, Name) values
(1000, 'Department1'),
(2000, 'Department2'),
(3000, 'Department3');
go;

select * from Teachers;
select * from Groups;
select * from Faculties;
select * from Departments;

drop table Departments;
drop table Faculties;
drop table Groups;
drop table Teachers;
drop database Academy;