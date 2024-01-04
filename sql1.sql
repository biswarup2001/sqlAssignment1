use mavenmovies;

-- identify the primary keys and foreign keys in maven movies db. discuss the deifferences
-- The major differences between primary key and foreign key is primary key uniquely identify a record in atable, while foreign key establish a link between table
select*from information_schema.key_coulmn_usage;

-- list all details of actors
select*from actor;

-- list all customer information from DB.
select*from customer;

-- list different countries.
select distinct country from country;

-- display all active customer.
select customer_id,first_name,last_name,email from customer where 'active'=1;

-- list of all rental IDs for customer with ID 1.
select rental_id from rental where customer_id=1;

-- display all the films whose rental duration is greater than 5.alter
select film_id,title from film where rental_duration > 5;

-- list the total number of films whose replacement cost is greater than $15 and less than $20.
select count(*) from film where replacement_cost >15 and replacement_cost <20;
 
 -- display the count of unique first name of actors.
 select count(distinct first_name) from actor;
 
 -- display the first 10 records from the customer table.
 select*from customer limit 10;
 
 -- display the first 3 records from the customer table whose first name starts with 'b'.
 select*from customer where first_name like 'b%' limit 3;
 
 -- display the names of first 5 movies which are rated as G.
 select title from film where rating='G' limit 5;
 
 -- find all customers whose first name starsts with "a".
 select*from customer where first_name like "a%";
 
 -- find all customer whose first name ends with "a".
 select*from customer where first_name like"%a";
 
-- display the list of first 4 cities which start and end with 'a'.
select city from city where city like 'a%a' limit 4;

-- find all customer whose first name have "NI" in any position.
select first_name from customer where first_name like '%ni%';

-- find all customers whose first name have "r" in the second position.
select first_name from customer where first_name like '_r%';

-- find all customers whose first name starts with "a" and are at least 5 charcter in length.
select first_name from customer where first_name like 'a____%';

-- find all customer whose first name starts with "a" and ends with "o".
select first_name from customer where first_name like 'a%o';

-- Get the films with pg and pg-13 rating using IN operator.
select title,rating from film where rating in("pg","pg-13");

-- Get the films with length between 50 to 100 using betweeen operator.
select title,length from film where length between 50 and 100;

-- Get the top 50 actors using limit operator.
select*from actor order by actor_id desc limit 50;

-- Get the distinct film ids from inventory table 
select distinct film_id from inventory;