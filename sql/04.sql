SELECT DISTINCT first_name, last_name
FROM actor
JOIN film_actor USING (actor_id)
JOIN film_category USING (film_id)
JOIN category USING (category_id)
WHERE category.name = 'Children'
EXCEPT
SELECT DISTINCT first_name, last_name
FROM actor
JOIN film_actor USING (actor_id)
JOIN film_category USING (film_id)
JOIN category USING (category_id)
WHERE category.name = 'Horror'
ORDER BY last_name, first_name;
