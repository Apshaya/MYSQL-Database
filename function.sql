USE suwapiyasa_hospital;

#<Q4 - 321434774 >
#Q4)Create the user-defined function

DELIMITER //
CREATE FUNCTION DaysUntilExpiry(expiration_date DATE) RETURNS INT DETERMINISTIC
BEGIN
    RETURN DATEDIFF(expiration_date, CURDATE());
END;
//
DELIMITER ;

SELECT
    M.medication_code,
    M.name AS MedName,
    M.quantity_on_hand AS QuantityAvailable,
    M.expiration_date,
    DaysUntilExpiry(M.expiration_date) AS DaysUntilExpiry
FROM
    Medication M
WHERE
    DaysUntilExpiry(M.expiration_date) < 30;


