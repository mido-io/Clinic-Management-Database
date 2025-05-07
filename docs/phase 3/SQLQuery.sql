CREATE TABLE Doctor (
    did VARCHAR(30) PRIMARY KEY,
    dname VARCHAR(40),
    demail VARCHAR(60),
    dsalary INT,
    dexperience VARCHAR(500),
    dstartDate DATE,
    dendDate DATE
);

INSERT INTO Doctor (did, dname, demail, dsalary, dexperience, dstartDate, dendDate)
VALUES
    ('D001', 'Dr. Smith', 'dr.smith@example.com', 120000, '10 years', '2020-01-15', '2023-01-15'),
    ('D002', 'Dr. Johnson', 'dr.johnson@example.com', 110000, '8 years', '2018-02-01', '2023-02-01'),
    ('D003', 'Dr. Davis', 'dr.davis@example.com', 130000, '15 years', '2017-03-10', '2023-03-10'),
    ('D004', 'Dr. Brown', 'dr.brown@example.com', 125000, '12 years', '2016-04-28', '2023-04-28'),
    ('D005', 'Dr. Wilson', 'dr.wilson@example.com', 140000, '20 years', '2015-05-17', '2023-05-17'),
    ('D006', 'Dr. Taylor', 'dr.taylor@example.com', 115000, '7 years', '2014-06-03', '2023-06-03'),
    ('D007', 'Dr. White', 'dr.white@example.com', 135000, '18 years', '2013-07-09', '2023-07-09'),
    ('D008', 'Dr. Miller', 'dr.miller@example.com', 125000, '14 years', '2012-08-25', '2023-08-25'),
    ('D009', 'Dr. Lee', 'dr.lee@example.com', 130000, '16 years', '2011-09-14', '2023-09-14'),
    ('D010', 'Dr. Parker', 'dr.parker@example.com', 120000, '11 years', '2010-10-18', '2023-10-18');
SELECT * FROM Doctor;


sp_help 'Doctor';

CREATE TABLE rooms (
    rno VARCHAR(30),
    rcapacity INT,
    rtype VARCHAR(30) NOT NULL,
    rcontent VARCHAR(30) NOT NULL,
    rfloor VARCHAR(30),
    PRIMARY KEY (rno)
);

INSERT INTO rooms (rno, rcapacity, rtype, rcontent, rfloor)
VALUES
    ('R101', 10, 'Standard', 'General', '1st Floor'),
    ('R102', 8, 'Specialized', 'Cardiology', '1st Floor'),
    ('R103', 12, 'Standard', 'Orthopedic', '2nd Floor'),
    ('R104', 15, 'Specialized', 'Dermatology', '2nd Floor'),
    ('R105', 20, 'Standard', 'Pediatrics', '3rd Floor'),
    ('R106', 18, 'Specialized', 'Oncology', '3rd Floor'),
    ('R107', 25, 'Standard', 'Radiology', '4th Floor'),
    ('R108', 30, 'Specialized', 'Neurology', '4th Floor'),
    ('R109', 22, 'Standard', 'Gynecology', '5th Floor'),
    ('R110', 28, 'Specialized', 'Urology', '5th Floor');
SELECT * FROM rooms;

sp_help 'rooms';

CREATE TABLE paramedics (
    paid VARCHAR(30) PRIMARY KEY,
    pdid VARCHAR(30),
    pstartdate DATE,
    ppaendtdate DATE,
    pasalary INT,
    passn INT,
    paexperiance VARCHAR(500),
    paroom INT,
    paprocedure VARCHAR(40),
    paemail VARCHAR(50),
    paame VARCHAR(60),
    pagender VARCHAR(6),
    FOREIGN KEY (pdid) REFERENCES Doctor (did)
);

INSERT INTO paramedics (paid, pdid, pstartdate, ppaendtdate, pasalary, passn, paexperiance, paroom, paprocedure, paemail, paame, pagender)
VALUES
    ('PA001', 'D001', '2020-01-15', '2023-01-15', 80000, 123456789, '5 years', 101, 'General Checkup', 'paramedic1@example.com', 'Paramedic One', 'Male'),
    ('PA002', 'D002', '2018-02-01', '2023-02-01', 75000, 987654321, '4 years', 102, 'Cardiology', 'paramedic2@example.com', 'Paramedic Two', 'Female'),
    ('PA003', 'D003', '2017-03-10', '2023-03-10', 85000, 555123456, '6 years', 103, 'Orthopedic', 'paramedic3@example.com', 'Paramedic Three', 'Male'),
    ('PA004', 'D004', '2016-04-28', '2023-04-28', 90000, 888555123, '7 years', 104, 'Dermatology', 'paramedic4@example.com', 'Paramedic Four', 'Female'),
    ('PA005', 'D005', '2015-05-17', '2023-05-17', 95000, 777888999, '8 years', 105, 'Pediatrics', 'paramedic5@example.com', 'Paramedic Five', 'Male'),
    ('PA006', 'D006', '2014-06-03', '2023-06-03', 100000, 111222333, '9 years', 106, 'General Checkup', 'paramedic6@example.com', 'Paramedic Six', 'Female'),
    ('PA007', 'D007', '2013-07-09', '2023-07-09', 105000, 444555666, '10 years', 107, 'Cardiology', 'paramedic7@example.com', 'Paramedic Seven', 'Male'),
    ('PA008', 'D008', '2012-08-25', '2023-08-25', 110000, 666777888, '11 years', 108, 'Orthopedic', 'paramedic8@example.com', 'Paramedic Eight', 'Female'),
    ('PA009', 'D009', '2011-09-14', '2023-09-14', 115000, 333444555, '12 years', 109, 'Dermatology', 'paramedic9@example.com', 'Paramedic Nine', 'Male'),
    ('PA010', 'D010', '2010-10-18', '2023-10-18', 120000, 000111222, '13 years', 110, 'Pediatrics', 'paramedic10@example.com', 'Paramedic Ten', 'Female');
