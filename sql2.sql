use mavenmovies;

-- Retrive the total number of rentals made in the sakila database.
select count(rental_id) AS total_no_of_rentals from rental;

-- find the average rental durtion (in days ) of movies rented from the sakila database. 
select avg(datediff(return_date,rental_date)) as average_duration_in_days from rental;

-- display the first name and last name of customer uppercase .
select upper(first_name) as upper_first_name, upper(last_name) as upper_last_name from actor;

-- Extract the monnth from  the rental date and display it alongside the rental ID.
select rental_id, month(rental_date)as rental_month from rental;

-- Retrive the countof rentals for each customer(display customer id and the count of renntals).
select c.customer_id,count(r.rental_id)as rental_count from customer c left join rental r on c.customer_id=r.customer_id group by c. customer_id;

-- find theb total revenue generated by each store.
SELECT 
    s.store_id, SUM(p.amount) AS total_revenue
FROM
    store s
        JOIN
    staff st ON s.store_id = st.store_id
        JOIN
    payment p ON st.staff_id = p.staff_id
GROUP BY s.store_id;

-- Display the title of the movie, customer s first name, and last name who rented it.
SELECT 
    f.title AS movie_title, c.first_name, c.last_name
FROM
    film f
        JOIN
    inventory i ON f.film_id = i.film_id
        JOIN
    rental r ON i.inventory_id = r.inventory_id
        JOIN
    customer c ON r.customer_id = c.customer_id;
    
    -- Retrive the   of all actors who have appeared in the film "GONE wiith the wind"
SELECT 
    a.first_name, a.last_name
FROM
    actor a
        JOIN
    film_actor fa ON a. actor_id = fa. actor_id
        JOIN
    film f ON fa. film_id = f.film_id
WHERE
    f.title = 'GONE with the wind';
    
    -- Determine the total number of rental for each category of movies.
SELECT 
    fc.category_id, COUNT(r.rental_id) AS rental_count
FROM
    rental r
        JOIN
    inventory i ON r.inventory_id = i.inventory_id
        JOIN
    film f ON i.film_id = f.film_id
        JOIN
    film_category fc ON f.film_id = fc.film_id
GROUP BY fc.category_id;

-- find the average rental rate of movies in each language.
select l.name as language,avg(f.rental_rate) as svg_rental_rate from film f join language l on f.language_id=l.language_id group by l.name;

-- Retrive the cuustomer nammes along with the total amount they've spent on rentals.
SELECT 
    c.first_name,
    c.last_name,
    SUM(p.amount) AS total_amount_spent
FROM
    customer c
        JOIN
    payment p ON c.customer_id = p.customer_id
        JOIN
    rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id;

-- list theh titles of movies rented by each customer in a particular city
SELECT 
    c.first_name, c.last_name, f.title AS rented_movie_title
FROM
    customer c
        JOIN
    address a ON c.address_id = a.address_id
        JOIN
    city ci ON a.city_id = ci.city_id
        JOIN
    rental r ON c.customer_id = r.customer_id
        JOIN
    inventory i ON r.inventory_id = i.inventory_id
        JOIN
    film f ON i.film_id = f.film_id
WHERE
    ci.city = 'london'
ORDER BY c.first_name , c.last_name , f.title;

-- display the top 5 rented movies along with the number of times they've been rented.
SELECT 
    f.title AS movie_title, COUNT(*) AS rental_count
FROM
    film f
        JOIN
    inventory i ON f.film_id = i.film_id
        JOIN
    rental r ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY rental_count DESC
LIMIT 5;

-- determine the cuustomer who   have rented movies from both stores
SELECT 
    c.customer_id, c.first_name, c.last_name
FROM
    customer c
        JOIN
    rental r ON c.customer_id = r.customer_id
        JOIN
    inventory i ON r.inventory_id = i.inventory_id
        JOIN
    store s ON i.store_id = s.store_id
WHERE
    s.store_id IN (1 , 2)
GROUP BY c.customer_id , c.first_name , c.last_name
HAVING COUNT(DISTINCT s.store_id) = 2;