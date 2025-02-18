create database Hospital;
go;
use Hospital;
go;
create table Departments
(
    DepartmentID int primary key identity(1,1) not null,
    DepartmentBuilding int not null check(DepartmentBuilding like '[1-5]'),
    DepartmentFinancing money not null check(DepartmentFinancing > 0) default 0,
    DepartmentName nvarchar(100) not null unique check(DepartmentName <> ''),
)
go;
create table Diseases
(
    DiseaseID int primary key identity(1,1) not null,
    DiseaseName nvarchar(100) not null unique check(DiseaseName <> ''),
    DiseaseSeverity int not null check(DiseaseSeverity > 0) default 1,
)
create table Doctors
(
    DoctorID int primary key identity(1,1) not null,
    DoctorName nvarchar(max) not null check(DoctorName <> ''),
    DoctorPhone char(10) not null,
    DoctorSalary money not null check(DoctorSalary >0),
    DoctorSurname nvarchar(max) not null check(DoctorSurname <> ''),
)
go;
create table Examinations
(
    ExaminationID int primary key identity(1,1) not null,
    ExaminationDateOfWeek int not null check(ExaminationDateOfWeek between 1 and 7),
    ExaminationStartTime time not null check(ExaminationStartTime between '08:00:00' and '18:00:00'),
    ExaminationEndTime time not null,
    ExaminationName nvarchar(100) not null check(ExaminationName <> '') unique,
)
go;
insert into Departments(DepartmentBuilding, DepartmentFinancing, DepartmentName)
values(1, 1000000, 'Cardiology'),
(2, 2000000, 'Neurology'),
(3, 3000000, 'Oncology'),
(4, 4000000, 'Pediatrics'),
(5, 5000000, 'Surgery');
go;
insert into Doctors (DoctorName, DoctorPhone, DoctorSalary, DoctorSurname)
values('John', '1234567890', 1000, 'Doe'),
('Jane', '0987654321', 2000, 'Doe'),
('Jack', '1234567890', 3000, 'Smith'),
('Jill', '0987654321', 4000, 'Smith');
go;
insert into Diseases(DiseaseName, DiseaseSeverity)
values('Cancer', 5),
('Heart Attack', 3),
('Broken Leg', 2),
('Migraine', 2),
('Appendicitis', 3),
('Pneumonia', 4),
('Diabetes', 3),
('Asthma', 2);
go;
insert into Examinations(ExaminationDateOfWeek, ExaminationStartTime, ExaminationEndTime, ExaminationName)
values(1, '08:00:00', '12:00:00', 'Blood Test'),
(2, '08:00:00', '12:00:00', 'X-Ray'),
(3, '08:00:00', '12:00:00', 'MRI'),
(4, '08:00:00', '12:00:00', 'CT'),
(5, '08:00:00', '12:00:00', 'Ultrasound'),
(6, '08:00:00', '12:00:00', 'ECG'),
(7, '08:00:00', '12:00:00', 'EEG');
go;

select * from Departments;
select * from Diseases;
select * from Doctors;
select * from Examinations;

drop table Examinations;
drop table Doctors;
drop table Diseases;
drop table Departments;
drop database Hospital;