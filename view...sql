USE suwapiyasa_hospital;

#<Q1 - 321434774 -->
#Q2)create view

CREATE VIEW PatientSurgeryView AS
SELECT
    P.patient_id AS Patient_Id,
    CONCAT(LEFT(P.name, 1), ' ', SUBSTRING_INDEX(P.name, ' ', -1)) AS Patient_Name,
    CONCAT(L.bed_number, '-', L.room_number) AS Location,
    S.surgery_name AS Surgery_Name,
    S.date AS Surgery_Date
FROM
    Patient P
JOIN
    Surgery S ON P.patient_id = S.patient_id
JOIN
    Location L ON P.patient_id = L.patient_id;
    
SELECT * FROM PatientSurgeryView;
