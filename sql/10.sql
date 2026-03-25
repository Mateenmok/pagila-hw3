SELECT customer_id, first_name || ' ' || last_name AS name, total_payment, percentile
FROM (
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        sum(p.amount) AS total_payment,
        ntile(100) OVER (ORDER BY sum(p.amount)) AS percentile
    FROM customer c
    JOIN payment p USING (customer_id)
    GROUP BY c.customer_id, c.first_name, c.last_name
) sub
WHERE percentile >= 90
ORDER BY name;
