Introduction
Welcome to the Movie Database! This database is designed to store information about movies, including details about actors, directors, genres, and more.

Database Schema
The database consists of the following tables:

Movies: Contains information about each movie, such as its title, release year, and duration.
Actors: Stores details about actors, including their names and birth dates.
Directors: Holds information about directors, including their names and birth dates.
Genres: Lists different genres of movies.
Movie_Actors: A junction table to establish a many-to-many relationship between movies and actors.
Movie_Directors: A junction table to establish a many-to-many relationship between movies and directors.
Movie_Genres: A junction table to establish a many-to-many relationship between movies and genres.
Tables Description
Movies
movie_id (Primary Key): Unique identifier for each movie.
title: Title of the movie.
release_year: The year when the movie was released.
duration: Duration of the movie in minutes.
Actors
actor_id (Primary Key): Unique identifier for each actor.
name: Name of the actor.
birth_date: Birth date of the actor.
Directors
director_id (Primary Key): Unique identifier for each director.
name: Name of the director.
birth_date: Birth date of the director.
Genres
genre_id (Primary Key): Unique identifier for each genre.
name: Name of the genre.
Movie_Actors
movie_id (Foreign Key): References the movie_id in the Movies table.
actor_id (Foreign Key): References the actor_id in the Actors table.
Movie_Directors
movie_id (Foreign Key): References the movie_id in the Movies table.
director_id (Foreign Key): References the director_id in the Directors table.
Movie_Genres
movie_id (Foreign Key): References the movie_id in the Movies table.
genre_id (Foreign Key): References the genre_id in the Genres table.
Usage
To use this database, you can perform SQL queries to retrieve, insert, update, or delete data. Below are some sample queries
