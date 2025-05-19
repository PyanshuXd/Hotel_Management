CREATE DATABASE Hotel_MS;

USE Hotel_MS;

CREATE TABLE Guest(
ID 					INT PRIMARY KEY NOT NULL UNIQUE,
First_Name			VARCHAR(25),
Last_Name	 		VARCHAR(25),
Email_Add 			VARCHAR(25),
Phone_Num 			INT
);

INSERT INTO Guest VALUES
(101, 'Pyanshu', 'Shaw', 'ps123@gmail.com', 6290876),
(102, 'Abhishek', 'Shaw', 'abhi213@yahoo.com', 9872059),
(103, 'Manish', 'Mishra', 'manni786@rediffmail.com', 69871089),
(104, 'Supratik', 'Ranjit', 'sup321@gmail.com', 820546958),
(105, 'Anjan', 'Paul', 'Anj987@gmail.com', 70069820),
(106, 'Bobby', 'Dutta', 'Bob100@rediffmail.com', 62979001),
(107, 'Deep', 'Mukhopadhyay', 'deep200@yahoo.com', 93258715),
(108, 'Rajarshi', 'Mondal', 'raja321@gmail.com', 69874054),
(109, 'Chanddak', 'Bhattacharjee', 'cho210@rediffmail.com', 98870456),
(110, 'Rishab', 'Mondal', 'rish11@gmail.com', 62908045)
;

CREATE TABLE Booking(
ID 					INT PRIMARY KEY NOT NULL UNIQUE,
Checkin_Date		DATETIME,
Checkout_Date 		DATETIME,
Num_Adults 			INT,
Num_Child 			INT,
Booking_Amt			INT,
Guest_ID			INT,
Room_ID				INT,
Payment_Status_ID	INT,

FOREIGN KEY (Guest_ID) REFERENCES Guest(ID),
FOREIGN KEY (Room_ID) REFERENCES Room(ID),
FOREIGN KEY (Payment_Status_ID) REFERENCES Payment_status(ID)
);

INSERT INTO Booking VALUES
(01, '2022-03-15', '2022-04-25', 1, 0, 250, 101, 301, 1001),
(02, '2022-07-03', '2022-08-25', 2, 0, 300, 102, 302, 1002),
(03, '2022-03-10', '2022-04-25', 2, 2, 300, 103, 303, 1003),
(04, '2022-10-18', '2022-12-29', 1, 3, 150, 104, 304, 1004),
(05, '2022-06-15', '2022-08-05', 3, 0, 200, 105, 305, 1005),
(06, '2022-03-02', '2022-04-05', 1, 1, 220, 106, 306, 1006),
(07, '2022-06-17', '2022-08-23', 2, 0, 500, 107, 307, 1007),
(08, '2022-01-29', '2022-04-11', 2, 2, 190, 108, 308, 1008),
(09, '2022-03-21', '2022-04-27', 1, 2, 1000, 109, 309, 1009),
(10, '2022-04-15', '2022-09-13', 1, 1, 650, 110, 310, 1010)
;

CREATE TABLE Room(
ID 				INT PRIMARY KEY,
RoomType 		VARCHAR(50),
Price 			INT,
Status 			VARCHAR(20)
);

INSERT INTO Room VALUES
(301 , 'Suite', 250, 'Booked'),
(302 , 'Couple-Friendly', 150, 'Booked'),
(303 , 'Deluxe', 350, 'Booked'),
(304 , 'Deluxe', 300, 'Booked'),
(305 , 'Private Room', 500, 'Vacant'),
(306 , 'Semi-Private', 290, 'Booked'),
(307 , 'Super Deluxe', 500, 'Vacant'),
(308 , 'Luxury', 150, 'Booked'),
(309 , 'Suite', 200, 'Vacant'),
(310 , 'Semi-Private', 450, 'Booked')
;

CREATE TABLE Add_On(
ID				INT PRIMARY KEY NOT NULL UNIQUE,
Add_On_Name		VARCHAR(25),
Price			INT,
Room_ID			INT,

FOREIGN KEY (Room_ID) REFERENCES Room(ID)
);

INSERT INTO Add_On VALUES
(501, 'TV', 100, 301),
(502, 'AC', 200, 302),
(503, 'Refridgerator', 100, 303),
(504, 'TV', 100, 304),
(505, 'Home theatre', 200, 305),
(506, 'AC', 200, 306),
(507, 'Wifi', 50, 307),
(508, 'Refridgerator', 100, 308),
(509, 'Mocktail', 500, 309),
(510, 'Wifi', 50, 310)
;

