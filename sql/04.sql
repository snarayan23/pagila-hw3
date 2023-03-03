/*
 * List the first and last names of all actors who:
 * 1. have appeared in at least one movie in the "Children" category,
 * 2. but that have never appeared in any movie in the "Horror" category.
 */


SELECT DISTINCT first_name, last_name 
FROM actor 
WHERE actor.actor_id in 
    (SELECT actor_id 
        FROM actor
        JOIN film_actor using (actor_id)
        JOIN film using (film_id) 
        JOIN film_category using (film_id) 
        JOIN category using (category_id) 
        WHERE category.category_id = 3)
   AND actor.actor_id not in 
    (SELECT DISTINCT actor_id
        FROM actor
        JOIN film_actor using (actor_id)
        JOIN film using (film_id)
        JOIN film_category using (film_id)
        JOIN category using (category_id)
        WHERE category.category_id = 11)
ORDER BY last_name; 
