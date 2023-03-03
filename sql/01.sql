/*
 * Compute the number of customers who live outside of the US.
 */


--customer- customer_id, address id, and store id 
--address -- address_id, city_id 
-- city -- city_id, country_id 
-- country - country_id 
--

SELECT count(customer.customer_id)
FROM customer 
JOIN address using (address_id) 
JOIN city using (city_id) 
JOIN country using (country_id) 
WHERE country.country_id != 103;
