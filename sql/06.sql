/*
 * This question and the next one are inspired by the Bacon Number:
 * https://en.wikipedia.org/wiki/Six_Degrees_of_Kevin_Bacon#Bacon_numbers
 *
 * List all actors with Bacall Number 1.
 * That is, list all actors that have appeared in a film with 'RUSSELL BACALL'.
 * Do not list 'RUSSELL BACALL', since he has a Bacall Number of 0.
 */

WITH rb_films as (SELECT film.film_id 
    FROM film 
    JOIN film_actor using (film_id) 
    JOIN actor using (actor_id) 
    WHERE actor.actor_id = 112)


SELECT DISTINCT (actor.first_name || ' ' ||  actor.last_name) as "Actor Name" 
FROM actor 
JOIN film_actor using (actor_id) 
JOIN film using (film_id) 
WHERE film.film_id IN (SELECT * from rb_films) 
AND actor.actor_id !=112
ORDER BY "Actor Name"; 
