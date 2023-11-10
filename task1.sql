#Drop the database if it exists
DROP DATABASE IF EXISTS suwapiyasa_hospital;

#Create the database
CREATE DATABASE suwapiyasa_hospital;

#Use the database
USE suwapiyasa_hospital;

#Staff table
CREATE TABLE Staff (
    employee_number INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    gender CHAR(1) NOT NULL,
    address VARCHAR(200) NOT NULL,
    telephone_number VARCHAR(20) NOT NULL
);

select * from staff;

#Patient table
CREATE TABLE Patient (
    patient_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    address VARCHAR(200) NOT NULL,
    telephone_number VARCHAR(20) NOT NULL,
    blood_type VARCHAR(5) NOT NULL,
    allergy_name VARCHAR(100) NOT NULL
);

select * from Patient;

#Doctor table
CREATE TABLE Doctor (
    employee_number INT PRIMARY KEY,
    specialty VARCHAR(100) NOT NULL,
    salary VARCHAR(20) NOT NULL,
    patient_id INT NOT NULL,
    FOREIGN KEY (employee_number) REFERENCES Staff (employee_number),
    FOREIGN KEY (patient_id) REFERENCES Patient (patient_id) 
);

#HeadDoctor table
CREATE TABLE HeadDoctor (
    employee_number INT PRIMARY KEY,
    HD_number INT,
    FOREIGN KEY (employee_number) REFERENCES Staff (employee_number)
);

#Medication table
CREATE TABLE Medication (
    medication_code INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    quantity_on_hand INT NOT NULL,
    quantity_ordered INT NOT NULL,
    cost DECIMAL(10, 2) NOT NULL,
    expiration_date DATE NOT NULL
);

#Medication_Patient table (N:M relationship)
CREATE TABLE Medication_Patient (
    patient_id INT,
    medication_code INT,
    PRIMARY KEY (patient_id, medication_code),
    FOREIGN KEY (patient_id) REFERENCES Patient (patient_id),
    FOREIGN KEY (medication_code) REFERENCES Medication (medication_code)
);

#Surgery table
CREATE TABLE Surgery (
    surgery_id INT PRIMARY KEY,
    patient_id INT NOT NULL,
    surgery_name VARCHAR(100) NOT NULL,
    date DATE NOT NULL,
    time TIME NOT NULL,
    category VARCHAR(50) NOT NULL,
    special_needs VARCHAR(200) NOT NULL,
    theatre VARCHAR(50) NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES Patient (patient_id)
);

#Nurse table
CREATE TABLE Nurse (
    employee_number INT PRIMARY KEY,
    grade VARCHAR(50) NOT NULL,
    years_of_experience INT NOT NULL,
    surgery_skill_type VARCHAR(100) NOT NULL,
    salary VARCHAR(20) NOT NULL,
    surgery_id INT,
    FOREIGN KEY (employee_number) REFERENCES Staff (employee_number),
    FOREIGN KEY (surgery_id) REFERENCES Surgery (surgery_id)
);

#Location table
CREATE TABLE Location (
    bed_number INT NOT NULL,
    room_number INT NOT NULL,
    nursing_unit INT NOT NULL,
    patient_id INT NOT NULL,
    PRIMARY KEY (bed_number, room_number),
    FOREIGN KEY (patient_id) REFERENCES Patient (patient_id)
);

