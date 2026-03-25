SELECT title FROM film WHERE film_id IN (
    SELECT fa2.film_id
    FROM film_actor fa1
    JOIN film_actor fa2 USING (actor_id)
    JOIN film f1 ON fa1.film_id = f1.film_id
    WHERE f1.title = 'AMERICAN CIRCUS'
    INTERSECT
    SELECT fa2.film_id
    FROM film_actor fa1
    JOIN film_actor fa2 USING (actor_id)
    JOIN film f1 ON fa1.film_id = f1.film_id
    WHERE f1.title = 'ACADEMY DINOSAUR'
    INTERSECT
    SELECT fa2.film_id
    FROM film_actor fa1
    JOIN film_actor fa2 USING (actor_id)
    JOIN film f1 ON fa1.film_id = f1.film_id
    WHERE f1.title = 'AGENT TRUMAN'
)
ORDER BY title;
