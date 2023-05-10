-- 1

SELECT *
FROM owners
FULL JOIN vehicles ON owners.id = vehicles.owner_id;

-- 2

SELECT o.first_name,
       o.last_name,
       COUNT(v.owner_id)
FROM owners o
JOIN vehicles v ON o.id = v.owner_id
GROUP BY o.id
ORDER BY o.first_name;

-- 3

SELECT o.first_name,
       o.last_name,
       ROUND(AVG(v.price)) AS average_price,
       COUNT(o.id)
FROM owners o
JOIN vehicles v ON o.id = v.owner_id
GROUP BY o.id
HAVING ROUND(AVG(v.price)) > 10000
AND COUNT(o.id) > 1
ORDER BY o.first_name DESC;