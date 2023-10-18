ALTER TABLE Donar
ADD MedicalHistory TEXT DEFAULT NULL;


ALTER TABLE BloodReceipt
ADD FOREIGN KEY (BloodDetailID) REFERENCES BloodDetail(BloodDetailID);