INSERT INTO BloodBank (Name, Location, ContactInfo)
VALUES
    ('Blood Bank A', '123 Main St, City A', 'contactA@example.com'),
    ('Blood Bank B', '456 Elm St, City B', 'contactB@example.com'),
    ('Blood Bank C', '789 Oak St, City C', 'contactC@example.com'),
    ('Blood Bank D', '7121 LPU , City D', 'contactD@example.com');

-- Insert data into the BloodType table
INSERT INTO BloodType (BloodTypeName)
VALUES
    ('A+'),
    ('A-'),
    ('B+'),
    ('B-'),
    ('AB+'),
    ('AB-'),
    ('O+'),
    ('O-');
    

-- Insert data into the BloodDetail table (for BloodDetails normalization)
INSERT INTO BloodDetail (BloodBankID, BloodTypeID, Quantity)
VALUES
    (1, 1, 100),
    (2, 2, 50),
    (3, 3, 75),
    (2, 6, 12),
    (3, 5, 26),
    (4, 1, 56);


-- Insert data into the Contact table
INSERT INTO Contact (ContactInfo)
VALUES
    ('donor1@example.com'),
    ('donor2@example.com'),
    ('recipient1@example.com'),
    ('recipient2@example.com');

-- Insert data into the Donor table
INSERT INTO Donor (FirstName, LastName, Gender, DateOfBirth, ContactInfoID, BloodDetailID)
VALUES
    ('John', 'Doe', 'M', '1990-01-15', 1, 1),
    ('Jane', 'Smith', 'F', '1985-05-20', 2, 2),
    ('Bob', 'Johnson', 'M', '1988-11-30', 1, 3),
    ('Rahul', 'Kumar', 'M', '1995-01-15', 1, 4),
    ('John', 'Doe', 'M', '1990-01-15', 2, 6);

-- Insert data into the Recipient table
INSERT INTO Recipient (FirstName, LastName, Gender, DateOfBirth, ContactInfoID, BloodDetailID)
VALUES
    ('Alice', 'Wilson', 'F', '1975-09-10', 3, 1),
    ('David', 'Lee', 'M', '1992-03-25', 4, 2),
    ('Eva', 'Garcia', 'F', '1980-07-15', 4, 5);


-- Insert data into the BloodDonation table
INSERT INTO BloodDonation (DonorID, BloodBankID, DonationDate, BloodDetailID, HemoglobinLevel, DonationStatus)
VALUES
    (1, 1, '2023-10-16', 1, 14.5, 'Successful'),
    (2, 2, '2023-10-17', 2, 13.8, 'Successful'),
    (3, 3, '2023-10-18', 3, 14.2, 'Successful'),
    (4, 2, '2023-10-19', 4, 14.2, 'Error'),
    (5,4, '2023-10-20', 6, 14.2, 'Failed');

-- Insert data into the BloodReceipt table
INSERT INTO BloodReceipt (RecipientID, BloodBankID, ReceiptDate, BloodDetailID, HemoglobinLevel, ReceiptStatus)
VALUES
    (1, 1, '2023-10-19', 1, 14.3, 1),
    (2, 2, '2023-10-20', 2, 13.7, 2),
    (3, 3, '2023-10-21', 3, 14.1, 1);