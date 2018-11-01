----Queries----
  -----------
     ----


-- (a)

select A.name, count(distinct M.studioID) as numStudios
from Actors A, ActedIn B, Movie M
where A.name = B.name and B.title = M.title 
group by A.name
order by count(M.studioID) asc


-- (b)

select A.name, count(B.title) as numMovies
from Actors A, ActedIn B
where A.name = B.name 
group by A.name
having count(B.title) >= 2
order by numMovies desc


-- (c)

select S.studioName, count(A.name) as numActors
from Actors A, ActedIn B, Movie M, Studio S
where A.name = B.name and B.title = M.title and 
	M.studioID = S.studioID and M.year between 1950 and 1999
group by S.studioName
having count(M.title) >= 14


-- (d)

select M.title, max(ST.[duration(sec)]) as songDuration 
from Movie M, Soundtrack ST
where M.title = ST.title and M.genre = 'action'
group by M.title


-- (e)

select S.studioName, count(distinct A.name) as numActors, count(distinct M.title) as numMovies
from Actors A, ActedIn B, Movie M, Studio S
where A.name = B.name and B.title = M.title and 
	M.studioID = S.studioID and est > 1930 
group by S.studioName


-- (f)

select M.title, avg(ST.rank) as avgRank 
from Movie M, Keywords K, Soundtrack ST
where M.title = ST.title and K.title = M.title and (K.keyword = 'arson' or K.keyword='arsonist')
group by M.title 






