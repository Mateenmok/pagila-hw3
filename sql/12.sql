SELECT c.customer_id, c.first_name, c.last_name
FROM customer c
WHERE (
    SELECT count(*)
    FROM (
        SELECT i.film_id
        FROM rental r
        JOIN inventory i ON r.inventory_id = i.inventory_id
        WHERE r.customer_id = c.customer_id
        ORDER BY r.rental_date DESC
        LIMIT 5
    ) recent_films
    WHERE EXISTS (
        SELECT 1 FROM film_category fc
        JOIN category cat ON fc.category_id = cat.category_id
        WHERE fc.film_id = recent_films.film_id AND cat.name = 'Action'
    )
) >= 4
ORDER BY c.customer_id;
