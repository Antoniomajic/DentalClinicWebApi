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
	app_status varchar(30), --Scheduled, Pending,Completed,Cancelled,Rescheduled,No show)--
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
	payment_status varchar(20), --Paid, Pending, Failed, Cancelled, Refunded--
	payment_date date
);


--RELATIONS--
alter table Appointment add foreign key (patientID) references Patient(patientID);
alter table Appointment add foreign key (dentistID) references Dentist(dentistID);
alter table Appointment add foreign key (dental_hygienistID) references Dental_Hygienist(dental_hygienistID);
alter table Appointment_Treatment add foreign key (appointmentID) references Appointment(appointmentID);
alter table Appointment_Treatment add foreign key (treatmentID) references Treatment(treatmentID);
alter table Billing add foreign key (appointmentID) references Appointment(appointmentID);


--INSERTS--
insert into Patient (first_name,last_name,date_of_birth,email,phone,patient_address,medical_history)
	values
			('Evan','Hawkins','1990-05-29','evan.hawkins@gmail.com','4278549456','31 St. Andrews Street','None'),
			('Bruno','Newman','1976-11-07','brunoNewman@hotmail.com','7458124560','78 Mollaney Road','Dental implants 2004'),
			('Isabelle','Fox','2005-03-17','isabelle2005fox@gmail.com','0415754851','MilkyWay Street 781b','None');

insert into Dentist(first_name,last_name,email,phone)
	values	
			('Sean','Woods','sean.woods@gmail.com','7841850515'),
			('Keira','Turner','keira.turner@gmail.com','1041185741');

insert into Dental_Hygienist(first_name,last_name,email,phone)
	values
			('Billie','Hall','billiehall857@gmail.com','7418509935'),
			('Jessica','Robinson','jessrob410@gmail.com','9984050041'),
			('Jessica','Robinson','jessrob410@gmail.com','9984050041');

insert into Treatment(treatment_description,cost)
	values
			('Deciduous tooth extraction','20.00'),
			('Tooth extraction','55.00'),
			('Surgical tooth extraction','80.00'),
			('Apicoectomy','110.00'),
			('Cystectomy','80.00'),
			('Sinus lift','450.00'),
			('Artificial bone implantation','600.00');

insert into Appointment(patientID,dentistID,dental_hygienistID,appointment_date,app_status,notes)
	values	
			(1,2,1,'2025-02-15','Completed','Deciduous tooth extracted and sinus lift done successfully'),
			(2,1,2,'2025-02-15','Completed','Artificial bone implanted');

insert into Appointment_Treatment(appointmentID,treatmentID)
	values
			(1,1),
			(1,6),
			(2,7);

insert into Billing(patientID,appointmentID,total_amount,payment_status,payment_date)
	values
			(1,1,'470.00','Paid','2025-02-15'),
			(2,2,'600.00','Pending','2025-02-15');


update Patient set email = 'evan.hawkins@yahoo.com' where patientID = 1;

delete from Dental_Hygienist where dental_hygienistID = 3;

select * from Dental_Hygienist;