SELECT * FROM paramedics;


sp_help 'paramedics';

CREATE TABLE appointments (
    adid VARCHAR(30),
    arno VARCHAR(30),
    apid VARCHAR(30),
    ano INT UNIQUE,
    apatientname VARCHAR(30) NOT NULL,
    afollow_up_date DATE,
    atime VARCHAR(20),
    adate DATE,
    atype VARCHAR(30),
    apatientid VARCHAR(30),
    PRIMARY KEY (apatientid),
    FOREIGN KEY (adid) REFERENCES doctor (did),
    FOREIGN KEY (arno) REFERENCES rooms (rno),
    FOREIGN KEY (apid) REFERENCES paramedics (paid)
);

INSERT INTO appointments (adid, arno, apid, ano, apatientname, afollow_up_date, atime, adate, atype, apatientid)
VALUES
    ('D001', 'R101', 'PA001', 1, 'Alice Johnson', '2023-01-15', '09:00 AM', '2023-01-15', 'General', 'P001'),
    ('D002', 'R102', 'PA002', 2, 'Bob Smith', '2023-02-01', '10:30 AM', '2023-02-01', 'Cardiology', 'P002'),
    ('D003', 'R103', 'PA003', 3, 'Charlie Brown', '2023-03-10', '11:45 AM', '2023-03-10', 'Orthopedic', 'P003'),
    ('D004', 'R104', 'PA004', 4, 'Diana Miller', '2023-04-28', '02:15 PM', '2023-04-28', 'Dermatology', 'P004'),
    ('D005', 'R105', 'PA005', 5, 'Ethan Davis', '2023-05-17', '03:30 PM', '2023-05-17', 'Pediatrics', 'P005'),
    ('D006', 'R106', 'PA006', 6, 'Fiona Wilson', '2023-06-03', '04:45 PM', '2023-06-03', 'General', 'P006'),
    ('D007', 'R107', 'PA007', 7, 'George Taylor', '2023-07-09', '06:00 PM', '2023-07-09', 'Cardiology', 'P007'),
    ('D008', 'R108', 'PA008', 8, 'Hannah White', '2023-08-25', '08:30 AM', '2023-08-25', 'Orthopedic', 'P008'),
    ('D009', 'R109', 'PA009', 9, 'Ian Parker', '2023-09-14', '01:00 PM', '2023-09-14', 'Dermatology', 'P009'),
    ('D010', 'R110', 'PA010', 10, 'Jasmine Lee', '2023-10-18', '05:15 PM', '2023-10-18', 'Pediatrics', 'P010');


SELECT * FROM appointments;

sp_help 'appointments';
CREATE TABLE Medical_Investigations (
    mipatientid VARCHAR(30) PRIMARY KEY,
    MI_D_Id VARCHAR(30),
    MI_Diagnosis VARCHAR(300),
    MI_patient_name VARCHAR(50),
    MI_A_Patient_id VARCHAR(30),
    FOREIGN KEY (MI_D_Id) REFERENCES doctor (did),
    FOREIGN KEY (MI_A_Patient_id) REFERENCES appointments (apatientid)
);



INSERT INTO Medical_Investigations (mipatientid, MI_D_Id, MI_Diagnosis, MI_patient_name)
VALUES
    ('MI001', 'D001', 'Blood Test Normal', 'John Doe'),
    ('MI002', 'D002', 'X-Ray Abnormal', 'Jane Smith'),
    ('MI003', 'D003', 'MRI Results Pending', 'Bob Johnson'),
    ('MI004', 'D004', 'Dermatitis Diagnosed', 'Mary Davis'),
    ('MI005', 'D005', 'Pediatric Checkup Completed', 'Mike Brown'),
    ('MI006', 'D006', 'Blood Test Normal', 'Sara Wilson'),
    ('MI007', 'D007', 'X-Ray Abnormal', 'Chris White'),
    ('MI008', 'D008', 'MRI Results Pending', 'David Miller'),
    ('MI009', 'D009', 'Dermatitis Diagnosed', 'Laura Lee'),
    ('MI010', 'D010', 'Pediatric Checkup Completed', 'Tom Parker');
SELECT * FROM Medical_Investigations;

sp_help 'Medical_Investigations';


CREATE TABLE bills (
    bPatientid VARCHAR(30),
    bapatientid VARCHAR(30),
    bpatient_name VARCHAR(30) NOT NULL,
    bservice_date DATE,
    btotal_amount DECIMAL(8, 2),
    cost DECIMAL(8, 2),
    baaid VARCHAR(30),
    PRIMARY KEY (bPatientid),
    FOREIGN KEY (baaid) REFERENCES paramedics (paid),
    FOREIGN KEY (bPatientid) REFERENCES appointments (aPatientid)
);

INSERT INTO bills (bPatientid, bapatientid, bpatient_name, bservice_date, btotal_amount, cost, baaid)
VALUES
    ('P001', 'AP001', 'Alice Johnson', '2023-01-15', 500.00, 100.00, 'PA001'),
    ('P002', 'AP002', 'Bob Smith', '2023-02-01', 600.00, 120.00, 'PA002'),
    ('P003', 'AP003', 'Charlie Brown', '2023-03-10', 700.00, 150.00, 'PA003'),
    ('P004', 'AP004', 'Diana Miller', '2023-04-28', 800.00, 200.00, 'PA004'),
    ('P005', 'AP005', 'Ethan Davis', '2023-05-17', 900.00, 180.00, 'PA005'),
    ('P006', 'AP006', 'Fiona Wilson', '2023-06-03', 1000.00, 220.00, 'PA006'),
    ('P007', 'AP007', 'George Taylor', '2023-07-09', 1100.00, 250.00, 'PA007'),
    ('P008', 'AP008', 'Hannah White', '2023-08-25', 1200.00, 300.00, 'PA008'),
    ('P009', 'AP009', 'Ian Parker', '2023-09-14', 1300.00, 280.00, 'PA009'),
    ('P010', 'AP010', 'Jasmine Lee', '2023-10-18', 1400.00, 320.00, 'PA010');
