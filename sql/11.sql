SELECT c.first_name, c.last_name, f.title, r.rental_date
FROM customer c
JOIN LATERAL (
    SELECT r.rental_date, i.film_id
    FROM rental r
    JOIN inventory i ON r.inventory_id = i.inventory_id
    WHERE r.customer_id = c.customer_id
    ORDER BY r.rental_date DESC
    LIMIT 1
) r ON true
JOIN film f ON r.film_id = f.film_id
ORDER BY c.last_name, c.first_name;
