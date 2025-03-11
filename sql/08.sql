/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 * Order the results alphabetically.
 *
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */
SELECT title
FROM film
WHERE rating = 'G'
AND 'Trailers' IN (
    SELECT unnest(special_features)
    FROM film f
    WHERE f.film_id = film.film_id
)
ORDER BY title;

/*
 * Alternative Solutions
 * SELECT title
FROM film
WHERE rating = 'G'
AND special_features @> ARRAY['Trailers']
ORDER BY title;

SELECT title
FROM film
WHERE rating = 'G'
AND special_features && ARRAY['Trailers']
ORDER BY title;
*/

