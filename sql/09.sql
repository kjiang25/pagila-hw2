/*
 * Count the number of movies that contain each type of special feature.
 * Order the results alphabetically be the special_feature.
 */

SELECT
    unnested_features AS special_features,
    COUNT(*) AS count
FROM
    film,
    UNNEST(special_features) AS unnested_features
GROUP BY
    unnested_features
ORDER BY
    unnested_features;
