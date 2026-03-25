SELECT name, title, "total rentals"
FROM (
    SELECT
        cat.name,
        f.title,
        count(r.rental_id) AS "total rentals",
        row_number() OVER (PARTITION BY cat.name ORDER BY count(r.rental_id) DESC, f.title DESC) AS rn
    FROM category cat
    JOIN film_category fc USING (category_id)
    JOIN film f USING (film_id)
    JOIN inventory i USING (film_id)
    JOIN rental r USING (inventory_id)
    GROUP BY cat.name, f.film_id, f.title
) sub
WHERE rn <= 5
ORDER BY name, "total rentals" DESC, title;
