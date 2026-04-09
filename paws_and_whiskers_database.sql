DROP DATABASE IF EXISTS pawsandwhiskers;
CREATE DATABASE pawsandwhiskers;
USE pawsandwhiskers;

-- CREATE TABLES
CREATE TABLE owners (
    Owner_ID VARCHAR(15) PRIMARY KEY NOT NULL,
    Owner_contactno VARCHAR(15) NOT NULL,
    Owner_Email VARCHAR(30) NOT NULL,
    Owner_name VARCHAR(50) NOT NULL,
    Owner_registration_date DATE NOT NULL
);

CREATE TABLE pets (
    Pet_ID VARCHAR(15) PRIMARY KEY NOT NULL,
    Pet_Species VARCHAR(15) NOT NULL,
    Pet_Breed VARCHAR(20) NOT NULL,
    Pet_Birthdate DATE NOT NULL,
    Pet_Name VARCHAR(20) NOT NULL,
    Owner_ID VARCHAR(15) NOT NULL,
    FOREIGN KEY (Owner_ID) REFERENCES owners(Owner_ID)
);

CREATE TABLE appointments (
    Appointment_ID VARCHAR(10) PRIMARY KEY NOT NULL,
    Appointment_reason VARCHAR(30) NOT NULL,
    Appointment_date DATE NOT NULL,
    Appointment_status VARCHAR(30) NOT NULL,
    Pet_ID VARCHAR(15) NOT NULL,
    FOREIGN KEY (Pet_ID) REFERENCES pets(Pet_ID)
);

CREATE TABLE diagnosis (
    Diagnosis_ID VARCHAR(15) PRIMARY KEY NOT NULL,
    Appointment_ID VARCHAR(10) NOT NULL,
    Diagnosis_Description VARCHAR(50) NOT NULL,
    Diagnosed_date DATE NOT NULL,
    Diagnosis_name VARCHAR(20) NOT NULL,
    FOREIGN KEY (Appointment_ID) REFERENCES appointments(Appointment_ID)
);

CREATE TABLE Treatment (
    Treatment_ID VARCHAR(20) PRIMARY KEY NOT NULL,
    Treatment_type VARCHAR(20) NOT NULL,
    Treatment_cost DECIMAL(10,2) NOT NULL,
    Treatment_date DATE NOT NULL,
    Diagnosis_ID VARCHAR(15) NOT NULL,
    FOREIGN KEY (Diagnosis_ID) REFERENCES diagnosis(Diagnosis_ID)
);

CREATE TABLE medication (
    Medication_ID VARCHAR(10) PRIMARY KEY NOT NULL,
    Treatment_ID VARCHAR(20) NOT NULL,
    Drug_name VARCHAR(20) NOT NULL,
    Dosage VARCHAR(10) NOT NULL,
    Frequency VARCHAR(50) NOT NULL,
    FOREIGN KEY (Treatment_ID) REFERENCES Treatment(Treatment_ID)
);

CREATE TABLE staff (
    Staff_ID VARCHAR(15) PRIMARY KEY NOT NULL,
    Staff_name VARCHAR(20) NOT NULL,
    Staff_contactno VARCHAR(15) NOT NULL,
    Staff_hiredate DATE NOT NULL,
    Staff_email VARCHAR(30) NOT NULL,
    Staff_role VARCHAR(20) NOT NULL
);

CREATE TABLE equipment (
    Equipment_ID VARCHAR(15) PRIMARY KEY NOT NULL,
    Equipment_type VARCHAR(15) NOT NULL,
    Equipment_purchase_date DATE NOT NULL,
    Equipment_name VARCHAR(15) NOT NULL
);

CREATE TABLE Treatment_staff (
    Treatment_ID VARCHAR(20) NOT NULL,
    Staff_ID VARCHAR(15) NOT NULL,
    PRIMARY KEY (Treatment_ID, Staff_ID),
    FOREIGN KEY (Treatment_ID) REFERENCES Treatment(Treatment_ID),
    FOREIGN KEY (Staff_ID) REFERENCES staff(Staff_ID)
);

CREATE TABLE Treatment_equipment (
    Equipment_ID VARCHAR(15) NOT NULL,
    Treatment_ID VARCHAR(20) NOT NULL,
    PRIMARY KEY (Equipment_ID, Treatment_ID),
    FOREIGN KEY (Treatment_ID) REFERENCES Treatment(Treatment_ID),
    FOREIGN KEY (Equipment_ID) REFERENCES equipment(Equipment_ID)
);

-- INSERT SAMPLE DATA

INSERT INTO owners VALUES
('OWN001', '0722335678', 'alexgreen@gmail.com', 'Alex Green', '2024-05-01'),
('OWN002', '0776556876', 'sarah@gmail.com', 'Sarah Brown', '2024-02-20'),
('OWN003', '0776520371', 'amal123@gmail.com', 'Amal Perera', '2024-03-10'),
('OWN004', '0774451097', 'johnmicheal@gmail.com', 'John Micheal', '2024-06-23'),
('OWN005', '0766528223', 'kumarifernando@gmail.com', 'Kumari Fernando', '2024-08-07');

