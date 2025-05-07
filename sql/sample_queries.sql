-- Sample queries for hospital database reports

-- Query 1: List all appointments for a specific doctor
SELECT a.ano, a.apatientname, a.adate, a.atime, a.atype
FROM appointments a
WHERE a.adid = 'D001';

-- Query 2: Find patients with specific allergies
SELECT p.Pname, pa.PAAllergies
FROM patients p
JOIN patients_allergies pa ON p.Pid = pa.PApid
WHERE pa.PAAllergies = 'Penicillin';

-- Query 3: Calculate total bills per patient
SELECT b.bpatient_name, SUM(b.btotal_amount) AS total_spent
FROM bills b
GROUP BY b.bpatient_name;

-- Query 4: List expired medical supplies
SELECT msname, msexpirydate
FROM medical_supplies
WHERE msexpirydate < '2025-05-07';  -- Current date as of May 07, 2025

-- Query 5: Show procedures with their costs and rooms
SELECT p.prcpt, p.PR_cost, r.rno, r.rtype
FROM proceduress p
JOIN rooms r ON p.PR_NO = r.rno;

-- Query 6: List paramedics with their qualifications
SELECT p.paramedic_name, pq.PaQualifications
FROM paramedics p
JOIN Paramedic_Qualification pq ON p.paid = pq.pqpaid;

-- Query 7: Find equipment due for maintenance
SELECT etype, eserialnumber, elastmaintenancedate
FROM equipment
WHERE elastmaintenancedate < '2023-12-31';