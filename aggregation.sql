-- Aggregation Queries (at least 3)
-- Each query should have a short comment explaining its function.
-- The queries should not be too simplistic or too similar to each other.
-- The queries should not return errors or empty sets we want to see results

-- Query the max cook_time of all recipe;
select max(cook_time) from recipe;

-- Query the list of top 5 cuisines with the most recipe's views.
select cui_name as cuisine, sum(views) as total_view from recipe inner join cuisine on recipe.cuisine_id = cuisine.id group by cui_name order by sum(views) desc limit 5;

-- uery the number of countries where the users come from 
select count(country) from users;