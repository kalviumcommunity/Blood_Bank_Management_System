SELECT d.FirstName, d.LastName
FROM Donor AS d
WHERE d.DonorID  IN (SELECT DISTINCT DonorID FROM BloodDonation where DonationStatus="Successful");



SELECT bt.BloodTypeName
FROM BloodType AS bt
WHERE bt.BloodTypeID  IN (
    SELECT DISTINCT bd.BloodTypeID
    FROM BloodDetail AS bd
);

