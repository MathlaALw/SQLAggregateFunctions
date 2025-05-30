-- Topics:
-- 1. UNION / UNION ALL
-- 2. DROP vs DELETE vs TRUNCATE
-- 3. Subqueries (exploratory task  they search and try it)
-- 4. Transaction & Batch Script (exploratory and guided)
-- 5. *Hands-on comparison with real effect on data
-- Practice Scenario: Training & Job Application System
-- Your institute is managing two main datasets:
--  Trainees: People who complete training at your institute.
--  Job Applicants: External applicants who apply directly to job posts.
-- Your goal is to:
--  Compare the data of both groups.
--  Clean or restructure the database safely.
--  Explore more advanced SQL topics on your own (subqueries, transactions).-- create database Create database SubqueryUnionTask;use SubqueryUnionTask-- Tables

-- Trainees Table
CREATE TABLE Trainees (
 TraineeID INT PRIMARY KEY,
 FullName VARCHAR(100),
 Email VARCHAR(100),
 Program VARCHAR(50),
 GraduationDate DATE
);
-- Job Applicants Table
CREATE TABLE Applicants (
 ApplicantID INT PRIMARY KEY,
 FullName VARCHAR(100),
 Email VARCHAR(100),
 Source VARCHAR(20), -- e.g., "Website", "Referral"
 AppliedDate DATE
);--------------------------- Sample Data
-- Insert into Trainees
INSERT INTO Trainees VALUES
(1, 'Layla Al Riyami', 'layla.r@example.com', 'Full Stack .NET', '2025-04-30'),
(2, 'Salim Al Hinai', 'salim.h@example.com', 'Outsystems', '2025-03-15'),
(3, 'Fatma Al Amri', 'fatma.a@example.com', 'Database Admin', '2025-05-01');
-- Insert into Applicants
INSERT INTO Applicants VALUES
(101, 'Hassan Al Lawati', 'hassan.l@example.com', 'Website', '2025-05-02'),
(102, 'Layla Al Riyami', 'layla.r@example.com', 'Referral', '2025-05-05'), -- same person as trainee
(103, 'Aisha Al Farsi', 'aisha.f@example.com', 'Website', '2025-04-28');

-----
select * from Applicants
select * from Trainees
-- Part 1: UNION Practice
-- 1. List all unique people who either trained or applied for a job.
-- o Show their full names and emails.
-- o Use UNION (not UNION ALL) to avoid duplicates.
SELECT FullName, Email FROM Trainees
UNION
SELECT FullName, Email FROM Applicants;

-- 2. Now use UNION ALL. What changes in the result?
-- o Explain why one name appears twice.
SELECT FullName, Email FROM Trainees
UNION ALL
SELECT FullName, Email FROM Applicants;

 -- Layla Al Riyami appears twice in UNION ALL because she is in both tables.-- 
 --  UNION removes duplicates; UNION ALL includes all records.-- 


-- 3. Find people who are in both tables.
-- o You must use INTERSECT if supported, or simulate it using INNER JOIN on Email.

SELECT T.FullName, T.Email
FROM Trainees T
INNER JOIN Applicants A ON T.Email = A.Email;




-- Part 2: DROP, DELETE, TRUNCATE Observation
-- Lets test destructive commands.
-- Write your observations after each command.


-- 4. Try DELETE FROM Trainees WHERE Program = 'Outsystems'.
-- o Check if the table structure still exists.
DELETE FROM Trainees WHERE Program = 'Outsystems';

-- Observation: Row deleted, but table and other data remain.

-- 5. Try TRUNCATE TABLE Applicants.
-- o What happens to the data? Can you roll it back?
TRUNCATE TABLE Applicants;

-- Observation: All rows removed quickly. Cannot roll back in most DBs (non-logged operation).

-- 6. Try DROP TABLE Applicants.
-- o What happens if you run a SELECT after that?
DROP TABLE Applicants;
-- Observation: Table is permanently removed. SELECT after DROP gives an error.
-- Example:
-- SELECT * FROM Applicants; -- Will fail

