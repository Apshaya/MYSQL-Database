USE suwapiyasa_hospital;

#< Q2 - 321434774 >
#Q2)Create the MedInfo table
CREATE TABLE MedInfo (
    MedName VARCHAR(100) PRIMARY KEY,
    QuantityAvailable INT,
    ExpirationDate DATE
);

#Create a trigger to load data into MedInfo after a new record is inserted into the Medication table
DELIMITER //
CREATE TRIGGER AfterMedicationInsert
AFTER INSERT ON Medication
FOR EACH ROW
BEGIN
    INSERT INTO MedInfo (MedName, QuantityAvailable, ExpirationDate)
    VALUES (NEW.name, NEW.quantity_on_hand, NEW.expiration_date);
END;
//
DELIMITER ;

#Create a trigger to automatically update the MedInfo table when values in the Medication table are updated
DELIMITER //
CREATE TRIGGER AfterMedicationUpdate
AFTER UPDATE ON Medication
FOR EACH ROW
BEGIN
    UPDATE MedInfo
    SET QuantityAvailable = NEW.quantity_on_hand,
        ExpirationDate = NEW.expiration_date
    WHERE MedName = OLD.name;
END;
//
DELIMITER ;

#Create a trigger to delete values from the MedInfo table when values in the Medication table are deleted
DELIMITER //
CREATE TRIGGER AfterMedicationDelete
AFTER DELETE ON Medication
FOR EACH ROW
BEGIN
    DELETE FROM MedInfo
    WHERE MedName = OLD.name;
END;
//
DELIMITER ;