SELECT * FROM bills;


sp_help 'bills';

CREATE TABLE patients (
    Pid VARCHAR(30) PRIMARY KEY,
    Pmedical_history VARCHAR(100) NOT NULL,
    Pname VARCHAR(15) NOT NULL,
    Pgender CHAR NOT NULL,
    PBD DATE NOT NULL,
    pbpatientid VARCHAR(30),
    pmipatientid VARCHAR(30),
    ppaid VARCHAR(30),
    pdid VARCHAR(30),
    FOREIGN KEY (pbpatientid) REFERENCES bills (bpatientid),
    FOREIGN KEY (pmipatientid) REFERENCES medical_investigations (mipatientid),
    FOREIGN KEY (ppaid) REFERENCES paramedics (paid),
    FOREIGN KEY (pdid) REFERENCES doctor(did)
);

INSERT INTO patients (Pid, Pmedical_history, Pname, Pgender, PBD, pmipatientid, ppaid, pdid)
VALUES
    ('P001', 'Allergic to penicillin', 'Alice Johnson', 'F', '1990-05-15',  'MI001', 'PA001', 'D001'),
    ('P002', 'No known medical conditions', 'Bob Smith', 'M', '1985-08-22',  'MI002', 'PA002', 'D002'),
    ('P003', 'Asthma', 'Charlie Brown', 'M', '1995-03-10',  'MI003', 'PA003', 'D003'),
    ('P004', 'Hypertension', 'Diana Miller', 'F', '1980-11-28',  'MI004', 'PA004', 'D004'),
    ('P005', 'Diabetes', 'Ethan Davis', 'M', '1976-09-17',  'MI005', 'PA005', 'D005'),
    ('P006', 'No known medical conditions', 'Fiona Wilson', 'F', '1988-07-03',  'MI006', 'PA006', 'D006'),
    ('P007', 'Allergic to peanuts', 'George Taylor', 'M', '1992-02-09',  'MI007', 'PA007', 'D007'),
    ('P008', 'Migraines', 'Hannah White', 'F', '1979-06-25',  'MI008', 'PA008', 'D008'),
    ('P009', 'High cholesterol', 'Ian Parker', 'M', '1983-12-14', 'MI009', 'PA009', 'D009'),
    ('P010', 'No known medical conditions', 'Jasmine Lee', 'F', '1998-04-18',  'MI010', 'PA010', 'D010');
SELECT * FROM patients;

sp_help 'patients';

CREATE TABLE proceduress (
    prcpt VARCHAR(30) PRIMARY KEY,
    PR_ID VARCHAR(30),
    PR_cost FLOAT,
    PR_Number INT,
    PR_time DATE,
    PR_date DATE,
    PR_Duration FLOAT,
    PR_Patient_name VARCHAR(50),
    PR_room INT,
    PR_NO VARCHAR(30),
    FOREIGN KEY (PR_NO) REFERENCES rooms (rno),
    FOREIGN KEY (PR_ID) REFERENCES Doctor (did)
);

INSERT INTO proceduress (prcpt, PR_ID, PR_cost, PR_Number, PR_time, PR_date, PR_Duration, PR_Patient_name, PR_room, PR_NO)
VALUES
    ('PCPT001', 'D001', 500.00, 101, '2023-01-15', '2023-01-15', 2.5, 'John Doe', 101, 'R101'),
    ('PCPT002', 'D002', 700.00, 102, '2023-02-01', '2023-02-01', 3.0, 'Jane Smith', 102, 'R102'),
    ('PCPT003', 'D003', 600.00, 103, '2023-03-10', '2023-03-10', 2.8, 'Bob Johnson', 103, 'R103'),
    ('PCPT004', 'D004', 800.00, 104, '2023-04-28', '2023-04-28', 3.5, 'Mary Davis', 104, 'R104'),
    ('PCPT005', 'D005', 900.00, 105, '2023-05-17', '2023-05-17', 4.0, 'Mike Brown', 105, 'R105'),
    ('PCPT006', 'D006', 1000.00, 106, '2023-06-03', '2023-06-03', 4.2, 'Sara Wilson', 106, 'R106'),
    ('PCPT007', 'D007', 1200.00, 107, '2023-07-09', '2023-07-09', 5.0, 'Chris White', 107, 'R107'),
    ('PCPT008', 'D008', 1100.00, 108, '2023-08-25', '2023-08-25', 4.8, 'David Miller', 108, 'R108'),
    ('PCPT009', 'D009', 950.00, 109, '2023-09-14', '2023-09-14', 4.5, 'Laura Lee', 109, 'R109'),
    ('PCPT010', 'D010', 850.00, 110, '2023-10-18', '2023-10-18', 4.2, 'Tom Parker', 110, 'R110');
SELECT * FROM proceduress;

sp_help 'proceduress';
CREATE TABLE patients_allergies (
    PApid VARCHAR(30),
    PAAllergies VARCHAR(30),
    PRIMARY KEY (PApid, PAAllergies),
    FOREIGN KEY (PApid) REFERENCES patients (Pid)
);
-- Inserting data into the patients_allergies table


INSERT INTO patients_allergies (PApid, PAAllergies)
VALUES
    ('P001', 'Penicillin'),
    ('P002', 'None'),
    ('P003', 'Dust'),
    ('P004', 'Pollen'),
    ('P005', 'Insulin'),
    ('P006', 'None'),
    ('P007', 'Peanuts'),
    ('P008', 'Aspirin'),
    ('P009', 'Statins'),
    ('P010', 'None');
