SELECT first_name || ' ' || last_name AS "Actor Name"
FROM actor
WHERE actor_id IN (
    SELECT DISTINCT fa4.actor_id
    FROM actor a1
    JOIN film_actor fa1 ON a1.actor_id = fa1.actor_id
    JOIN film_actor fa2 ON fa1.film_id = fa2.film_id
    JOIN film_actor fa3 ON fa2.actor_id = fa3.actor_id
    JOIN film_actor fa4 ON fa3.film_id = fa4.film_id
    WHERE a1.first_name = 'RUSSELL' AND a1.last_name = 'BACALL'

    EXCEPT

    SELECT DISTINCT fa2.actor_id
    FROM actor a1
    JOIN film_actor fa1 ON a1.actor_id = fa1.actor_id
    JOIN film_actor fa2 ON fa1.film_id = fa2.film_id
    WHERE a1.first_name = 'RUSSELL' AND a1.last_name = 'BACALL'
)
ORDER BY "Actor Name";
