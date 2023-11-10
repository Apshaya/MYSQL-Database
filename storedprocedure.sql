USE suwapiyasa_hospital;

#< Q3 - 321434774 >
#Q3)assume the input parameter is named patient_id and the InOut parameter to store the result is named medication_count

DELIMITER //
CREATE PROCEDURE GetMedicationCount(
    IN patient_id INT,
    INOUT medication_count INT
)
BEGIN
    SELECT COUNT(*) INTO medication_count
    FROM Medication_Patient
    WHERE patient_id = patient_id;
END;
//
DELIMITER ;

#call the stored procedure
SET @output_count = 0;
CALL GetMedicationCount(1, @output_count);

#display the number of medications
SELECT @output_count;


