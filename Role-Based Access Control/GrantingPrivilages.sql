GRANT ALL PRIVILEGES ON blood_bank_management.* TO Admin;


GRANT SELECT, INSERT, UPDATE, DELETE ON blood_bank_management.BloodBank TO BloodBankManager;
GRANT SELECT, INSERT, UPDATE, DELETE ON blood_bank_management.BloodType TO BloodBankManager;
GRANT SELECT, INSERT, UPDATE, DELETE ON blood_bank_management.BloodDetail TO BloodBankManager;

GRANT SELECT, INSERT, UPDATE ON blood_bank_management.Donor TO DonorManager;
GRANT SELECT, UPDATE ON blood_bank_management.BloodDetail TO DonorManager;
GRANT INSERT, UPDATE ON blood_bank_management.BloodDonation TO DonorManager;



GRANT SELECT, INSERT, UPDATE ON blood_bank_management.Recipient TO RecipientManager;
GRANT SELECT, UPDATE ON blood_bank_management.BloodDetail TO RecipientManager;
GRANT INSERT, UPDATE ON blood_bank_management.BloodReceipt TO RecipientManager;


REVOKE UPDATE ON blood_bank_management.BloodDetail FROM DonorManager;
REVOKE UPDATE ON blood_bank_management.BloodDetail FROM RecipientManager;