INSERT INTO pets VALUES
('PET001', 'Dog', 'Labrador', '2021-03-15', 'Rocky', 'OWN001'),
('PET002', 'Cat', 'Siamese', '2022-07-20', 'Luna', 'OWN002'),
('PET003', 'Dog', 'Terrier', '2020-11-05', 'Max', 'OWN003'),
('PET004', 'Rabbit', 'Mini Lop', '2023-01-30', 'Babyboo', 'OWN001'),
('PET005', 'Cat', 'Persian', '2023-03-31', 'Immi', 'OWN002'),
('PET006', 'Bird', 'Parrot', '2023-09-30', 'Zuzi', 'OWN004'),
('PET007', 'Dog', 'Boxer', '2023-10-23', 'Shishimaru', 'OWN005');

INSERT INTO staff VALUES
('STF001', 'Dr. Mahen Jayalath', '0771234567', '2023-01-15', 'mahen@clinic.com', 'Veterinarian'),
('STF002', 'Nurse Anuki Perera', '0772345678', '2023-03-20', 'anuki@clinic.com', 'Nurse'),
('STF003', 'Dr. Sameera Silva', '0773456789', '2022-11-10', 'sameera@clinic.com', 'Veterinarian'),
('STF004', 'Kamal Fernando', '0774567890', '2024-02-01', 'kamal@clinic.com', 'Groomer'),
('STF005', 'Nurse Liyana Pieris', '0734591782', '2024-04-02', 'liyana@clinic.com', 'Nurse');

INSERT INTO appointments VALUES
('APP001', 'Vaccination', '2024-10-01', 'Completed', 'PET001'),
('APP002', 'Check-up', '2024-10-02', 'Completed', 'PET002'),
('APP003', 'Dental Cleaning', '2024-10-03', 'Completed', 'PET003'),
('APP004', 'Grooming', '2024-10-04', 'Completed', 'PET004'),
('APP005', 'Skin Treatment', '2024-10-05', 'Completed', 'PET005');

INSERT INTO diagnosis VALUES
('DIA001', 'APP001', 'Annual rabies vaccination administered', '2024-10-01', 'Rabies Vaccination'),
('DIA002', 'APP002', 'Routine health check, all parameters normal', '2024-10-02', 'Healthy Check-up'),
('DIA003', 'APP003', 'Teeth cleaning and plaque removal', '2024-10-03', 'Dental Cleaning'),
('DIA004', 'APP004', 'Full grooming and coat maintenance', '2024-10-04', 'Grooming Service'),
('DIA005', 'APP005', 'Skin allergy treatment prescribed', '2024-10-05', 'Skin Allergy');

INSERT INTO Treatment VALUES
('TRT001', 'Vaccination', 2500.00, '2024-10-01', 'DIA001'),
('TRT002', 'Check-up', 1500.00, '2024-10-02', 'DIA002'),
('TRT003', 'Dental', 3500.00, '2024-10-03', 'DIA003'),
('TRT004', 'Grooming', 2000.00, '2024-10-04', 'DIA004'),
('TRT005', 'Medication', 4200.00, '2024-10-05', 'DIA005');

INSERT INTO medication VALUES
('MED001', 'TRT001', 'Rabies Vaccine', '1 ml', 'Once'),
('MED002', 'TRT005', 'Antihistamine', '10 mg', 'Twice daily for 7 days'),
('MED003', 'TRT005', 'Antibiotic Ointment', '5 g', 'Apply twice daily');

INSERT INTO equipment VALUES
('EQP001', 'Medical', '2023-05-10', 'Syringe'),
('EQP002', 'Medical', '2023-06-15', 'Stethoscope'),
('EQP003', 'Dental', '2023-07-20', 'Dental Scaler'),
('EQP004', 'Grooming', '2023-08-25', 'Clippers'),
('EQP005', 'Medical', '2023-09-30', 'Microscope');

INSERT INTO Treatment_staff VALUES
('TRT001', 'STF001'),
('TRT002', 'STF001'),
('TRT003', 'STF003'),
('TRT004', 'STF004'),
('TRT005', 'STF002');

INSERT INTO Treatment_equipment VALUES
('EQP001', 'TRT001'),
('EQP002', 'TRT002'),
('EQP003', 'TRT003'),
('EQP004', 'TRT004'),
('EQP005', 'TRT005');

-- SQL QUERIES

-- 1. Select all dogs
SELECT * FROM pets WHERE Pet_Species = 'Dog';

-- 2. Update treatment cost
UPDATE Treatment SET Treatment_cost = 3000.00 WHERE Treatment_ID = 'TRT001';

-- 3. Treatments between two dates
SELECT * FROM Treatment
WHERE Treatment_date BETWEEN '2024-10-01' AND '2024-10-03';

-- 4. Staff by role
SELECT * FROM staff
WHERE Staff_role IN ('Veterinarian', 'Nurse');

-- 5. Count pets by species
SELECT Pet_Species, COUNT(*) AS Total_Pets
FROM pets
GROUP BY Pet_Species;

-- 6. All pets alphabetically
SELECT * FROM pets ORDER BY Pet_Name;

-- 7. Species with more than 2 pets
SELECT Pet_Species, COUNT(*) AS Pet_count
FROM pets
GROUP BY Pet_Species
HAVING COUNT(*) > 2;
