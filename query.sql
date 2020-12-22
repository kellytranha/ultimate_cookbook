-- Query the list of unique ingredients from the database (given as pantry)
select distinct ingre_name as pantry from ingredient;

-- Query the list of the 5 most-viewed recipes from the database (given as title, views)
select title, views from recipe order by views desc limit 5;

-- Query the list of authors from Korea whose name icludes "Mike" (given as author_name, country)
select author_name, country from author where country = 'Korea' and author_name like '%Mike%';

-- Query the list of review_text of reviews for recipe #3 which were 
-- given 5 stars and sort by users_id (given as users_id, review_text)
select users_id, review_text from review where recipe_id = 3 and num_of_stars = 5 order by users_id;