Create Database Movie;
use Movie;

/*   Query
i.	Write a SQL query to find when the movie 'American Beauty' released. Return movie release year.
ii.	Write a SQL query to find those movies, which were released before 1998. Return movie title.
iii. Write a query WHERE it should contain all the data of the movies which were released after 1995 and their movie duration was greater than 120.
iv.	Write a query to determine the Top 7 movies which were released in United Kingdom. Sort the data in ascending order of the movie year.
v.	Set the language of movie language as 'Chinese' for the movie which has its existing language as Japanese and the movie year was 2001.
vi.	Write a SQL query to find name of all the reviewers who rated the movie 'Slumdog Millionaire'.
vii.	Write a query which fetch the first name, last name & role played by the actor WHERE output should all exclude Male actors.
viii.	Write a SQL query to find the actors who played a role in the movie 'Annie Hall'. Fetch all the fields of actor table. (Hint: Use the IN operator).
ix.	Write a SQL query to find those movies that have been released in countries other than the United Kingdom. Return movie title, movie year, movie time, and date of release, releasing country.
x.	Print genre title, maximum movie duration and the count the number of movies in each genre. (HINT: By using inner join)
xi.	Create a view which should contain the first name, last name, title of the movie & role played by particular actor.
xii.	Write a SQL query to find the movies with the lowest ratings
xiii.	Finally Mail the script to jeevan.raj@imarticus.com      */


# 1.	Write a SQL query to find when the movie 'American Beauty' released. Return movie release year.
SELECT
	mov_title,mov_year 
FROM 
	movie 
WHERE
	mov_title ='American Beauty';

# 2.	Write a SQL query to find those movies, which were released before 1998. Return movie title.
SELECT 
	mov_title,mov_year 
FROM 
	movie 
WHERE 
	mov_year <1998;

# 3. Write a query WHERE it should contain all the data of the movies which were released after 1995 
#and their movie duration was greater than 120.
SELECT
	 * 
FROM 
	movie 
WHERE 
	mov_year >1995 and mov_time >120;

# 4. Write a query to determine the Top 7 movies which were released in United Kingdom. 
# Sort the data in ascending order of the movie year.
SELECT
	 * 
FROM 
	movie 
WHERE 
	mov_rel_country = 'UK' order by mov_year asc limit 7;

# 5.Set the language of movie language as 'Chinese' for the movie which has its existing language as Japanese 
# and the movie year was 2001.
UPDATE
	 movie 
SET 
	mov_lang = 'Chinese' 
WHERE 
	mov_lang = 'Japanese' and mov_year = 2001;

SELECT * FROM movie WHERE mov_lang = 'Chinese' and mov_year = 2001;     # to cross varify

# 6.	Write a SQL query to find name of all the reviewers who rated the movie 'Slumdog Millionaire'.
SELECT 
	r.rev_name,m.mov_title 
FROM
	 reviewer r inner join ratings using(rev_id) inner join movie m using(mov_id) 
WHERE 
	mov_title ='slumdog Millionaire';

# 7. Write a query which fetch the first name, last name & role played by the actor WHERE output should all exclude Male actors.
SELECT 
	act_fname,act_lname,act_gender,c.role
FROM
	cast c inner join actor using(act_id) 
WHERE 
	act_gender != 'M';

# 8.	Write a SQL query to find the actors who played a role in the movie 'Annie Hall'. 
# Fetch all the fields of actor table. (Hint: Use the IN operator).
SELECT
	 *,m.mov_title 
FROM 
	actor inner join cast using(act_id) inner join movie m using(mov_id) 
WHERE m.mov_title = 'Annie Hall';

# 9. Write a SQL query to find those movies that have been released in countries other than the United Kingdom. 
#Return movie title, movie year, movie time, and date of release, releasing country.
SELECT 
	mov_title,mov_year,mov_dt_rel,mov_rel_country 
FROM 
	movie 
WHERE 
	mov_rel_country !='UK';

# 10. Print genre title, maximum movie duration and the count the number of movies in each genre. (HINT: By using inner join)
SELECT 
	g.gen_title,max(mov_time) as Max_Mov_duration, count(*) as Number_of_movies 
FROM 
	genres g inner join movie_genres using(gen_id) inner join movie using(mov_id) 
GROUP BY
	gen_id;

# 11 .	Create a view which should contain the first name, last name, title of the movie & role played by particular actor.
create view 
	actor_info as(SELECT act_fname,act_lname,mov_title,role FROM cast inner join actor using(act_id) inner join movie using(mov_id));
SELECT 
	* 
FROM 
	actor_info;

# 12.	Write a SQL query to find the movies with the lowest ratings
SELECT 
	* 
FROM 
	ratings;
SELECT 
	mov_title,num_o_ratings 
FROM 
	ratings inner join movie using(mov_id) 
ORDER BY 
	num_o_ratings asc limit 1;












