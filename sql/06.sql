SELECT DISTINCT a2.first_name || ' ' || a2.last_name AS "Actor Name"
FROM actor a1
JOIN film_actor fa1 USING (actor_id)
JOIN film_actor fa2 USING (film_id)
JOIN actor a2 ON fa2.actor_id = a2.actor_id
WHERE a1.first_name = 'RUSSELL' AND a1.last_name = 'BACALL'
  AND a2.actor_id != a1.actor_id
ORDER BY "Actor Name";