SELECT * FROM patients_allergies;



sp_help 'patients_allergies';


CREATE TABLE patients_phone (
    Pppid VARCHAR(30),
    Ppphone VARCHAR(30),
    PRIMARY KEY (Pppid, Ppphone),
    FOREIGN KEY (Pppid) REFERENCES patients (Pid)
);

INSERT INTO patients_phone (Pppid, Ppphone)
VALUES
    ('P001', '123-456-7890'),
    ('P002', '987-654-3210'),
    ('P003', '555-123-4567'),
    ('P004', '888-555-1234'),
    ('P005', '777-888-9999'),
    ('P006', '111-222-3333'),
    ('P007', '444-555-6666'),
    ('P008', '666-777-8888'),
    ('P009', '333-444-5555'),
    ('P010', '000-111-2222');
SELECT * FROM patients_phone;


sp_help 'patients_phone';


CREATE TABLE patients_address (
    Papid VARCHAR(30),
    Paddress VARCHAR(30),
    PRIMARY KEY (Papid, Paddress),
    FOREIGN KEY (Papid) REFERENCES patients (Pid)
);
-- Inserting data into the patients_address table


INSERT INTO patients_address (Papid, Paddress)
VALUES
    ('P001', '123 Main Street, Cityville'),
    ('P002', '456 Oak Avenue, Townsville'),
    ('P003', '789 Pine Lane, Villagetown'),
    ('P004', '101 Maple Drive, Suburbia'),
    ('P005', '555 Cedar Street, Metropolis'),
    ('P006', '777 Elm Road, Hamlet'),
    ('P007', '999 Birch Avenue, Countryside'),
    ('P008', '222 Oak Lane, Riverside'),
    ('P009', '444 Pine Street, Lakeside'),
    ('P010', '666 Maple Drive, Mountainview');
SELECT * FROM patients_address;


sp_help 'patients_address';



CREATE TABLE insurance (
    ipid VARCHAR(30),
    ipolicynumber VARCHAR(30),
    ipatientname VARCHAR(30) NOT NULL,
    ipatientssn VARCHAR(30) NOT NULL UNIQUE,
    idscount INT,
    PRIMARY KEY (ipid, ipolicynumber),
    FOREIGN KEY (ipid) REFERENCES patients (Pid)
);

INSERT INTO insurance (ipid, ipolicynumber, ipatientname, ipatientssn, idscount)
VALUES
    ('P001', 'POL001', 'Alice Johnson', '123-45-6789', 3),
    ('P002', 'POL002', 'Bob Smith', '987-65-4321', 2),
    ('P003', 'POL003', 'Charlie Brown', '555-12-3456', 1),
    ('P004', 'POL004', 'Diana Miller', '888-55-1234', 4),
    ('P005', 'POL005', 'Ethan Davis', '777-88-9999', 2),
    ('P006', 'POL006', 'Fiona Wilson', '111-22-3333', 3),
    ('P007', 'POL007', 'George Taylor', '444-55-6666', 1),
    ('P008', 'POL008', 'Hannah White', '666-77-8888', 2),
    ('P009', 'POL009', 'Ian Parker', '333-44-5555', 3),
    ('P010', 'POL010', 'Jasmine Lee', '000-11-2222', 1);
SELECT * FROM insurance;


sp_help 'insurance';

CREATE TABLE MEDICAL_SUPPLIES (
    msid VARCHAR(30) PRIMARY KEY,
    msname VARCHAR(15) NOT NULL,
    mstotalamount INT NOT NULL,
    msconsupmtion VARCHAR(15) NOT NULL,
    msavailable VARCHAR(30) NOT NULL,
    msexpirydate DATE NOT NULL,
    mspcpt VARCHAR(30),
    msrno VARCHAR(30),
    FOREIGN KEY (mspcpt) REFERENCES proceduress (prcpt),
    FOREIGN KEY (msrno) REFERENCES rooms (rno)
);

INSERT INTO medical_supplies (msid, msname, mstotalamount, msconsupmtion, msavailable, msexpirydate, mspcpt, msrno)
VALUES
    ('MS001', 'Bandages', 500, '10 per day', 'Yes', '2024-01-01', 'PCPT001', 'R101'),
    ('MS002', 'Painkillers', 300, '5 per day', 'Yes', '2024-02-01', 'PCPT002', 'R102'),
    ('MS003', 'Antibiotics', 400, '8 per day', 'Yes', '2024-03-10', 'PCPT003', 'R103'),
    ('MS004', 'Gauze', 600, '12 per day', 'Yes', '2024-04-28', 'PCPT004', 'R104'),
    ('MS005', 'Syringes', 700, '15 per day', 'Yes', '2024-05-17', 'PCPT005', 'R105'),
    ('MS006', 'Surgical Gloves', 200, '4 per day', 'Yes', '2024-06-03', 'PCPT006', 'R106'),
    ('MS007', 'Disinfectant', 300, '6 per day', 'Yes', '2024-07-09', 'PCPT007', 'R107'),
    ('MS008', 'Scissors', 100, '2 per day', 'Yes', '2024-08-25', 'PCPT008', 'R108'),
    ('MS009', 'Plasters', 800, '16 per day', 'Yes', '2024-09-14', 'PCPT009', 'R109'),
    ('MS010', 'Tourniquet', 150, '3 per day', 'Yes', '2024-10-18', 'PCPT010', 'R110');
SELECT * FROM medical_supplies;


sp_help 'MEDICAL_SUPPLIES';