CREATE TABLE Meal(
ID				INT PRIMARY KEY NOT NULL UNIQUE,
Vegetarian		VARCHAR(5),
Non_Veg			VARCHAR(5),
Breakfast		VARCHAR(5),
Lunch			VARCHAR(5),
Dinner          VARCHAR(5),
Price			INT,
Guest_ID		INT,

FOREIGN KEY (Guest_ID) REFERENCES Guest(ID)
);

INSERT INTO Meal VALUES
(201, 'Yes', 'No', 'Yes', 'Yes', 'Yes', 300, 101),
(202, 'Yes', 'No', 'No', 'Yes', 'Yes', 200, 102),
(203, 'No', 'Yes', 'Yes', 'No', 'Yes', 200, 103),
(204, 'No', 'Yes', 'Yes', 'Yes', 'No', 200, 104),
(205, 'No', 'Yes', 'No', 'No', 'Yes', 100, 105),
(206, 'Yes', 'No', 'No', 'Yes', 'No', 100, 106),
(207, 'No', 'Yes', 'Yes', 'No', 'Yes', 200, 107),
(208, 'No', 'Yes', 'Yes', 'Yes', 'Yes', 300, 108),
(209, 'Yes', 'No', 'No', 'Yes', 'No', 100, 109),
(210, 'Yes', 'No', 'Yes', 'Yes', 'Yes', 300, 110)
;

CREATE TABLE Payment_Status(
ID						INT PRIMARY KEY NOT NULL UNIQUE,
Payment_Status_Name		VARCHAR(20),
Guest_ID				INT NOT NULL,

FOREIGN KEY (Guest_ID) REFERENCES Guest(ID)
);

INSERT INTO Payment_Status VALUES
(1001, 'Due', 101),
(1002, 'Cleared', 102),
(1003, 'Cleared', 103),
(1004, 'Cleared', 104),
(1005, 'Cleared', 105),
(1006, 'Cleared', 106),
(1007, 'Due', 107),
(1008, 'Cleared', 108),
(1009, 'Due', 109),
(1010, 'Cleared', 110)
;

CREATE TABLE Room_Feature(
ID					INT	PRIMARY KEY NOT NULL UNIQUE,
Feature_Name		VARCHAR(25),
Room_ID				INT,

FOREIGN KEY (Room_ID) REFERENCES Room(ID)
);

INSERT INTO Room_Feature VALUES
(2001, 'AC', 301),
(2002, 'Double-Bed', 302),
(2003, 'Wifi', 303),
(2004, 'Air-Purifier', 304),
(2005, 'AC', 305),
(2006, 'AC', 306),
(2007, 'Laundry', 307),
(2008, 'Home Theatre', 308),
(2009, 'Air-Purifier', 309),
(2010, 'Wifi', 310)
;

CREATE TABLE Bed_Type(
ID					INT	PRIMARY KEY NOT NULL UNIQUE,
Bed_Type_Name		VARCHAR(25),
Num_Beds			INT,
Room_ID				INT,

FOREIGN KEY (Room_ID) REFERENCES Room(ID)
);

INSERT INTO Bed_Type VALUES
(1, 'Single-Bed', 1, 301),
(2, 'Queen', 2, 302),
(3, 'Single-Bed', 1, 303),
(4, 'Triple-Bed', 3, 304),
(5, 'Double-double', 4, 305),
(6, 'Junior Suite', 2, 306),
(7, 'Sofa-Bed', 2, 307),
(8, 'Double-Bed', 2, 308),
(9, 'Murphy-Bed', 3, 309),
(10, 'Single-Bed', 1, 310)
;

CREATE TABLE Floor(
ID				INT PRIMARY KEY NOT NULL UNIQUE,
Floor_Num		INT,
Guest_ID		INT,
Room_ID			INT,

FOREIGN KEY (Room_ID) REFERENCES Room(ID),
FOREIGN KEY (Guest_ID) REFERENCES Guest(ID)
);

INSERT INTO Floor VALUES
(11, 1, 101, 301),
(12, 2, 102, 302),
(13, 3, 103, 303),
(14, 4, 104, 304),
(15, 5, 105, 305),
(16, 6, 106, 306),
(17, 7, 107, 307),
(18, 8, 108, 308),
(19, 9, 109, 309),
(20, 10, 110, 310)
;

