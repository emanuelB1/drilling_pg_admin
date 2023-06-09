-- Construye las siguientes consultas:

-- • Aquellas usadas para insertar, modificar y eliminar un Customer, Staff y Actor.
-- insertar customer
INSERT INTO customer (store_id, first_name, last_name, email, address_id, activebool, create_date, last_update)
VALUES (1, 'John', 'Doe', 'johndoe@example.com', 1, true, CURRENT_DATE, CURRENT_TIMESTAMP);
-- Insertar un nuevo Staff
INSERT INTO staff (first_name, last_name, address_id, email, store_id, active, username, password, last_update)
VALUES ('Jane', 'Smith', 2, 'janesmith@example.com', 1, true, 'janes', 'mypassword', CURRENT_TIMESTAMP);
-- Insertar un nuevo Actor
INSERT INTO actor (first_name, last_name, last_update)
VALUES ('Tom', 'Hanks', CURRENT_TIMESTAMP);
-- Modificar un Customer existente
UPDATE customer
SET email = 'newemail@example.com'
WHERE customer_id = 1;
-- Modificar un Staff existente
UPDATE staff
SET password = 'newpassword'
WHERE staff_id = 1;
-- Modificar un Actor existente
UPDATE actor
SET last_name = 'Cruise'
WHERE actor_id = 1;
-- Eliminar un Customer
DELETE FROM customer
WHERE customer_id = 1;
-- Eliminar un Staff
DELETE FROM staff
WHERE staff_id = 1;
-- Eliminar un Actor
DELETE FROM actor
WHERE actor_id = 1;

-- • Listar todas las “rental” con los datos del “customer” dado un año y mes.
SELECT * FROM rental;
SELECT r.rental_id, c.customer_id, c.first_name, c.last_name, r.rental_date
FROM rental r
JOIN customer c ON r.customer_id = c.customer_id
WHERE EXTRACT(YEAR FROM r.rental_date) = '2005'
  AND EXTRACT(MONTH FROM r.rental_date) = '08';
  
-- • Listar Número, Fecha (payment_date) y Total (amount) de todas las “payment”.
SELECT payment_id AS "Número", payment_date AS "Fecha", amount AS "Total"
FROM payment;

-- • Listar todas las “film” del año 2006 que contengan un (rental_rate) mayor a 4.0.
SELECT * FROM film
WHERE release_year = '2006' AND rental_rate > 4.0;

--  Realiza un Diccionario de datos que contenga el nombre de las tablas y columnas, si éstas pueden ser nulas, y su tipo de dato correspondiente
SELECT table_name AS "Nombre Tabla", column_name AS "Nombre Columna", is_nullable AS "Acepta Nulos", data_type AS "Tipo de Dato"
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name IN ('actor', 'address', 'category', 'city', 'country', 'customer', 'film', 'film_actor',
                     'film_category', 'inventory', 'language', 'payment', 'rental', 'staff', 'store')
ORDER BY table_name;