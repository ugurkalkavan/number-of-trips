WITH driver_trip_days AS (
    SELECT
        driver_id,
        trip_date::date AS trip_day,
        status,
        COUNT(*) AS cnt
    FROM trips
    GROUP BY driver_id, trip_date::date, status
)
SELECT
    driver_id,
    COUNT(DISTINCT trip_day) FILTER (WHERE status IN ('done', 'not_respond')) AS total_days,
    ROUND(
        100.0 * SUM(cnt) FILTER (WHERE status = 'done')
        / SUM( cnt) FILTER (WHERE status IN ('done','not_respond'))
    , 2) AS success_rate
FROM driver_trip_days
GROUP BY driver_id
ORDER BY driver_id;