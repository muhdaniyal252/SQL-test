-- Facebook

SELECT * FROM facebook;

SELECT
    date_start as date,
    SUM(clicks),
    AVG(clicks),
    SUM(cpc),
    AVG(cpc),
    SUM(cpm),
    AVG(cpm)
from facebook
GROUP BY date_start;

SELECT
    date_start as date,
    SUM(clicks), (
        select
            SUM(fb.clicks) AS one_day_click_sum
        from facebook as fb
        where
            DATE(fb.date_start) = DATE(
                DATE_SUB(
                    facebook.date_start,
                    INTERVAL 1 DAY
                )
            )
    ) as one_day_click_sum, (
        select
            SUM(fb.clicks) AS seven_day_click_sum
        from facebook as fb
        where
            DATE(fb.date_start) = DATE(
                DATE_SUB(
                    facebook.date_start,
                    INTERVAL 7 DAY
                )
            )
    ) as seven_day_click_sum
from facebook
GROUP BY date_start
ORDER BY date_start;

SELECT (
        CASE
            WHEN campaign_name LIKE '%pros_' THEN 'pros'
            WHEN campaign_name LIKE '%PROS_' THEN 'pros'
            WHEN campaign_name LIKE '_pros%' THEN 'pros'
            WHEN campaign_name LIKE '_PROS%' THEN 'pros'
            WHEN campaign_name LIKE '%rt_' THEN 'rt'
            WHEN campaign_name LIKE '%RT_' THEN 'rt'
            WHEN campaign_name LIKE '_rt%' THEN 'rt'
            WHEN campaign_name LIKE '_RT%' THEN 'rt'
            ELSE 'remaining'
        END
    ) as campaign_name,
    SUM(clicks * cpc) cost_sum,
    AVG(clicks * cpc) cost_avg
FROM facebook
GROUP by (
        CASE
            WHEN campaign_name LIKE '%pros_' THEN 'pros'
            WHEN campaign_name LIKE '%PROS_' THEN 'pros'
            WHEN campaign_name LIKE '_pros%' THEN 'pros'
            WHEN campaign_name LIKE '_PROS%' THEN 'pros'
            WHEN campaign_name LIKE '%rt_' THEN 'rt'
            WHEN campaign_name LIKE '%RT_' THEN 'rt'
            WHEN campaign_name LIKE '_rt%' THEN 'rt'
            WHEN campaign_name LIKE '_RT%' THEN 'rt'
            ELSE 'remaining'
        END
    );

--GOOGLE

SELECT * FROM google;

SELECT
    day as date,
    SUM(clicks),
    AVG(clicks),
    SUM(conversions),
    AVG(conversions),
    SUM(cost),
    AVG(cost)
FROM google
GROUP BY day;

SELECT day as date, SUM(clicks), (
        select
            SUM(gl.clicks) AS one_day_click_sum
        from google as gl
        where
            DATE(gl.day) = DATE(
                DATE_SUB(google.day, INTERVAL 1 DAY)
            )
    ) as one_day_click_sum, (
        select
            SUM(gl.clicks) AS seven_day_click_sum
        from google as gl
        where
            DATE(gl.day) = DATE(
                DATE_SUB(google.day, INTERVAL 7 DAY)
            )
    ) as seven_day_click_sum
from google
GROUP BY day
ORDER BY day;

SELECT (
        CASE
            WHEN campaign LIKE '%pros_' THEN 'pros'
            WHEN campaign LIKE '%PROS_' THEN 'pros'
            WHEN campaign LIKE '_pros%' THEN 'pros'
            WHEN campaign LIKE '_PROS%' THEN 'pros'
            WHEN campaign LIKE '%rt_' THEN 'rt'
            WHEN campaign LIKE '%RT_' THEN 'rt'
            WHEN campaign LIKE '_rt%' THEN 'rt'
            WHEN campaign LIKE '_RT%' THEN 'rt'
            ELSE 'remaining'
        END
    ) as campaign_name,
    SUM(cost) cost_sum,
    AVG(cost) cost_avg
FROM google
GROUP by (
        CASE
            WHEN campaign LIKE '%pros_' THEN 'pros'
            WHEN campaign LIKE '%PROS_' THEN 'pros'
            WHEN campaign LIKE '_pros%' THEN 'pros'
            WHEN campaign LIKE '_PROS%' THEN 'pros'
            WHEN campaign LIKE '%rt_' THEN 'rt'
            WHEN campaign LIKE '%RT_' THEN 'rt'
            WHEN campaign LIKE '_rt%' THEN 'rt'
            WHEN campaign LIKE '_RT%' THEN 'rt'
            ELSE 'remaining'
        END
    );