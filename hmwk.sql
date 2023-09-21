-- 1. List all customers who live in Texas (use JOINS)
SELECT first_name, last_name, district
FROM customer
INNER JOIN address
ON address.address_id = customer.address_id
WHERE district = 'Texas';

-- 2. Get all payments above $6.99 with the Customer's Full Name
SELECT first_name, last_name, amount FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99;

-- 3. Show all customers names who have made payments over $175(use subqueries)
SELECT first_name, last_name
FROM customer
WHERE (SELECT SUM(amount) FROM payment) > 175;

-- 4. List all customers that live in Nepal (use the city table)
SELECT city, country FROM city
INNER JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';

-- 5. Which staff member had the most transactions?
SELECT first_name, last_name, COUNT(rental_date) FROM staff
INNER JOIN rental
ON staff.staff_id = rental.staff_id
GROUP BY first_name, last_name
ORDER BY COUNT(rental_date) DESC;

-- 6. How many movies of each rating are there?
SELECT rating, COUNT(rating)
FROM film
GROUP BY rating;

-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT first_name, last_name
FROM customer
WHERE EXISTS (
    SELECT 1
    FROM payment
    WHERE customer.customer_id = payment.customer_id
    AND amount > 6.99
);

-- 8. How many free rentals did our stores give away?
SELECT COUNT(rental_date) FROM rental
INNER JOIN payment
ON rental.rental_id = payment.rental_id
WHERE amount = 0;