CREATE TABLE Reception(
ID					INT PRIMARY KEY NOT NULL UNIQUE,
Counter_Num			INT,
Guest_ID			INT,
Receptionist_ID		INT,

FOREIGN KEY (Guest_ID) REFERENCES Guest(ID),
FOREIGN KEY (Receptionist_ID) REFERENCES Receptionist(ID)
);

INSERT INTO Reception VALUES
(111, 1, 101, 001),
(112, 2, 102, 002),
(113, 3, 103, 003),
(114, 4, 104, 004),
(115, 5, 105, 005),
(116, 6, 106, 006),
(117, 7, 107, 007),
(118, 8, 108, 008),
(119, 9, 109, 009),
(120, 10, 110, 010)
;

CREATE TABLE Receptionist(
ID					INT PRIMARY KEY NOT NULL UNIQUE,
First_Name			VARCHAR(25),
Last_Name			VARCHAR(25),
Email_ID			VARCHAR(25),
City				VARCHAR(25),
Phone_Num			INT
);

INSERT INTO Receptionist VALUES
(001, 'Alia', 'Bhatt', 'alia123@gmail.com','Gurugram', 6290916),
(002, 'Rashmika', 'Mandana', 'ras@email.com', 'Kolkata', 9872649),
(003, 'Sara', 'Ali', 'sara@email.com', 'Noida', 69832089),
(004, 'Katrina', 'Kaif', 'kaif@email.com', 'Chennai', 827346958),
(005, 'Nora', 'Fatehi', 'noor@email.com', 'Pune', 70090820),
(006, 'Kiara', 'Advani', 'kiara@example.com', 'Patna', 62974601),
(007, 'Priyanka', 'Chopra', 'priya@gmail.com', 'Bangaluru', 93287715),
(008, 'Deepika', 'Padukone', 'deep@example.com', 'Bangaluru', 69890054),
(009, 'Jacqueline', 'Fernandez', 'jackie@email.com', 'Delhi', 92070456),
(010, 'Kareena', 'Kapoor', 'kareena@rediffmail.com', 'Kochi', 62928045)
;

CREATE TABLE Feedback (
ID		 			INT PRIMARY KEY,
Rating 				INT,
Positive_Comments 	VARCHAR(100),
Negative_Comments 	VARCHAR(100),
Suggestion			VARCHAR(100),
Guest_ID			INT,

FOREIGN KEY (Guest_ID) REFERENCES Guest(Id)
);

INSERT INTO Feedback VALUES 
(51, 5, 'Great service!', '', 'Improve bathroom floor', 101),
(52, 5, 'Staffs were helpful', '', 'Please work on network problem', 102),
(53, 4, 'Hygiene is good as per my personal experience', 'Water problem', 'Improve bathroom waterflow', 103),
(54, 4, 'Worth it', '', 'Improve hygiene in balcony', 104),
(55, 5, 'No delay in room allocation and bed availability','','All fantastic', 105),
(56, 3, '', 'My bed was broken from left side, please fix it.', '', 106),
(57, 2, '', 'Food & Accommodation Quality is not that worth the price', 'Need to improve the food service delay', 107),
(58, 5, 'The billing process was clear and accurate', '', 'Please Change the AC remote battery', 108),
(59, 3, '', 'My Lugguage was lil late after arriving', '', 109),
(60, 4, 'Impressed', 'I found a lizard in bathroom', '', 110)
;

#SQL Queries 

#Getting the guests name with their payment status respectively.
SELECT g.First_Name, g.Last_Name, ps.Payment_Status_Name
FROM Guest as g
INNER JOIN payment_status as ps
ON g.ID = ps.Guest_ID;

#Getting the guests name with their booking status.
SELECT g.First_Name, g.Last_Name, b.Checkin_Date, b.Checkout_Date
FROM guest as g
INNER JOIN booking as b
ON g.ID = b.Guest_ID;

ALTER TABLE Receptionist
ADD COLUMN Guest_ID INT NOT NULL;

UPDATE Receptionist
SET Guest_ID = 110
WHERE ID = 10;

#Getting the receptionists' details along with Guest ID.
SELECT r.*, g.First_Name, g.Last_Name
FROM receptionist as r
LEFT JOIN Guest as g
ON r.Guest_ID = g.ID;

#Getting the Meals details of Guests.
SELECT g.First_Name, g.Last_Name, m.*
FROM Guest as g
RIGHT JOIN Meal as m
ON g.ID = m.Guest_ID;

#Getting the Guests' Name with their feedbacks provided.
SELECT g.First_Name, g.Last_Name, f.*
FROM Guest as g
RIGHT JOIN Feedback as f
ON g.ID = f.Guest_ID;
