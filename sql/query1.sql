SELECT
    driver_id,
    COUNT(*) FILTER (WHERE status IN ('done', 'not_respond')) AS total_days,
    ROUND(
        100.0 * COUNT(*) FILTER (WHERE status = 'done')
        / COUNT(*) FILTER (WHERE status IN ('done','not_respond'))
    , 0) AS success_rate
FROM trips
GROUP BY driver_id
ORDER BY driver_id;