BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Mentor" (
	"SSN"	INT,
	"FirstName"	VARCHAR(255),
	"LastName"	VARCHAR(255),
	"DOB"	DATE,
	"SeniorityLevel"	VARCHAR(20),
	"Salary"	DECIMAL(10, 2),
	"Office"	VARCHAR(10),
	"TopicSpecialty"	VARCHAR(255),
	PRIMARY KEY("SSN")
);
CREATE TABLE IF NOT EXISTS "Student" (
	"StudentNo"	INT,
	"SSN"	INT,
	"FirstName"	VARCHAR(255),
	"LastName"	VARCHAR(255),
	"DOB"	DATE,
	FOREIGN KEY("SSN") REFERENCES "Mentor"("SSN"),
	PRIMARY KEY("StudentNo")
);
CREATE TABLE IF NOT EXISTS "Cohort" (
	"CohortID"	INT,
	"CohortNumber"	INT,
	"StartDate"	DATE,
	"EndDate"	DATE,
	PRIMARY KEY("CohortID")
);
CREATE TABLE IF NOT EXISTS "Topic" (
	"TopicID"	INT,
	"Title"	VARCHAR(255),
	"Description"	TEXT,
	PRIMARY KEY("TopicID")
);
CREATE TABLE IF NOT EXISTS "Department" (
	"DepartmentID"	INT,
	"Name"	VARCHAR(255),
	"Office"	VARCHAR(10),
	"TopicSpecialty"	VARCHAR(255),
	PRIMARY KEY("DepartmentID")
);
CREATE TABLE IF NOT EXISTS "CohortContainsTopics" (
	"CohortID"	INT,
	"TopicID"	INT,
	PRIMARY KEY("CohortID","TopicID"),
	FOREIGN KEY("TopicID") REFERENCES "Topic"("TopicID"),
	FOREIGN KEY("CohortID") REFERENCES "Cohort"("CohortID")
);
INSERT INTO "Mentor" ("SSN","FirstName","LastName","DOB","SeniorityLevel","Salary","Office","TopicSpecialty") VALUES (1,'Fadi','Haddad','1997-01-01','Senior',3000,'Tripoli','Tech mentor '),
 (2,'Nermin','monla','1997-01-01','Senior',3000,'Tripoli','Tech mentor '),
 (3,'Omar','Yahya','1997-01-01','Senior',3000,'Tripoli','English mentor '),
 (4,'Omair','Khoder','1997-01-01','Senior',3000,'Tripoli','Tech mentor ');
INSERT INTO "Student" ("StudentNo","SSN","FirstName","LastName","DOB") VALUES (201,1,'wouroud','khaldi','1995-07-12'),
 (202,2,'anwar','khawle','1998-02-28'),
 (203,3,'mohamad','salloume','1997-09-05'),
 (204,4,'rachwan','harb','1996-11-18');
INSERT INTO "Cohort" ("CohortID","CohortNumber","StartDate","EndDate") VALUES (301,1,'2023-01-15','2023-07-15'),
 (302,2,'2023-03-20','2023-09-20'),
 (303,3,'2023-05-10','2023-11-10'),
 (304,4,'2023-02-01','2023-08-01');
INSERT INTO "Topic" ("TopicID","Title","Description") VALUES (401,'HTML & CSS Basics','Fundamentals of web development with HTML and CSS.'),
 (402,'JavaScript Fundamentals','Introduction to programming with JavaScript.'),
 (403,'English Grammar','Grammar rules and usage in the English language.'),
 (404,'Life Skills Workshop','Personal development and soft skills.');
INSERT INTO "Department" ("DepartmentID","Name","Office","TopicSpecialty") VALUES (501,'Full Stack Web Dev','Tripoli','Web Development'),
 (502,'English & Life Skills','Beirut','Language and Soft Skills');
INSERT INTO "CohortContainsTopics" ("CohortID","TopicID") VALUES (301,401),
 (302,402),
 (303,403),
 (304,404);
COMMIT;
