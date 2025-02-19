use master;
drop database if exists DentalClinicDB;
go
create database DentalClinicDB;
go
use DentalClinicDB;

create table Patient(
	patientID int not null primary key identity(1,1),
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	date_of_birth date not null,
	email varchar(100),
	phone varchar(100),
	patient_address varchar(200),
	medical_history varchar(200)
);

create table Dentist(
	dentistID int not null primary key identity(1,1),
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	email varchar(100),
	phone varchar(100)
);


create table Dental_Hygienist(
	dental_hygienistID int not null primary key identity(1,1),
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	email varchar(100),
	phone varchar(100)
);

create table Treatment(
	treatmentID int not null primary key identity(1,1),
	treatment_description varchar (200),
	cost decimal(18,2)
);


create table Appointment(
	appointmentID int not null primary key identity(1,1),
	patientID int,
	dentistID int,
	dental_hygienistID int,
	appointment_date datetime,
	app_status varchar(30),
	notes varchar(200)
);

create table Appointment_Treatment(
	appointment_treatmentID int not null primary key identity(1,1),
	appointmentID int,
	treatmentID int
);

create table Billing(
	billingID int not null primary key identity(1,1),
	patientID int,
	appointmentID int,
	total_amount decimal(18,2),
	payment_status varchar(20),
	payment_date date
);


--RELATIONS--
alter table Appointment add foreign key (patientID) references Patient(patientID);
alter table Appointment add foreign key (dentistID) references Dentist(dentistID);
alter table Appointment add foreign key (dental_hygienistID) references Dental_Hygienist(dental_hygienistID);
alter table Appointment_Treatment add foreign key (appointmentID) references Appointment(appointmentID);
alter table Appointment_Treatment add foreign key (treatmentID) references Treatment(treatmentID);
alter table Billing add foreign key (appointmentID) references Appointment(appointmentID);