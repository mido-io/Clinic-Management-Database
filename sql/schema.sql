-- Creating tables for hospital database
-- Order ensures foreign key dependencies are satisfied

CREATE TABLE Doctor (
    did VARCHAR(30) PRIMARY KEY,
    dname VARCHAR(40),
    demail VARCHAR(60),
    dsalary INT,
    dexperience VARCHAR(500),
    dstartDate DATE,
    dendDate DATE
);

CREATE TABLE rooms (
    rno VARCHAR(30),
    rcapacity INT,
    rtype VARCHAR(30) NOT NULL,
    rcontent VARCHAR(30) NOT NULL,
    rfloor VARCHAR(30),
    PRIMARY KEY (rno)
);

CREATE TABLE paramedics (
    paid VARCHAR(30) PRIMARY KEY,
    pdid VARCHAR(30),
    pstartdate DATE,
    ppaendtdate DATE,
    pasalary INT,
    passn INT,
    paexperiance VARCHAR(500),
    paroom VARCHAR(30),
    paprocedure VARCHAR(40),
    paemail VARCHAR(50),
    paramedic_name VARCHAR(60),
    pagender VARCHAR(6),
    FOREIGN KEY (pdid) REFERENCES Doctor (did),
    FOREIGN KEY (paroom) REFERENCES rooms (rno)
);

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

CREATE TABLE Medical_Investigations (
    mipatientid VARCHAR(30) PRIMARY KEY,
    MI_D_Id VARCHAR(30),
    MI_Diagnosis VARCHAR(300),
    MI_patient_name VARCHAR(50),
    MI_A_Patient_id VARCHAR(30),
    FOREIGN KEY (MI_D_Id) REFERENCES doctor (did),
    FOREIGN KEY (MI_A_Patient_id) REFERENCES appointments (apatientid)
);

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

CREATE TABLE patients_allergies (
    PApid VARCHAR(30),
    PAAllergies VARCHAR(30),
    PRIMARY KEY (PApid, PAAllergies),
    FOREIGN KEY (PApid) REFERENCES patients (Pid)
);

CREATE TABLE patients_phone (
    Pppid VARCHAR(30),
    Ppphone VARCHAR(15),
    PRIMARY KEY (Pppid, Ppphone),
    FOREIGN KEY (Pppid) REFERENCES patients (Pid)
);

CREATE TABLE patients_address (
    Papid VARCHAR(30),
    Paddress VARCHAR(30),
    PRIMARY KEY (Papid, Paddress),
    FOREIGN KEY (Papid) REFERENCES patients (Pid)
);

CREATE TABLE insurance (
    ipid VARCHAR(30),
    ipolicynumber VARCHAR(30),
    ipatientname VARCHAR(30) NOT NULL,
    ipatientssn VARCHAR(30) NOT NULL UNIQUE,
    idscount INT,
    PRIMARY KEY (ipid, ipolicynumber),
    FOREIGN KEY (ipid) REFERENCES patients (Pid)
);

