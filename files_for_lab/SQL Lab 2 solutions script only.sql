/* 
 Jorge Castro DAPT NOV2021
 Lab | SQL Queries 2
 
 Instructions:
 
 Select all the actors with the first name ‘Scarlett’.
 */
SELECT
  *
FROM
  actor
WHERE
  first_name = 'Scarlett';
/*
 Select all the actors with the last name ‘Johansson’.
 */
SELECT
  *
FROM
  actor
WHERE
  last_name = ('Johansson');
/* 
 How many films (movies) are available for rent?
 */
SELECT
  COUNT(*) film_id
FROM
  inventory;
/*
 How many films have been rented?
 */
SELECT
  COUNT(*) rental_id
FROM
  rental;
/*  
 What is the shortest and longest rental period?
 */
SELECT
  MIN(rental_duration),
  MAX(rental_duration)
FROM
  film;
SELECT
  MAX (
    DATEDIFF (rental.return_date, rental.rental_date)
  ) AS longest_rental_period,
  (
    DATEDIFF (rental.return_date, rental.rental_date)
  ) > (0) AS shortest_rental_period
FROM
  rental;
/* 
 What are the shortest and longest movie duration? 
 Name the values max_duration and min_duration.
 */
SELECT
  MIN(length) AS min_duration,
  MAX(length) AS max_duration
FROM
  film;
/* 
 What's the average movie duration?
 */
SELECT
  ROUND(AVG(length)) AS average_movie_duration
FROM
  film;
/* 
 What's the average movie duration expressed in format (hours, minutes)?
 */
/*Using the FLOOR() and MOD function*/
/* 
 We have to round the operation first otherwise will give 55m,127
 select CONCAT(FLOOR((avg(length))/60),'h ',MOD((avg(length)),60),'m') from film;
 */
SELECT
  CONCAT(
    FLOOR(ROUND((AVG(length))) / 60),
    'h ',
    MOD(ROUND((AVG(length))), 60),
    'm'
  ) AS average_movie_duration
FROM
  film;
/* 
 How many movies longer than 3 hours?
 */
SELECT
  DISTINCT COUNT(length) AS movies_longer_than_3h
FROM
  film
WHERE
  length > (3 * 60);
/* 
 Get the name and email formatted. Example: Mary SMITH - mary.smith@sakilacustomer.org.
 */
SELECT
  concat(first_name, ' ', last_name, ' ', '-', ' ', email) AS customer_contact_info
FROM
  customer;
/* 
 What's the length of the longest film title?
 */
SELECT
  MAX(length(title)) AS longest_film_title
FROM
  film;