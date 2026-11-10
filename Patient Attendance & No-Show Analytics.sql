-- ========================================================
-- PROJECT: Patient Attendance & No-Show Analytics
-- DATABASE: Healthcare_Analysis
-- PURPOSE: Data Transformation, Cleaning, and View Creation
-- ========================================================

CREATE DATABASE Healthcare_Analysis;
GO

USE Healthcare_Analysis;
GO

-- Displaying raw staging data
SELECT * FROM [No_Show Appointments];
GO

-- Final Optimized View Definition for Power BI Integration
ALTER VIEW vw_MedicalAppointments AS
WITH CleanedData AS (
    SELECT 
        -- 1. Safely convert PatientId from VARCHAR to BIGINT
        TRY_CAST(PatientId AS BIGINT) AS PatientID,
        TRY_CAST(AppointmentID AS INT) AS AppointmentID,
        Gender,
        
        -- 2. Standardize Date/Time formats for temporal calculations
        CAST(ScheduledDay AS DATETIME2) AS ScheduledDateTime,
        CAST(AppointmentDay AS DATETIME2) AS AppointmentDate,
        
        -- 3. Eliminate data anomalies by resolving negative age entries to 0
        CASE 
            WHEN TRY_CAST(Age AS INT) < 0 THEN 0 
            ELSE TRY_CAST(Age AS INT) 
        END AS CleanedAge,
        
        Neighbourhood,
        TRY_CAST(Scholarship AS BIT) AS IsScholarship,
        TRY_CAST(Hipertension AS BIT) AS IsHypertensive,
        TRY_CAST(Diabetes AS BIT) AS IsDiabetic,
        TRY_CAST(Alcoholism AS BIT) AS IsAlcoholic,
        TRY_CAST(Handcap AS INT) AS HandicapLevel,
        TRY_CAST(SMS_received AS INT) AS SMSReceived,
        
        -- 4. Convert 'Yes'/'No' text dimensions into clean binary flags (1 = Missed, 0 = Attended)
        CASE 
            WHEN [No_show] = 'Yes' THEN 1 
            ELSE 0 
        END AS IsNoShow
    FROM [dbo].[No_Show Appointments]
)
SELECT 
    PatientID,
    AppointmentID,
    Gender,
    ScheduledDateTime,
    AppointmentDate,
    CleanedAge AS Age, -- Maps to DAX measures
    
    -- 5. Linear demographic categories used for dashboard reporting paths
    CASE 
        WHEN CleanedAge <= 19 THEN 'Teen'
        WHEN CleanedAge BETWEEN 20 AND 39 THEN 'Young Adult'
        WHEN CleanedAge BETWEEN 40 AND 64 THEN 'Adult'
        ELSE 'Senior'
    END AS AgeGroup,
    
    -- 6. Sequential sorting column to override default alphabetical matrix ordering in visuals
    CASE 
        WHEN CleanedAge <= 19 THEN 1
        WHEN CleanedAge BETWEEN 20 AND 39 THEN 2
        WHEN CleanedAge BETWEEN 40 AND 64 THEN 3
        ELSE 4
    END AS AgeGroupSort,

    Neighbourhood,
    IsScholarship,
    IsHypertensive,
    IsDiabetic,
    IsAlcoholic,
    HandicapLevel,
    SMSReceived,
    IsNoShow
FROM CleanedData;
GO

-- Verify view deployment output
SELECT * FROM vw_MedicalAppointments;
GO
