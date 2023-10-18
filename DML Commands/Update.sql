UPDATE Donor
SET MedicalHistory = 'High blood pressure'
WHERE DonorID = 2;

UPDATE Donor
SET MedicalHistory = 'Diabetes'
WHERE DonorID = 3;



-- Update the BloodDetailID for specific BloodReceipt records
UPDATE BloodReceipt
SET BloodDetailID = 1
WHERE ReceiptID = 1;

UPDATE BloodReceipt
SET BloodDetailID = 2
WHERE ReceiptID = 2;

UPDATE BloodReceipt
SET BloodDetailID = 3
WHERE ReceiptID = 3;