CREATE TABLE medical_wastes (
    mwcompanyname VARCHAR(30),
    mw_date DATE,
    mw_ms_id VARCHAR(30),
    PRIMARY KEY ( mwcompanyname , mw_ms_id ),
    FOREIGN KEY (mw_ms_id) REFERENCES Medical_Supplies (msid)
);

INSERT INTO medical_wastes (mwcompanyname, mw_date, mw_ms_id)
VALUES
    ('MedicalWasteCo1', '2023-01-15', 'MS001'),
    ('MedicalWasteCo2', '2023-02-01', 'MS002'),
    ('MedicalWasteCo3', '2023-03-10', 'MS003'),
    ('MedicalWasteCo4', '2023-04-28', 'MS004'),
    ('MedicalWasteCo5', '2023-05-17', 'MS005'),
    ('MedicalWasteCo6', '2023-06-03', 'MS006'),
    ('MedicalWasteCo7', '2023-07-09', 'MS007'),
    ('MedicalWasteCo8', '2023-08-25', 'MS008'),
    ('MedicalWasteCo9', '2023-09-14', 'MS009'),
    ('MedicalWasteCo10', '2023-10-18', 'MS010');

SELECT * FROM medical_wastes;


sp_help 'medical_wastes';

CREATE TABLE medicalwaste_phone (
    mp_mwcompanyname VARCHAR(30),
    mp_phone VARCHAR(30),
    PRIMARY KEY (mp_mwcompanyname, mp_phone),
    FOREIGN KEY (mp_mwcompanyname,mp_phone) REFERENCES medical_wastes (mwcompanyname, mw_ms_id)
);

INSERT INTO medicalwaste_phone (mp_mwcompanyname, mp_phone)
VALUES
    ('MedicalWasteCo1', '123-456-7890'),
    ('MedicalWasteCo2', '987-654-3210'),
    ('MedicalWasteCo3', '555-123-4567'),
    ('MedicalWasteCo4', '888-555-1234'),
    ('MedicalWasteCo5', '777-888-9999'),
    ('MedicalWasteCo6', '111-222-3333'),
    ('MedicalWasteCo7', '444-555-6666'),
    ('MedicalWasteCo8', '666-777-8888'),
    ('MedicalWasteCo9', '333-444-5555'),
    ('MedicalWasteCo10', '000-111-2222');
SELECT * FROM medicalwaste_phone;


sp_help 'medicalwaste_phone';


CREATE TABLE accumulated_by (
    a_mwcampanyname VARCHAR(30),
    ams_id VARCHAR(30),
    PRIMARY KEY (a_mwcampanyname, ams_id),
    FOREIGN KEY (a_mwcampanyname,ams_id) REFERENCES medical_wastes (mwcompanyname, mw_ms_id),
  
);

INSERT INTO accumulated_by (a_mwcampanyname, ams_id)
VALUES
    ('MedicalWasteCo1', 'MS001'),
    ('MedicalWasteCo2', 'MS002'),
    ('MedicalWasteCo3', 'MS003'),
    ('MedicalWasteCo4', 'MS004'),
    ('MedicalWasteCo5', 'MS005'),
    ('MedicalWasteCo6', 'MS006'),
    ('MedicalWasteCo7', 'MS007'),
    ('MedicalWasteCo8', 'MS008'),
    ('MedicalWasteCo9', 'MS009'),
    ('MedicalWasteCo10', 'MS010');
SELECT * FROM accumulated_by;

sp_help 'accumulated_by';



CREATE TABLE prepare (
    paid VARCHAR(30),
    prno VARCHAR(30),
    PRIMARY KEY (paid, prno),
    FOREIGN KEY (paid) REFERENCES paramedics (paid),
    FOREIGN KEY (prno) REFERENCES rooms (rno)
);

INSERT INTO prepare (paid, prno)
VALUES
    ('PA001', 'R101'),
    ('PA002', 'R102'),
    ('PA003', 'R103'),
    ('PA004', 'R104'),
    ('PA005', 'R105'),
    ('PA006', 'R106'),
    ('PA007', 'R107'),
    ('PA008', 'R108'),
    ('PA009', 'R109'),
    ('PA010', 'R110');
SELECT * FROM prepare;

sp_help 'prepare';




CREATE TABLE Doctor_Address (
    dadid VARCHAR(30),
    daaddress VARCHAR(30),
    PRIMARY KEY (dadid, daaddress),
    FOREIGN KEY (dadid) REFERENCES Doctor (did)
);

INSERT INTO Doctor_Address (dadid, daaddress)
VALUES
    ('D001', '123 Main Street, Cityville'),
    ('D002', '456 Oak Avenue, Townsville'),
    ('D003', '789 Pine Lane, Villagetown'),
    ('D004', '101 Maple Drive, Suburbia'),
    ('D005', '555 Cedar Street, Metropolis'),
    ('D006', '777 Elm Road, Hamlet'),
    ('D007', '999 Birch Avenue, Countryside'),
    ('D008', '222 Oak Lane, Riverside'),
    ('D009', '444 Pine Street, Lakeside'),
    ('D010', '666 Maple Drive, Mountainview');
SELECT * FROM Doctor_Address;

sp_help 'Doctor_Address';

CREATE TABLE Doctor_Phone (
    dpdid VARCHAR(30),
    dpphone VARCHAR(30),
    PRIMARY KEY (dpdid, dpphone),
    FOREIGN KEY (dpdid) REFERENCES Doctor (did)
);
-- Inserting data into the Doctor_Phone table
INSERT INTO Doctor_Phone (dpdid, dpphone)
VALUES
    ('D001', '123-456-7890'),
    ('D002', '987-654-3210'),
    ('D003', '555-123-4567'),
    ('D004', '888-555-1234'),
    ('D005', '777-888-9999'),
    ('D006', '111-222-3333'),
    ('D007', '444-555-6666'),
    ('D008', '666-777-8888'),
    ('D009', '333-444-5555'),
    ('D010', '000-111-2222');
