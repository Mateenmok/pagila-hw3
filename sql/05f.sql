SELECT title FROM film WHERE film_id IN (
    SELECT fc2.film_id
    FROM film_category fc1
    JOIN film_category fc2 USING (category_id)
    JOIN film f1 ON fc1.film_id = f1.film_id
    WHERE f1.title = 'AMERICAN CIRCUS'
    GROUP BY fc2.film_id
    HAVING count(DISTINCT fc1.category_id) >= 2
    INTERSECT
    SELECT fa2.film_id
    FROM film_actor fa1
    JOIN film_actor fa2 USING (actor_id)
    JOIN film f1 ON fa1.film_id = f1.film_id
    WHERE f1.title = 'AMERICAN CIRCUS'
)
ORDER BY title;
