USE suwapiyasa_hospital;

#Insert data into Staff table
INSERT INTO Staff (employee_number, name, gender, address, telephone_number)
VALUES
    (1, 'kumara', 'M', '125 strret, kandy', '0756459865'),
    (2, 'sampathi', 'F', '56 kandy street, colombo', '0752369865'),
    (3, 'nuwan', 'M', '222 kadugannwawa, pilimathawa', '0752678865'),
    (4, 'sameeraa', 'F', '145 street, panadura', '0745659865'),
    (5, 'sahan', 'F', '777 jaela, kalaniya', '0752658765'),
    (6, 'kasun', 'M', '888 whitewave, kandy', '0752659857');

#Insert data into Patient table
INSERT INTO Patient (patient_id, name, age, address, telephone_number, blood_type, allergy_name)
VALUES
    (1, 'kumaras', 35, '167 jaela, kalaniya', '0772659857', 'A+', 'Penicillin'),
    (2, 'nuwan', 45, '88 whitewave, kandy', '0772659896', 'B-', 'Asthma'),
    (3, 'kasun sampath', 28,  '95 street, panadura', '0772659786', 'AB+', 'Sinusitis'),
    (4, 'sampath de silva', 60, '195 strret, kandy', '0772659963', 'O-', 'Drug Allergy'),
    (5, 'thavindu', 42, '22 kadugannwawa, pilimathawa', '0772659889', 'A-', 'Penicillin'),
    (6, 'kumarge', 72, '148 street, panadura',  '0772659889','B+', 'Drug Allergy');

#Insert data into Doctor table
INSERT INTO Doctor (employee_number, specialty, salary, patient_id)
VALUES 
    (1, 'Ophthalmologist', '110000', 1),
    (2, 'Pediatrician', '100000', 2),
    (3, 'Neurologist', '110000', 3),
    (4, 'Cardiologist', '95000', 4),
    (5, 'Dermatologist', '195000', 5),
    (6, 'Gynecologist', '133000', 6);

#Insert data into HeadDoctor table
INSERT INTO HeadDoctor (employee_number, HD_number)
VALUES
    (2, 102),
    (3, 103);

#Insert data into Medication table
INSERT INTO Medication (medication_code, name, quantity_on_hand, quantity_ordered, cost, expiration_date)
VALUES
    (101, 'Aspirin', 100, 70, 5, '2023-12-31'),
    (102, 'Ibuprofen', 250, 80, 8, '2024-06-30'),
    (103, 'Amoxicillin', 300, 100, 12, '2024-09-15');

#Insert data into Medication_Patient table
INSERT INTO Medication_Patient (patient_id, medication_code)
VALUES
    (1, 101),
    (3, 102),
    (4, 103);

#Insert data into Surgery table
INSERT INTO Surgery (surgery_id, patient_id, surgery_name, date, time, category, special_needs, theatre)
VALUES
    (1, 2, 'Appendectomy', '2023-09-27', '08:00:00', 'General', 'N/A', 'Theatre A'),
    (2, 1, 'Knee Replacement', '2023-09-10', '09:30:00', 'Orthopedic', 'N/A', 'Theatre B'),
    (3, 4, 'hand Surgery', '2023-09-015', '10:00:00', 'Orthopedic', 'N/A', 'Theatre C');

#Insert data into Nurse table
INSERT INTO Nurse (employee_number, grade, years_of_experience, surgery_skill_type, salary, surgery_id)
VALUES
    (4, 'Senior', 4, 'Cardiovascular', '80000', 1),
    (5, 'Junior', 5, 'Orthopedic', '75000', 2),
    (6, 'Senior', 6, 'General', '85000', 3);

#Insert data into Location table
INSERT INTO Location (bed_number, room_number, nursing_unit, patient_id)
VALUES
    (101, 201, 2, 1),
    (102, 202, 2, 2),
    (103, 203, 3, 5);
