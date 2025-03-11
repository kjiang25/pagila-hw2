/*
 * This problem is the same as 05.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */

SELECT a.last_name, a.first_name
FROM actor a
LEFT JOIN customer c ON a.last_name || a.first_name = c.last_name || c.first_name
WHERE c.customer_id IS NULL
