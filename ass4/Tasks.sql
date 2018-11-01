----Tasks----
  --------
	---

-- (a)

alter table TechStaff

add constraint age_constraint check
(
	age between 10 and 125
)

alter table SoundTrack

add constraint song_constraint check
(
	[duration(sec)] > 0
)

-- (b)

alter table Actors

add fname char(255),
	lname char(255)

update Actors
set fname = right(name, (charindex(',', name)+1))

update Actors  
set lname = left(name, (charindex(',', name)-1))
-- Not currently working for names without a comma in them...


-- (c)

insert into Studio (employees) 
		select count(T.studioID)
		from TechStaff T
		group by T.studioID

-- Not sure why this isn't working but the select statement has everything I want in it
-- Just for some reason doesn't work with the insert into statement, maybe I don't know the syntax 
-- I think I just don't know how to change an entire column

go


-- (d)

create trigger tr_update_employees
on TechStaff 
after insert, delete
as
begin 
	if not exists (select * from deleted)
	update Studio
		set employees = employees + 1
	else
	update Studio
		set employees = employees - 1
end 
 
go	


-- (e)

create trigger tr_folded_studios
on Studio
after delete
as
	if object_id('FoldedStudios', 'U') IS NOT NULL 
	(
		create table FoldedStudios
		(
			studioName varchar(50),
			fired integer
		);
	)

go 


-- (f)

create proc spSearchString
@st varchar(20)
as
begin
	select K.title
	from Keywords K
	where K.keyword like (@st + '%')
end

execute spSearchString 'sq' -- As an example, (should find 5 movies)
