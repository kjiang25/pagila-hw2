/*
 * Management is planning on purchasing new inventory.
 * Films with special features cost more to purchase than films without special features,
 * and so management wants to know if the addition of special features impacts revenue from movies.
 *
 * Write a query that for each special_feature, calculates the total profit of all movies rented with that special feature.
 *
 * HINT:
 * Start with the query you created in pagila-hw1 problem 16, but add the special_features column to the output.
 * Use this query as a subquery in a select statement similar to answer to the previous problem.
 */

SELECT
  unnest(special_features) AS special_feature,
  ROUND(SUM(profit)::numeric, 2) AS profit
FROM (
  SELECT f.special_features, f.title, SUM(p.amount) AS profit
    FROM film AS f
    JOIN inventory AS i ON f.film_id = i.film_id
    JOIN rental AS r ON i.inventory_id = r.inventory_id
    JOIN payment AS p ON r.rental_id = p.rental_id
    GROUP BY f.title, f.special_features
    ORDER BY profit DESC
)AS film_profits
GROUP BY
  special_feature
ORDER BY
  special_feature;
