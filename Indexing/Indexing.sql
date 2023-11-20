-- Index on DonationStatus column in BloodDonation Table
CREATE INDEX idx_BloodDonation_DonationStatus ON BloodDonation(DonationStatus);

-- Index on Location column (if frequently used in WHERE clauses)
CREATE INDEX idx_Location ON BloodBank(Location);

-- Combined index on FirstName and LastName columns in Donor Table
CREATE INDEX idx_Donor_FirstName_LastName ON Donor(FirstName, LastName);


-- Queries using indexes 
SELECT DonationID, DonorID, BloodBankID, DonationDate, BloodDetailID
FROM BloodDonation
WHERE DonationStatus = 'Failed';

SELECT BloodBankID, Name, Location, ContactInfo
FROM BloodBank
WHERE Location = '123 Main St, City A';

SELECT DonorID, FirstName, LastName, Gender, DateOfBirth, ContactInfoID, BloodDetailID
FROM Donor
WHERE FirstName = 'John' AND LastName = 'Doe';
