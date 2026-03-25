SELECT actor_id, first_name, last_name, film_id, title, rank, revenue
FROM (
    SELECT
        a.actor_id,
        a.first_name,
        a.last_name,
        f.film_id,
        f.title,
        rank() OVER (PARTITION BY a.actor_id ORDER BY sum(p.amount) DESC, f.film_id) AS rank,
        sum(p.amount) AS revenue
    FROM actor a
    JOIN film_actor fa USING (actor_id)
    JOIN film f USING (film_id)
    JOIN inventory i USING (film_id)
    JOIN rental r USING (inventory_id)
    JOIN payment p ON r.rental_id = p.rental_id
    GROUP BY a.actor_id, a.first_name, a.last_name, f.film_id, f.title
) sub
WHERE rank <= 3
ORDER BY actor_id, rank;
