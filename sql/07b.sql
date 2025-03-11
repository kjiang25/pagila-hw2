/*
 * This problem is the same as 07.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */

SELECT DISTINCT film.title
FROM film
JOIN inventory i USING (film_id)
LEFT JOIN (
    SELECT DISTINCT inventory.film_id
    FROM inventory
    JOIN rental r USING (inventory_id)
    JOIN customer c USING(customer_id)
    JOIN address a USING(address_id)
    JOIN city ci USING(city_id)
    JOIN country co USING(country_id)
    WHERE co.country = 'United States'
) us_rentals ON film.film_id = us_rentals.film_id
WHERE us_rentals.film_id IS NULL
AND i.inventory_id IS NOT NULL
ORDER BY film.title