SELECT * FROM Doctor_Phone;


sp_help 'Doctor_Phone';



CREATE TABLE Paramedic_Skills (
    pspaid VARCHAR(30),
    paskills VARCHAR(500) NOT NULL,
    PRIMARY KEY (paskills, pspaid),
    FOREIGN KEY (pspaid) REFERENCES paramedics (paid)
);

INSERT INTO Paramedic_Skills (pspaid, paskills)
VALUES
    ('PA001', 'Emergency First Aid, CPR, Patient Assessment'),
    ('PA002', 'Cardiac Monitoring, ECG Interpretation, Medication Administration'),
    ('PA003', 'Orthopedic Assessment, Casting, Splinting'),
    ('PA004', 'Dermatological Procedures, Minor Surgeries'),
    ('PA005', 'Pediatric Assessment, Vaccination Administration'),
    ('PA006', 'Emergency First Aid, CPR, Patient Assessment'),
    ('PA007', 'Cardiac Monitoring, ECG Interpretation, Medication Administration'),
    ('PA008', 'Orthopedic Assessment, Casting, Splinting'),
    ('PA009', 'Dermatological Procedures, Minor Surgeries'),
    ('PA010', 'Pediatric Assessment, Vaccination Administration');
SELECT * FROM Paramedic_Skills;

sp_help 'Paramedic_Skills';

CREATE TABLE Paramedic_Phone (
    pppaid VARCHAR(30),
    paphone INT NOT NULL,
    PRIMARY KEY (pppaid, paphone),
    FOREIGN KEY (pppaid) REFERENCES paramedics (paid)
);

-- Inserting data into the Paramedic_Phone table
INSERT INTO Paramedic_Phone (pppaid, paphone)
VALUES
    ('PA001', 123890),
    ('PA002', 643210),
    ('PA003', 534567),
    ('PA004', 851234),
    ('PA005', 79999),
    ('PA006', 123333),
    ('PA007', 55666),
    ('PA008', 78888),
    ('PA009', 33555),
    ('PA010', 01222);


SELECT * FROM Paramedic_Phone;

sp_help 'Paramedic_Phone';
CREATE TABLE Paramedic_Qualification (
    pqpaid VARCHAR(30),
    PaQualifications VARCHAR(200) NOT NULL,
    PRIMARY KEY (PaQualifications, pqpaid),
    FOREIGN KEY (pqpaid) REFERENCES paramedics (paid)
);

INSERT INTO Paramedic_Qualification (pqpaid, PaQualifications)
VALUES
    ('PAID001', 'Emergency Medical Technician Certification'),
    ('PAID002', 'Paramedic Certification'),
    ('PAID003', 'Advanced Cardiovascular Life Support (ACLS)'),
    ('PAID004', 'Pediatric Advanced Life Support (PALS)'),
    ('PAID005', 'Trauma Nursing Core Course (TNCC)'),
    ('PAID006', 'Certified Flight Paramedic (FP-C)'),
    ('PAID007', 'Critical Care Paramedic (CCP-C)'),
    ('PAID008', 'Neonatal Resuscitation Program (NRP)'),
    ('PAID009', 'Geriatric Emergency Medical Services (GEMS)'),
    ('PAID010', 'Pre-Hospital Trauma Life Support (PHTLS)');


SELECT * FROM Paramedic_Qualification;

sp_help 'Paramedic_Qualification';

CREATE TABLE Steralize (
    spaid VARCHAR(30),
    SeSerialNumber INT NOT NULL,
    PRIMARY KEY (spaid, SeSerialNumber),
    FOREIGN KEY (spaid) REFERENCES paramedics (paid)
);

-- Inserting data into the Steralize table
INSERT INTO Steralize (spaid, SeSerialNumber)
VALUES
    ('PA001', 1001),
    ('PA002', 1002),
    ('PA003', 1003),
    ('PA004', 1004),
    ('PA005', 1005),
    ('PA006', 1006),
    ('PA007', 1007),
    ('PA008', 1008),
    ('PA009', 1009),
    ('PA010', 1010);
SELECT * FROM Steralize;

sp_help 'Steralize';



CREATE TABLE Procedures_equipment (
    Pe_PCPT VARCHAR(30),
    Pe_equipment VARCHAR(300),
    PRIMARY KEY (Pe_PCPT, Pe_equipment),
    FOREIGN KEY (Pe_PCPT) REFERENCES proceduress (prcpt)
);


INSERT INTO Procedures_equipment (Pe_PCPT, Pe_equipment)
VALUES
    ('PCPT001', 'Stethoscope, Blood Pressure Cuff, Thermometer'),
    ('PCPT002', 'Electrocardiogram Machine, Medication Dispenser'),
    ('PCPT003', 'Orthopedic Tools, Casting Materials'),
    ('PCPT004', 'Dermatology Kit, Minor Surgery Instruments'),
    ('PCPT005', 'Pediatric Examination Set, Vaccination Supplies'),
    ('PCPT006', 'Stethoscope, Blood Pressure Cuff, Thermometer'),
    ('PCPT007', 'Electrocardiogram Machine, Medication Dispenser'),
    ('PCPT008', 'Orthopedic Tools, Casting Materials'),
    ('PCPT009', 'Dermatology Kit, Minor Surgery Instruments'),
    ('PCPT010', 'Pediatric Examination Set, Vaccination Supplies');
SELECT * FROM Procedures_equipment;

sp_help 'Procedures_equipment';

CREATE TABLE Procedures_supplies (
    Ps_PCPT VARCHAR(30),
    PsMedical_supplies VARCHAR(300),
    PRIMARY KEY (Ps_PCPT, PsMedical_supplies),
    FOREIGN KEY (Ps_PCPT) REFERENCES proceduress (prcpt)
);

