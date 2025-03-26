create database cinema;
use cinema;

CREATE TABLE directors(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  age INTEGER NOT NULL
);

INSERT INTO directors(name, age) VALUES
('John Smith',20),
('Jane Doe',30),
('Xavier Wills',30),
('Bev Scott',15),
('Bree Jensen',90);

CREATE TABLE movies(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  director_id INTEGER REFERENCES directors 
);

INSERT INTO movies(name, director_id) VALUES
('Movie 1', 1),
('Movie 2', 1),
('Movie 3', 2),
('Movie 4', NULL),
('Movie 5', NULL);

CREATE TABLE tickets(
  id SERIAL PRIMARY KEY,
  movie_id INTEGER REFERENCES movies
);
INSERT INTO tickets(movie_id) VALUES (1), (1), (3);
CREATE VIEW `directors_movies` AS (
	select a.id as id_director, a.name as name_director,
		   b.id as id_movie, b.name as name_movie,
           b.director_id
	from directors as a
		LEFT JOIN movies as b on
		a.id = b.director_id
	union    
	select a.id as id_director, a.name as name_director,
		   b.id as id_movie, b.name as name_movie,
           b.director_id
	from directors as a
		RIGHT JOIN movies as b on
		a.id = b.director_id
);


select *
from movies as m
left join directors as d 
on m.director_id = d.id;

-- Exercicios 
-- 1:
select * 
from directors as d
left join movies as m
on d.id = m.director_id; 

-- 2:
select * 
from movies as m
left join tickets as t
on m.id = t.movie_id;

-- 3:
select *
from movies as m
join directors as d on d.id = m.director_id
join tickets as t on m.id = t.movie_id;

-- 4:
select * 
from directors as d 
left join movies as m
on d.id = m.director_id; 