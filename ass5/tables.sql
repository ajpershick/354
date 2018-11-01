
CREATE TABLE Instructor
(
	eid CHAR(10),
	type CHAR(20),
	area CHAR(20),
	fname CHAR(20),
	lname CHAR(20),
	numbers INTEGER,
	start DATE,
	PRIMARY KEY (eid),
);

CREATE TABLE Grad_Student
(
	sid CHAR(10),
	area CHAR(20),
	fname CHAR(20),
	lname CHAR(20),
	PRIMARY KEY (sid),
);

CREATE TABLE Agent 
(
	id CHAR(10),
	type CHAR(20),
	lname CHAR(20),
	phone CHAR(10),
	PRIMARY KEY (id),
);

CREATE TABLE Course 
(
	code CHAR(10),
	credit INTEGER,
	PRIMARY KEY (code),
);

CREATE TABLE Course_Instructor
(
	code CHAR(10), 
	eid CHAR(10) NOT NULL,
	credit INTEGER,
	PRIMARY KEY (code),
	FOREIGN KEY (eid) REFERENCES Instructor ON DELETE NO ACTION,
);

CREATE TABLE Section
(
	section INTEGER,
	code CHAR(10),
	average FLOAT,
	semester CHAR(20),
	numbers INTEGER,
	PRIMARY KEY (code,section),
	FOREIGN KEY (code) REFERENCES Course ON DELETE CASCADE,
);

CREATE TABLE Designer
(
	sin CHAR(10),
	company CHAR(20),
	fname CHAR(20),
	lname CHAR(20),
	PRIMARY KEY (sin),
);

CREATE TABLE Designs
(
	income MONEY,
	sin CHAR(10),
	code CHAR(10),
	PRIMARY KEY (sin, code),
	FOREIGN KEY (sin) REFERENCES Designer,
	FOREIGN KEY (code) REFERENCES Course,
);

CREATE TABLE Supervise
(
	funding INTEGER,
	eid CHAR(10),
	sid CHAR(10),
	PRIMARY KEY (eid, sid),
	FOREIGN KEY (eid) REFERENCES Instructor,
	FOREIGN KEY (sid) REFERENCES Grad_Student
);

CREATE TABLE Assigned
(
	id CHAR(10),
	eid CHAR(10),
	sid CHAR(10),
	FOREIGN KEY (id) REFERENCES Agent,
	FOREIGN KEY (eid) REFERENCES Instructor,
	FOREIGN KEY (id) REFERENCES Grad_Student,
	PRIMARY KEY (eid, id),
)


