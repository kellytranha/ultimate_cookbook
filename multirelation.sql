-- This criterion is linked to a Learning OutcomeMultirelation Queries (at least 5 queries referencing more than one table)
-- Each query should have a short comment explaining its function.
-- At least two queries should involve subqueries.
-- The queries should not return errors or empty sets (we want to see results)
-- Too earn full credit the queries should not be too simplistic or too similar to each other.


-- Query the list of all authors who create recipes in category "Salads" or "Healthy Diet"
select distinct author_name, cat_name as category from author join recipe on author.id = recipe.author_id join category on recipe.category_id = category.id where cat_name = 'Salads' or cat_name = 'Healthy Diet';

-- Query the list of all authors who are "liked" by the users from the US
select distinct author_name from users join rate on users.id = rate.users_id join author on rate.author_id = author.id where rate.num_of_like = 1 and users.country = 'United States';

-- Query all authors whose recipes have been reviewed at least once
select distinct author_name from author left join recipe on recipe.author_id = author.id where recipe.author_id is not null and recipe.id in (select distinct review.recipe_id from review);

-- Query all authors whose have total recipe views > average view of all recipes (as author_name, total_views)
select t.* from ( select author.author_name, sum(recipe.views) as total_views from author left join recipe on author.id = recipe.author_id where recipe.author_id is not null group by author.id ) t where t.total_views > (select avg(recipe.views) from recipe);

-- Query all the authors that have some rating
SELECT * from author
LEFT JOIN rate on author.id = rate.author_id
WHERE author_id IS NOT NULL;