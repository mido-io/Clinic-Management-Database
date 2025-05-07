-- Update and delete operations for hospital database

-- Update dpphone for a specific record
UPDATE Doctor_Phone
SET dpphone = '123-456-5555'
WHERE dpdid = 'D001' AND dpphone = '123-456-7890';

-- Delete all records for a specific dpdid
DELETE FROM Doctor_Phone
WHERE dpdid = 'D001';

-- Update SeSerialNumber for a specific record
UPDATE Steralize
SET SeSerialNumber = 555555
WHERE spaid = 'PA001' AND SeSerialNumber = 1001;

-- Delete a specific record based on spaid and SeSerialNumber
DELETE FROM Steralize
WHERE spaid = 'PA001' AND SeSerialNumber = 555555;