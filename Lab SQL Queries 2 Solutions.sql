/* 
Jorge Castro DAPT NOV2021
Lab | SQL Queries 2

Instructions:

Select all the actors with the first name ‘Scarlett’.
*/
select *
from actor
where first_name = 'Scarlett';






/*
Select all the actors with the last name ‘Johansson’.
*/
select * 
from actor
where last_name = ('Johansson');






/* 
How many films (movies) are available for rent?
*/
select count(*) film_id
from inventory;






/*
How many films have been rented?
*/
select count(*) rental_id
from rental;






/*  
What is the shortest and longest rental period?
*/
select min(rental_duration), max(rental_duration)
from film; 

select max(datediff(rental.return_date, rental.rental_date)) as longest_rental_period, 
(datediff(rental.return_date, rental.rental_date)) > (0) as shortest_rental_period
from rental;






/* 
What are the shortest and longest movie duration? 
Name the values max_duration and min_duration.
*/
select min(length) as min_duration, max(length) as max_duration 
from film;






/* 
What's the average movie duration?
*/
select round(avg(length)) as average_movie_duration
from film;






/* 
What's the average movie duration expressed in format (hours, minutes)?
*/

/*Using the FLOOR() and MOD function*/
/* 
We have to round the operation first otherwise will give 55m,127
select CONCAT(FLOOR((avg(length))/60),'h ',MOD((avg(length)),60),'m') from film;
*/
select CONCAT(FLOOR(round((avg(length)))/60),'h ',MOD(round((avg(length))),60),'m')
as average_movie_duration
from film;






/* 
How many movies longer than 3 hours?
*/
select distinct count(length) as movies_longer_than_3h
from film
where length > (3*60);






/* 
Get the name and email formatted. Example: Mary SMITH - mary.smith@sakilacustomer.org.
*/
select concat(first_name,' ',last_name,' ','-',' ',email) as customer_contact_info
from customer;






/* 
What's the length of the longest film title?
*/
select max(length(title)) as longest_film_title
from film;


