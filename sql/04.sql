/*
 * Select the titles of all films that the customer with customer_id=1 has rented more than 1 time.
 *
 * HINT:
 * It's possible to solve this problem both with and without subqueries.
 */

SELECT f.title
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
WHERE r.customer_id = 1
GROUP BY f.title
HAVING count(*) > 1

/*SELECT f.title
FROM film f
WHERE f.film_id IN (
    SELECT i.film_id
    FROM inventory i
    WHERE i.inventory_id IN (
        SELECT r.inventory_id
        FROM rental r
        WHERE r.customer_id = 1
    )
    GROUP BY i.film_id
    HAVING COUNT(*) > 1
)
 */
