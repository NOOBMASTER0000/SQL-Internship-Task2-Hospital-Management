USE HospitalDB;

-- ===============================
-- 1. INSERT DATA INTO TABLES
-- ===============================

-- Departments
INSERT INTO Departments (DeptName, Location)
VALUES 
('Cardiology', 'Block A'),
('Neurology', 'Block B'),
('Orthopedics', 'Block C'),
('Pediatrics', 'Block D'),
('Dermatology', 'Block E');

-- Doctors
INSERT INTO Doctors (DoctorName, Specialty, Phone, Email, DepartmentID)
VALUES
('Dr. Arjun Mehta', 'Cardiologist', '9876543210', 'arjun.mehta@hospital.com', 1),
('Dr. Priya Sharma', 'Neurologist', '8765432109', 'priya.sharma@hospital.com', 2),
('Dr. Ravi Nair', 'Orthopedic', '9988776655', 'ravi.nair@hospital.com', 3),
('Dr. Sneha Iyer', 'Pediatrician', NULL, 'sneha.iyer@hospital.com', 4),
('Dr. Raj Patel', 'Dermatologist', '9090909090', NULL, 5);

-- Patients
INSERT INTO Patients (PatientName, Gender, DOB, Address, Phone)
VALUES
('Ananya Gupta', 'Female', '1995-04-12', 'Delhi', '9876543211'),
('Rohan Kumar', 'Male', '1989-10-03', 'Mumbai', '9998887776'),
('Meera Joshi', 'Female', '2002-08-21', 'Chennai', NULL),
('Arav Singh', 'Male', '1998-12-14', 'Bangalore', '9988776654');

-- Appointments
INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, Diagnosis)
VALUES
(1, 1, '2025-10-19 09:30:00', 'Chest Pain'),
(2, 2, '2025-10-19 10:00:00', 'Migraine'),
(3, 4, '2025-10-20 11:15:00', 'Flu'),
(4, 3, '2025-10-20 12:30:00', NULL);

-- Medications
INSERT INTO Medications (AppointmentID, MedicineName, Dosage, Duration)
VALUES
(1, 'Aspirin', '100mg', '5 days'),
(2, 'Paracetamol', '500mg', '3 days'),
(3, 'Cough Syrup', '10ml', '7 days'),
(4, NULL, NULL, NULL);  -- NULL values for testing

-- Bills
INSERT INTO Bills (AppointmentID, BillDate, Amount, PaymentStatus)
VALUES
(1, '2025-10-19', 1200.50, 'Paid'),
(2, '2025-10-19', 800.00, 'Pending'),
(3, '2025-10-20', 600.00, 'Paid'),
(4, '2025-10-20', NULL, 'Unpaid');  -- NULL for Amount

SELECT * FROM Departments;
SELECT * FROM Doctors;
SELECT * FROM Patients;
SELECT * FROM Appointments;
SELECT * FROM Medications;
SELECT * FROM Bills;

-- ===============================
-- 2. UPDATE EXAMPLES
-- ===============================

-- Update phone number for a doctor
UPDATE Doctors
SET Phone = '8888888888'
WHERE DoctorID = 2;

-- Update payment status for pending bills
UPDATE Bills
SET PaymentStatus = 'Paid'
WHERE PaymentStatus = 'Pending';

-- Set default amount for NULL bills
UPDATE Bills
SET Amount = 500.00
WHERE Amount IS NULL;

-- ===============================
-- 3. DELETE EXAMPLES
-- ===============================

-- Delete a medication record that has NULL medicine name
DELETE FROM Medications
WHERE MedicineName IS NULL;

-- Delete appointments older than a specific date
DELETE FROM Appointments
WHERE AppointmentDate < '2025-10-19';
