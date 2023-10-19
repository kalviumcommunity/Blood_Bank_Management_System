-- Create BloodBank Table
CREATE TABLE BloodBank (
    BloodBankID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Location VARCHAR(255) NOT NULL,
    ContactInfo VARCHAR(255) NOT NULL UNIQUE,
    CHECK (LENGTH(ContactInfo) >= 10)
);

-- Create BloodType Table
CREATE TABLE BloodType (
    BloodTypeID INT AUTO_INCREMENT PRIMARY KEY,
    BloodTypeName ENUM('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-') NOT NULL
);

-- Create BloodTypes Table (for BloodDetails normalization)
CREATE TABLE BloodDetail (
    BloodDetailID INT AUTO_INCREMENT PRIMARY KEY,
    BloodBankID INT,
    BloodTypeID INT,
    Quantity INT NOT NULL,
    FOREIGN KEY (BloodBankID) REFERENCES BloodBank(BloodBankID),
    FOREIGN KEY (BloodTypeID) REFERENCES BloodType(BloodTypeID)
);

-- Create Contact Table
CREATE TABLE Contact (
    ContactInfoID INT AUTO_INCREMENT PRIMARY KEY,
    ContactInfo VARCHAR(255) NOT NULL UNIQUE
);

-- Create Donor Table
CREATE TABLE Donor (
    DonorID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Gender ENUM('M', 'F', 'Other') NOT NULL,
    DateOfBirth DATE NOT NULL,
    ContactInfoID INT,
    BloodDetailID INT,
    FOREIGN KEY (ContactInfoID) REFERENCES Contact(ContactInfoID),
    FOREIGN KEY (BloodDetailID) REFERENCES BloodDetail(BloodDetailID)
);

-- Create Recipient Table
CREATE TABLE Recipient (
    RecipientID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Gender ENUM('M', 'F', 'Other') NOT NULL,
    DateOfBirth DATE NOT NULL,
    ContactInfoID INT,
    BloodDetailID INT,
    FOREIGN KEY (ContactInfoID) REFERENCES Contact(ContactInfoID),
    FOREIGN KEY (BloodDetailID) REFERENCES BloodDetail(BloodDetailID)
);

-- Create BloodDonation Table
CREATE TABLE BloodDonation (
    DonationID INT AUTO_INCREMENT PRIMARY KEY,
    DonorID INT NOT NULL,
    BloodBankID INT NOT NULL,
    DonationDate DATE NOT NULL,
    BloodDetailID INT NOT NULL,
    HemoglobinLevel DECIMAL(5, 2) NOT NULL,
    DonationStatus VARCHAR(20) NOT NULL,
    FOREIGN KEY (DonorID) REFERENCES Donor(DonorID),
    FOREIGN KEY (BloodBankID) REFERENCES BloodBank(BloodBankID),
    FOREIGN KEY (BloodDetailID) REFERENCES BloodDetail(BloodDetailID)
);

-- Create BloodReceipt Table
CREATE TABLE BloodReceipt (
    ReceiptID INT AUTO_INCREMENT PRIMARY KEY,
    RecipientID INT NOT NULL,
    BloodBankID INT NOT NULL,
    ReceiptDate DATE NOT NULL,
    BloodDetailID INT NOT NULL,
    HemoglobinLevel DECIMAL(5, 2) NOT NULL,
    ReceiptStatus INT,
    FOREIGN KEY (RecipientID) REFERENCES Recipient(RecipientID),
    FOREIGN KEY (BloodBankID) REFERENCES BloodBank(BloodBankID)
);

-- Create BloodTransfusion Table
CREATE TABLE BloodTransfusion (
    TransfusionID INT AUTO_INCREMENT PRIMARY KEY,
    RecipientID INT NOT NULL,
    BloodBankID INT NOT NULL,
    TransfusionDate DATE NOT NULL,
    BloodDetailID INT NOT NULL,
    HemoglobinLevel DECIMAL(5, 2) NOT NULL,
    MedicalHistory TEXT DEFAULT NULL,
    FOREIGN KEY (RecipientID) REFERENCES Recipient(RecipientID),
    FOREIGN KEY (BloodBankID) REFERENCES BloodBank(BloodBankID),
    FOREIGN KEY (BloodDetailID) REFERENCES BloodDetail(BloodDetailID)
);
