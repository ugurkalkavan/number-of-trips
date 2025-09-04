WITH done_trips_in_different_days AS (
    SELECT
        client_id,
        driver_id,
        trip_date::date,
        count(*) as cnt
    FROM
        trips
    WHERE status = 'done'
    GROUP BY client_id, driver_id, trip_date::date
    HAVING count(*) < 2
),
client_summary AS (
    SELECT
        'CLIENT' AS view_type,
        client_id AS id,
        SUM(cnt) as total_cnt
    FROM done_trips_in_different_days
    GROUP BY client_id
),
driver_summary AS (
    SELECT
        'DRIVER' AS view_type,
        driver_id AS id,
        SUM(cnt) as total_cnt
    FROM done_trips_in_different_days
    GROUP BY driver_id
)
SELECT * FROM client_summary
UNION
SELECT * FROM driver_summary
ORDER BY view_type, id;