CREATE TABLE medical_supplies (
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

CREATE TABLE medical_wastes (
    mwcompanyname VARCHAR(30),
    mw_date DATE,
    mw_ms_id VARCHAR(30),
    PRIMARY KEY (mwcompanyname, mw_ms_id),
    FOREIGN KEY (mw_ms_id) REFERENCES medical_supplies (msid)
);

CREATE TABLE medicalwaste_phone (
    mp_mwcompanyname VARCHAR(30),
    mp_phone VARCHAR(15),
    PRIMARY KEY (mp_mwcompanyname, mp_phone)
);

CREATE TABLE accumulated_by (
    a_mwcampanyname VARCHAR(30),
    ams_id VARCHAR(30),
    PRIMARY KEY (a_mwcampanyname, ams_id)
);

CREATE TABLE prepare (
    paid VARCHAR(30),
    prno VARCHAR(30),
    PRIMARY KEY (paid, prno),
    FOREIGN KEY (paid) REFERENCES paramedics (paid),
    FOREIGN KEY (prno) REFERENCES rooms (rno)
);

CREATE TABLE Doctor_Address (
    dadid VARCHAR(30),
    daaddress VARCHAR(30),
    PRIMARY KEY (dadid, daaddress),
    FOREIGN KEY (dadid) REFERENCES Doctor (did)
);

CREATE TABLE Doctor_Phone (
    dpdid VARCHAR(30),
    dpphone VARCHAR(15),
    PRIMARY KEY (dpdid, dpphone),
    FOREIGN KEY (dpdid) REFERENCES Doctor (did)
);

CREATE TABLE Paramedic_Skills (
    pspaid VARCHAR(30),
    paskills VARCHAR(500) NOT NULL,
    PRIMARY KEY (paskills, pspaid),
    FOREIGN KEY (pspaid) REFERENCES paramedics (paid)
);

CREATE TABLE Paramedic_Phone (
    pppaid VARCHAR(30),
    paphone VARCHAR(15) NOT NULL,
    PRIMARY KEY (pppaid, paphone),
    FOREIGN KEY (pppaid) REFERENCES paramedics (paid)
);

CREATE TABLE Paramedic_Qualification (
    pqpaid VARCHAR(30),
    PaQualifications VARCHAR(200) NOT NULL,
    PRIMARY KEY (PaQualifications, pqpaid),
    FOREIGN KEY (pqpaid) REFERENCES paramedics (paid)
);

CREATE TABLE Steralize (
    spaid VARCHAR(30),
    SeSerialNumber INT NOT NULL,
    PRIMARY KEY (spaid, SeSerialNumber),
    FOREIGN KEY (spaid) REFERENCES paramedics (paid)
);

CREATE TABLE Procedures_equipment (
    Pe_PCPT VARCHAR(30),
    Pe_equipment VARCHAR(300),
    PRIMARY KEY (Pe_PCPT, Pe_equipment),
    FOREIGN KEY (Pe_PCPT) REFERENCES proceduress (prcpt)
);

CREATE TABLE Procedures_supplies (
    Ps_PCPT VARCHAR(30),
    PsMedical_supplies VARCHAR(300),
    PRIMARY KEY (Ps_PCPT, PsMedical_supplies),
    FOREIGN KEY (Ps_PCPT) REFERENCES proceduress (prcpt)
);

CREATE TABLE Procedures_Paramedics (
    Pp_PCPT VARCHAR(30),
    PpParamedics_name VARCHAR(300),
    PRIMARY KEY (Pp_PCPT, PpParamedics_name),
    FOREIGN KEY (Pp_PCPT) REFERENCES proceduress (prcpt)
);

CREATE TABLE helpin (
    HpCpt VARCHAR(30),
    HpaId VARCHAR(30),
    PRIMARY KEY (HpaId, HpCpt),
    FOREIGN KEY (HpCpt) REFERENCES proceduress (prcpt),
    FOREIGN KEY (HpaId) REFERENCES paramedics (paid)
);

CREATE TABLE Investigation_Radiology (
    IR_MI_patient_id VARCHAR(30),
    IRmedical_Radiology VARCHAR(30),
    PRIMARY KEY (IRmedical_Radiology, IR_MI_patient_id),
    FOREIGN KEY (IR_MI_patient_id) REFERENCES Medical_Investigations (mipatientid)
);

CREATE TABLE Investigation_medications (
    Im_MI_patient_id VARCHAR(30),
    Im_medications VARCHAR(300),
    PRIMARY KEY (Im_medications, Im_MI_patient_id),
    FOREIGN KEY (Im_MI_patient_id) REFERENCES Medical_Investigations (mipatientid)
);

CREATE TABLE Investigation_Lab (
    IL_MI_patient_id VARCHAR(30),
    IL_medical_lab_analysis VARCHAR(300),
    PRIMARY KEY (IL_medical_lab_analysis, IL_MI_patient_id),
    FOREIGN KEY (IL_MI_patient_id) REFERENCES Medical_Investigations (mipatientid)
);

CREATE TABLE suppliers (
    sname VARCHAR(30),
    smsid VARCHAR(30),
    sphone VARCHAR(15),
    semail VARCHAR(50) NOT NULL,
    saddress VARCHAR(15),
    PRIMARY KEY (sname, smsid),
    FOREIGN KEY (smsid) REFERENCES medical_supplies (msid)
);

CREATE TABLE equipment (
    etype VARCHAR(50) NOT NULL,
    eamount INT,
    eserialnumber VARCHAR(30) PRIMARY KEY,
    elastmaintenancedate VARCHAR(15),
    esterilization VARCHAR(15),
    erno VARCHAR(30),
    FOREIGN KEY (erno) REFERENCES rooms (rno)
);

CREATE TABLE uses (
    uprcpt VARCHAR(30),
    ueserialno VARCHAR(30),
    PRIMARY KEY (uprcpt, ueserialno),
    FOREIGN KEY (uprcpt) REFERENCES proceduress (prcpt),
    FOREIGN KEY (ueserialno) REFERENCES equipment (eserialnumber)
);