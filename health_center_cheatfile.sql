CREATE TABLE Doctors (
Doctors_ID smallint(5) NOT NULL AUTO_INCREMENT,
First_Name varchar(30),
Sure_Name varchar(30),
Speciality varchar(30),
Unit_ID smallint(5),
PRIMARY KEY (Doctors_ID)
);

CREATE TABLE Interventions (
Interventions_ID smallint(5) NOT NULL AUTO_INCREMENT,
Symptom varchar(30),
Treatment varchar(30),
Date_Intervention DATE,
Social_Security_Number_ID int(10),
PRIMARY KEY (Interventions_ID)
);

CREATE TABLE Patients (
Social_Security_Number_ID int(10) NOT NULL,
First_Name varchar(30),
Sure_Name varchar(30),
Date_Admission DATE,
Doctors_ID smallint(5),
PRIMARY KEY (Social_Security_Number_ID)
);

CREATE TABLE Unit (
Unit_ID smallint(5) NOT NULL AUTO_INCREMENT,
Name varchar(30),
Floor smallint(5) NOT NULL,
Social_Security_Number_ID int(10),
PRIMARY KEY (Unit_ID)
);

ALTER TABLE Doctors ADD FOREIGN KEY(Unit_ID) REFERENCES Unit(Unit_ID);
ALTER TABLE Interventions ADD FOREIGN KEY(Social_Security_Number_ID) REFERENCES Patients(Social_Security_Number_ID);
ALTER TABLE Patients ADD FOREIGN KEY(Doctors_ID) REFERENCES Doctors(Doctors_ID);
ALTER TABLE Doctors ADD FOREIGN KEY(Unit_ID) REFERENCES Unit(Unit_ID);
ALTER TABLE Unit ADD FOREIGN KEY(Social_Security_Number_ID) REFERENCES Patients(Social_Security_Number_ID);

SELECT * FROM ``;

select *
from route
inner join routedetail on routedetail.CODE = route.CODE
where route.CODE = 100;

select *
from Patients
inner join Doctors on Doctors.Doctors_ID = Patients.Doctors_ID;/*Welcher Patient mit welchem Doktor*/

select Patients.First_Name,Patients.Sure_Name,Doctors.Speciality
from Patients
inner join Doctors on Doctors.Doctors_ID = Patients.Doctors_ID;/*zeigt nur drei Felder an*/

select Patients.First_Name,Patients.Sure_Name,Doctors.Speciality
from Patients
inner join Doctors on Doctors.Doctors_ID = Patients.Doctors_ID
WHERE Doctors.Sure_Name="Pichler"/*nur  Pichler*/

