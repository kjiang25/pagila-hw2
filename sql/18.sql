/*
 * Compute the total revenue for each film.
 * The output should include another new column "revenue percent" that shows the percent of total revenue that comes from the current film and all previous films.
 * That is, the "revenue percent" column is 100*"total revenue"/sum(revenue)
 *
 * HINT:
 * The `to_char` function can be used to achieve the correct formatting of your percentage.
 * See: <https://www.postgresql.org/docs/current/functions-formatting.html#FUNCTIONS-FORMATTING-EXAMPLES-TABLE>
 */
SELECT
    RANK() OVER (ORDER BY revenue DESC) AS rank,
    title,
    revenue,
    SUM(revenue) OVER (ORDER BY rank) AS "total revenue",
    CASE
        WHEN 100 * SUM(revenue) OVER (ORDER BY rank) / SUM(revenue) OVER () < 100
        THEN TO_CHAR(100 * SUM(revenue) OVER (ORDER BY rank) / SUM(revenue) OVER (), 'FM00.00')
        ELSE '100.00'
    END AS "percent revenue"
FROM
    (
        SELECT
            RANK() OVER (ORDER BY COALESCE(SUM(p.amount), 0.00) DESC) AS rank,
            f.title,
            COALESCE(SUM(p.amount), 0.00) AS revenue
        FROM film f
        LEFT JOIN inventory i USING (film_id)
        LEFT JOIN rental r USING (inventory_id)
        LEFT JOIN payment p USING (rental_id)
        GROUP BY f.title
        ORDER BY revenue DESC, f.title
    ) AS film_revenue
