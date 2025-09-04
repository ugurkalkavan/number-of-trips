WITH driver_summary AS (
    SELECT
        'DRIVER' AS view_type,
        driver_id AS id,
        COUNT(*) AS number_of_trips
    FROM trips
    GROUP BY driver_id
),
client_summary AS (
    SELECT
        'CLIENT' AS view_type,
        client_id AS id,
        COUNT(*) AS number_of_trips
    FROM trips
    GROUP BY client_id
)
SELECT * FROM driver_summary
UNION
SELECT * FROM client_summary
ORDER BY view_type, id;