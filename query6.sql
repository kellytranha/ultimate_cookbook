-----------------------------------------------------------------------------------------------------
-- #1
-- Query the list of top 10 cuisines with the most recipe's views that is not Korean cuisine and not in Breakfast category inner join

select cui_name as cuisine, sum(views) as total_view from recipe inner join cuisine on recipe.cuisine_id = cuisine.id inner join category on recipe.category_id = category.id where cat_name != 'Breakfast' group by cui_name having cui_name != 'Korean' order by sum(views) desc limit 10;

-----------------------------------------------------------------------------------------------------
-- #2
-- Query all authors who are not from Korea and liked by the users 
select author.author_name, author.country from users join rate on users.id = rate.users_id join author on rate.author_id = author.id where author.country != 'Korea' and rate.num_of_like = 1;
-- create index author_name_country_idx on author (author_name, country);
-- would speed up the search


-----------------------------------------------------------------------------------------------------
-- #3
-- Query all authors whose have total recipe views > average view of all recipes not in category Lunch
-- create index recipe_author_category_idx on recipe (author_id, category_id);-- would speed up the search 
select t.* from ( select author.id, author.author_name, sum(recipe.views) as total_views from author left outer join recipe on author.id = recipe.author_id left outer join category on recipe.category_id = category.id where cat_name != 'Lunch' group by author.id ) t where t.total_views > (select avg(recipe.views) from recipe) order by total_views desc limit 20;

-----------------------------------------------------------------------------------------------------
-- #4
-- Query the number of 'long review' for review's length >= 100 else 'long review' and the user and author of one review are not from the same country
select count(distinct users.id), case when length(review_text) >= 100 then 'long review' else 'short review' end as review_type from review join users using (id) join author on author.country != users.country group by review_type;