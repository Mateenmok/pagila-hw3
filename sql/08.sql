SELECT DISTINCT f2.title
FROM film f1
JOIN inventory i1 ON f1.film_id = i1.film_id
JOIN rental r1 ON i1.inventory_id = r1.inventory_id
JOIN rental r2 ON r1.customer_id = r2.customer_id
JOIN inventory i2 ON r2.inventory_id = i2.inventory_id
JOIN film f2 ON i2.film_id = f2.film_id
WHERE f1.title = 'BUCKET BROTHERHOOD'
  AND f2.title != 'BUCKET BROTHERHOOD'
GROUP BY f2.film_id, f2.title
HAVING count(DISTINCT r1.customer_id) >= 3
ORDER BY f2.title;