INSERT INTO Procedures_supplies (Ps_PCPT, PsMedical_supplies)
VALUES
    ('PCPT001', 'Bandages, Gauze, Disinfectant'),
    ('PCPT002', 'Painkillers, Surgical Gloves, Syringes'),
    ('PCPT003', 'Orthopedic Braces, Cast Padding, Splints'),
    ('PCPT004', 'Dermatology Creams, Sutures, Sterile Drapes'),
    ('PCPT005', 'Pediatric Vaccines, Needles, Cotton Swabs'),
    ('PCPT006', 'Bandages, Gauze, Disinfectant'),
    ('PCPT007', 'Painkillers, Surgical Gloves, Syringes'),
    ('PCPT008', 'Orthopedic Braces, Cast Padding, Splints'),
    ('PCPT009', 'Dermatology Creams, Sutures, Sterile Drapes'),
    ('PCPT010', 'Pediatric Vaccines, Needles, Cotton Swabs');
SELECT * FROM Procedures_supplies;

sp_help 'Procedures_supplies';

CREATE TABLE Procedures_Paramedics (
    Pp_PCPT VARCHAR(30),
    PpParamedics_name VARCHAR(300),
    PRIMARY KEY (Pp_PCPT, PpParamedics_name),
    FOREIGN KEY (Pp_PCPT) REFERENCES proceduress (prcpt)
);


INSERT INTO Procedures_Paramedics (Pp_PCPT, PpParamedics_name)
VALUES
    ('PCPT001', 'Paramedic One, Paramedic Two'),
    ('PCPT002', 'Paramedic Three, Paramedic Four'),
    ('PCPT003', 'Paramedic Five, Paramedic Six'),
    ('PCPT004', 'Paramedic Seven, Paramedic Eight'),
    ('PCPT005', 'Paramedic Nine, Paramedic Ten'),
    ('PCPT006', 'Paramedic One, Paramedic Two'),
    ('PCPT007', 'Paramedic Three, Paramedic Four'),
    ('PCPT008', 'Paramedic Five, Paramedic Six'),
    ('PCPT009', 'Paramedic Seven, Paramedic Eight'),
    ('PCPT010', 'Paramedic Nine, Paramedic Ten');


SELECT * FROM Procedures_Paramedics;

sp_help 'Procedures_Paramedics';

CREATE TABLE helpin (
    HpCpt VARCHAR(30),
    HpaId VARCHAR(30),
    PRIMARY KEY (HpaId, HpCpt),
    FOREIGN KEY (HpCpt) REFERENCES proceduress (prcpt),
    FOREIGN KEY (HpaId) REFERENCES paramedics (paid)
);


INSERT INTO helpin (HpCpt, HpaId)
VALUES
    ('PCPT001', 'PA001'),
    ('PCPT002', 'PA002'),
    ('PCPT003', 'PA003'),
    ('PCPT004', 'PA004'),
    ('PCPT005', 'PA005'),
    ('PCPT006', 'PA006'),
    ('PCPT007', 'PA007'),
    ('PCPT008', 'PA008'),
    ('PCPT009', 'PA009'),
    ('PCPT010', 'PA010');


SELECT * FROM helpin;

sp_help 'helpin';



CREATE TABLE Investigation_Radiology (
    IR_MI_patient_id VARCHAR(30),
    IRmedical_Radiology VARCHAR(30),
    PRIMARY KEY (IRmedical_Radiology, IR_MI_patient_id),
    FOREIGN KEY (IR_MI_patient_id) REFERENCES Medical_Investigations (mipatientid)
);

INSERT INTO Investigation_Radiology (IR_MI_patient_id, IRmedical_Radiology)
VALUES
    ('MI001', 'X-Ray Image001'),
    ('MI002', 'CT Scan Image002'),
    ('MI003', 'MRI Scan Image003'),
    ('MI004', 'Dermatology Image004'),
    ('MI005', 'Pediatric X-Ray Image005'),
    ('MI006', 'X-Ray Image006'),
    ('MI007', 'CT Scan Image007'),
    ('MI008', 'MRI Scan Image008'),
    ('MI009', 'Dermatology Image009'),
    ('MI010', 'Pediatric X-Ray Image010');
SELECT * FROM Investigation_Radiology;

sp_help 'Investigation_Radiology';

CREATE TABLE Investigation_medications (
    Im_MI_patient_id VARCHAR(30),
    Im_medications VARCHAR(300),
    PRIMARY KEY (Im_medications, Im_MI_patient_id),
    FOREIGN KEY (Im_MI_patient_id) REFERENCES Medical_Investigations (mipatientid)
);


INSERT INTO Investigation_medications (Im_MI_patient_id, Im_medications)
VALUES
    ('MI001', 'Aspirin, Antibiotics'),
    ('MI002', 'Painkillers, Antacids'),
    ('MI003', 'Anti-inflammatory Drugs, Painkillers'),
    ('MI004', 'Topical Cream, Antibiotics'),
    ('MI005', 'Pediatric Vitamins, Cough Syrup'),
    ('MI006', 'Aspirin, Antibiotics'),
    ('MI007', 'Painkillers, Antacids'),
    ('MI008', 'Anti-inflammatory Drugs, Painkillers'),
    ('MI009', 'Topical Cream, Antibiotics'),
    ('MI010', 'Pediatric Vitamins, Cough Syrup');
SELECT * FROM Investigation_medications;

sp_help 'Investigation_medications';

CREATE TABLE Investigation_Lab (
    IL_MI_patient_id VARCHAR(30),
    IL_medical_lab_analysis VARCHAR(300),
    PRIMARY KEY (IL_medical_lab_analysis, IL_MI_patient_id),
    FOREIGN KEY (IL_MI_patient_id) REFERENCES Medical_Investigations (mipatientid)
);

