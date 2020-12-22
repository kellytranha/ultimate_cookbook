-----------------------------------------------------------------------------------------------------
-- #1
-- Query all authors whose have total recipe views > average view of all recipes not in category Lunch

create index recipe_author_category_idx on recipe (author_id, category_id);-- would speed up the search 50s vs 30s
-- select t.* from ( select author.id, author.author_name, sum(recipe.views) as total_views from author left outer join recipe on author.id = recipe.author_id left outer join category on recipe.category_id = category.id where cat_name != 'Lunch' group by author.id ) t where t.total_views > (select avg(recipe.views) from recipe) order by total_views desc limit 20;
-----------------------------------------------------------------------------------------------------
-- #2
-- Query all authors who are not from Korea and liked by the users 
-- select author.author_name, author.country from users join rate on users.id = rate.users_id join author on rate.author_id = author.id where author.country != 'Korea' and rate.num_of_like = 1;
create index author_name_country_idx on author (author_name, country);
-- -- would speed up the search 35s vs 30s
