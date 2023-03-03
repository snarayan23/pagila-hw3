/*
 * List the total amount of money that customers from each country have payed.
 * Order the results from most to least money.
 */

-- payment - payment_id, customer_id, staff_id, rental_id
-- rental - customer_id, staff_id, inventory_id, customer_id 
-- 


SELECT country.country, sum(payment.amount) as total_payments
FROM payment 
JOIN customer using (customer_id) 
JOIN address using (address_id) 
JOIN city using (city_id) 
JOIN country using (country_id)
GROUP BY country.country
ORDER BY total_payments desc, country.country;

