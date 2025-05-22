# Real-Life Use Case: Movie Streaming Platform Analytics 
 ```sql
-- Movie Streaming Platform Analytics -- 

-- Schema
-- Create Database
create database MovieStreamingPlatform
-- use Database

use MovieStreamingPlatform ;

-- Create tables

create table Users(
UserID INT PRIMARY KEY,
FullName VARCHAR(100),
Email VARCHAR(100),
JoinDate DATE,
SubscriptionType VARCHAR(20)  -- Free, Basic, Premium
);
create table Movies (
MovieID INT PRIMARY KEY,
Title VARCHAR(100),
Genre VARCHAR(50),
ReleaseYear INT,
DurationMinutes INT
);
create table WatchHistory (
WatchID INT PRIMARY KEY,
UserID INT FOREIGN KEY REFERENCES Users(UserID),
MovieID INT FOREIGN KEY REFERENCES Movies(MovieID),
WatchDate DATE,
WatchDuration INT -- in minutes
);

-- Sample Data Insertion


--Users
INSERT INTO Users (UserID, FullName, Email, JoinDate, SubscriptionType) VALUES
(1, 'Ali Al Hinai', 'ali@example.com', '2024-01-01', 'Premium'),
(2, 'Noor Al Busaidi', 'noor@example.com', '2024-02-15', 'Basic'),
(3, 'Hassan Al Rawahi', 'hassan@example.com', '2024-03-10', 'Free'),
(4, 'Muna Al Lawati', 'muna@example.com', '2024-04-05', 'Premium'),
(5, 'Salim Al Zadjali', 'salim@example.com', '2024-05-01', 'Basic');
--Movies
INSERT INTO Movies (MovieID, Title, Genre, ReleaseYear, DurationMinutes) VALUES
(1, 'The Silent Ocean', 'Sci-Fi', 2023, 120),
(2, 'Omani Roots', 'Documentary', 2022, 90),
(3, 'Fast Track', 'Action', 2024, 130),
(4, 'Code & Coffee', 'Drama', 2023, 110),
(5, 'The Last Byte', 'Thriller', 2023, 105);
--WatchHistory
INSERT INTO WatchHistory (WatchID, UserID, MovieID, WatchDate, WatchDuration) VALUES
(1, 1, 1, '2025-05-10', 120),
(2, 2, 2, '2025-05-11', 80),
(3, 3, 3, '2025-05-12', 60),
(4, 4, 1, '2025-05-12', 90),
(5, 5, 5, '2025-05-13', 105);

 ```

## -- Requirement -- 


The company wants to track user engagement, movie popularity, watch time, and 
subscription statistics to improve platform performance and personalize user 
recommendations. 

->  You must use this exact structure to create the tables, insert the sample 
data, and then apply the aggregation queries listed for Beginner, 
Intermediate, and Advanced levels. 
 
### - Beginner Level (Basic Practice) 
1. Total Number of Users 
 ```sql
 SELECT COUNT(*) AS 'Total Student' FROM Users;
 ```
2. Average Duration of All Movies 
```sql
SELECT AVG(DurationMinutes) AS 'Average Duration' FROM Movies;

```
3. Total Watch Time 
```sql
SELECT SUM(WatchDuration) AS 'Average Duration' FROM WatchHistory;

```
4. Number of Movies per Genre 
```sql
SELECT COUNT(MovieID) as 'Number of Movies', Genre FROM Movies GROUP BY Genre

```
5. Earliest User Join Date 
```sql
SELECT MAX(JoinDate) AS 'Earliest User Join Date' FROM Users

```
6. Latest Movie Release Year 
```sql
 SELECT MIN(JoinDate) AS 'Earliest User Join Date' FROM Users

```
 

### - Intermediate Level (Deeper Insights) 
4. Number of Users Per Subscription Type 
5. Total Watch Time per User 
6. Average Watch Duration per Movie 
7. Average Watch Time per Subscription Type 
8. Number of Views per Movie (Including Zero) 
9. Average Movie Duration per Release Year 
 

 
 
### - Advanced Level (Challenging Scenarios) 
7. Most Watched Movie 
8. Users Who Watched More Than 100 Minutes 
9. Total Watch Time per Genre 
10. Identify Binge Watchers (Users Who Watched 2 or More Movies in One Day) 
11. Genre Popularity (Total Watch Duration by Genre) 
12. User Retention Insight: Number of Users Joined Each Month