/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */

SELECT DISTINCT (first_name || ' ' || last_name) AS "Actor Name"
FROM actor
WHERE (first_name || ' ' || last_name) IN (
    SELECT DISTINCT (a.first_name || ' ' || a.last_name)
    FROM actor a
    JOIN film_actor fa USING (actor_id)
    JOIN film f USING (film_id)
    JOIN unnest(f.special_features) AS feature ON feature = 'Behind the Scenes'
)    
ORDER BY "Actor Name"

