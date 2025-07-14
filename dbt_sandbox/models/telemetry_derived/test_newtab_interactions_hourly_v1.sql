-- add model SQL
SELECT
    submission_date,
    tile_id,
    SUM(impression_count) AS impression_count,
    SUM(click_count) AS click_count
FROM
    {{ source('telemetry_derived', 'newtab_interactions_hourly_v1') }}
WHERE submission_date = DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY)
GROUP BY
    submission_date,
    tile_id
ORDER BY 
    submission_date,
    tile_id