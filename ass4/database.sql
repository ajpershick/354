create table Movie 
(
	title char(255),
	year int,
	genre char(50),
	studioID int,
	primary key (title),
	foreign key (studioID) references Studio
		on delete set null on update cascade,
);

create table Actors 
(
	name char(255),
	salary money,
	primary key (name),
);

create table Techstaff 
(
	sin int,
	fname char(255),
	lname char(255) not null,
	age int,
	salary money,
	studioID int,
	primary key (sin),
	foreign key (studioID) references Studio
		on delete set null on update cascade,
);

create table ActedIn 
(
	name char(255),
	title char(255),
	primary key (name, title),
	foreign key (name) references Actors
		on update no action on delete cascade,
	foreign key (title) references Movie
		on delete cascade on update cascade,
);

create table Studio
(
	studioID int,
	studioName char(50) not null,
	employees int,
	budget money,
	est int,
	primary key (studioID),
);

create table Soundtrack
(
	songID char(10),
	duration int,
	rank real,
	title char(255),
	primary key (songID),
	foreign key (title) references Movie
		on delete cascade on update cascade,
);

create table Keywords
(
	keyword char(50),
	title char(255),
	foreign key (title) references Movie
		on delete cascade on update cascade,
);