INSERT INTO Investigation_Lab (IL_MI_patient_id, IL_medical_lab_analysis)
VALUES
    ('MI001', 'Blood Count, Lipid Panel'),
    ('MI002', 'Urinalysis, Blood Glucose Test'),
    ('MI003', 'Complete Blood Count, Thyroid Function Test'),
    ('MI004', 'Skin Biopsy, Allergy Test'),
    ('MI005', 'Pediatric Blood Count, Respiratory Panel'),
    ('MI006', 'Blood Count, Lipid Panel'),
    ('MI007', 'Urinalysis, Blood Glucose Test'),
    ('MI008', 'Complete Blood Count, Thyroid Function Test'),
    ('MI009', 'Skin Biopsy, Allergy Test'),
    ('MI010', 'Pediatric Blood Count, Respiratory Panel');


SELECT * FROM Investigation_Lab;

sp_help 'Investigation_Lab';

CREATE TABLE suppliers (
    sname VARCHAR(30),
    smsid VARCHAR(30),
    sphone INT,
    semail VARCHAR(50) NOT NULL,
    saddress VARCHAR(15),
    PRIMARY KEY (sname, smsid),
    FOREIGN KEY (smsid) REFERENCES MEDICAL_SUPPLIES (msid)
);

INSERT INTO suppliers (sname, smsid, sphone, semail, saddress)
VALUES
    ('Supplier1', 'MS001', 123490, 'supplier1@example.com', 'Address1'),
    ('Supplier2', 'MS002', 98710, 'supplier2@example.com', 'Address2'),
    ('Supplier3', 'MS003', 54567, 'supplier3@example.com', 'Address3'),
    ('Supplier4', 'MS004', 88234, 'supplier4@example.com', 'Address4'),
    ('Supplier5', 'MS005', 7999, 'supplier5@example.com', 'Address5'),
    ('Supplier6', 'MS006', 1133, 'supplier6@example.com', 'Address6'),
    ('Supplier7', 'MS007', 46666, 'supplier7@example.com', 'Address7'),
    ('Supplier8', 'MS008', 6888, 'supplier8@example.com', 'Address8'),
    ('Supplier9', 'MS009', 3555, 'supplier9@example.com', 'Address9'),
    ('Supplier10', 'MS010', 000112, 'supplier10@example.com', 'Address10');
SELECT * FROM suppliers;

sp_help 'suppliers';

CREATE TABLE equipment (
    etype VARCHAR(50) NOT NULL,
    eamount INT,
    eserialnumber VARCHAR(30) PRIMARY KEY,
    elastmasintennancedate VARCHAR(15),
    esteriliztaion VARCHAR(15),
    erno VARCHAR(30),
    FOREIGN KEY (erno) REFERENCES rooms (rno)
);

INSERT INTO equipment (etype, eamount, eserialnumber, elastmasintennancedate, esteriliztaion, erno)
VALUES
    ('X-Ray Machine', 2, 'EQ001', '2023-01-10', 'Yes', 'R101'),
    ('MRI Scanner', 1, 'EQ002', '2023-02-15', 'No', 'R102'),
    ('Ultrasound Device', 3, 'EQ003', '2023-03-20', 'Yes', 'R103'),
    ('Blood Pressure Monitor', 5, 'EQ004', '2023-04-25', 'No', 'R104'),
    ('Surgical Tools Set', 4, 'EQ005', '2023-05-30', 'Yes', 'R105'),
    ('Orthopedic Instruments', 2, 'EQ006', '2023-06-05', 'No', 'R106'),
    ('Dermatology Kit', 1, 'EQ007', '2023-07-10', 'Yes', 'R107'),
    ('Pediatric Examination Set', 3, 'EQ008', '2023-08-15', 'No', 'R108'),
    ('Cardiology Equipment', 2, 'EQ009', '2023-09-20', 'Yes', 'R109'),
    ('ENT Instruments', 1, 'EQ010', '2023-10-25', 'No', 'R110');
SELECT * FROM equipment;

sp_help 'equipment';

CREATE TABLE uses (
    uprcpt VARCHAR(30),
    ueserialno VARCHAR(30),
    PRIMARY KEY (uprcpt, ueserialno),
    FOREIGN KEY (uprcpt) REFERENCES proceduress (prcpt),
    FOREIGN KEY (ueserialno) REFERENCES equipment (eserialnumber)
);


INSERT INTO uses (uprcpt, ueserialno)
VALUES
    ('PCPT001', 'EQ001'),
    ('PCPT002', 'EQ002'),
    ('PCPT003', 'EQ003'),
    ('PCPT004', 'EQ004'),
    ('PCPT005', 'EQ005'),
    ('PCPT006', 'EQ006'),
    ('PCPT007', 'EQ007'),
    ('PCPT008', 'EQ008'),
    ('PCPT009', 'EQ009'),
    ('PCPT010', 'EQ010');

SELECT * FROM uses;

sp_help 'uses';







-- Update dpphone for a specific record
UPDATE Doctor_Phone
SET dpphone = '123-456-5555'
WHERE dpdid = 'D001' AND dpphone = '123-456-7890';

-- Delete all records for a specific dpdid
DELETE FROM Doctor_Phone
WHERE dpdid = 'D001';

-- Delete a specific record based on dpdid and dpphone
DELETE FROM Doctor_Phone
WHERE dpdid = 'existing_dpdid' AND dpphone = 'existing_phone';





-- Update SeSerialNumber for a specific record
UPDATE Steralize
SET SeSerialNumber = '555555'
WHERE spaid = 'PA001' AND SeSerialNumber = '1001';

-- Delete a specific record based on spaid and SeSerialNumber
DELETE FROM Steralize
WHERE spaid = 'existing_spaid' AND SeSerialNumber = 'existing_SerialNumber';
