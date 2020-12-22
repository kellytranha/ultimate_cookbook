-- Query from proj4
-- Query the list of all authors who create recipes in category "Salads" or "Healthy Diet"
-- select distinct author_name, cat_name as category from author join recipe on author.id = recipe.author_id join category on recipe.category_id = category.id where cat_name = 'Salads' or cat_name = 'Healthy Diet';

-- Modified query: Query the ids of all authors who create recipes in category "Salads" or "Healthy Diet"

-- select id from author having author_name = (select author_name from healthy_authors);

---------------------------------------------------------------------------------------------------------
-- #1
-- Query the list of top 3 cuisines with the most recipe's views that is not Korean - similar to last week's query - GROUP BY 1, HAVING, JOIN ON
select cui_name as cuisine, sum(views) as total_view from recipe inner join cuisine on recipe.cuisine_id = cuisine.id group by cui_name having cui_name != 'Korean' order by sum(views) desc limit 3;

---------------------------------------------------------------------------------------------------------
-- #2
-- Query all authors whose have total recipe views > average view of all recipes (as author_name, total_views) - similar to last week - GROUP BY 2, OUTER JOIN
select t.* from ( select author.author_name, sum(recipe.views) as total_views from author left outer join recipe on author.id = recipe.author_id where recipe.author_id is not null group by author.id) t where t.total_views > (select avg(recipe.views) from recipe);

---------------------------------------------------------------------------------------------------------
-- #3
-- Query the list of all users id and review type 'long review' for review's length >= 100 else 'long review' - CASE, JOIN USING
select id, case when length(review_text) >= 100 then 'long review' else 'short review' end as review_type from review join users using (id);

---------------------------------------------------------------------------------------------------------
-- #4 Query the list of all authors from asia who create more than 2 recipes - TEMP TABLE
drop table if exists authors_from_asia;

create table authors_from_asia as (select * from author where country = 'Thailand' or country = 'Korea' or country = 'Hong Kong' or country = 'Cambodia' or country = 'Vietnam');

select country from authors_from_asia as author inner join recipe on author.id = recipe.author_id group by country having count(author.id) >= 2;

---------------------------------------------------------------------------------------------------------
-- #5 - VIEW 1 Similar to 2 but only for authors from the healthy_authors view
select t.* from ( select healthy_authors.author_name, sum(recipe.views) as total_views from healthy_authors left outer join recipe on healthy_authors.author_id = recipe.author_id where recipe.author_id is not null group by healthy_authors.author_name) t where t.total_views > (select avg(recipe.views) from recipe);

---------------------------------------------------------------------------------------------------------
-- #6 VIEW 2
-- Query all authors liked by users from Korean and has number of view > 10
select distinct author_name from authors_for_korean left join recipe on recipe.author_id = authors_for_korean.author_id where recipe.views > 10;

---------------------------------------------------------------------------------------------------------
-- #7 VIEW 3
-- Query all popular authors whose recipes are not Indian cuision
select distinct author_name from popular_authors left join recipe on recipe.author_id = popular_authors.id left join cuisine on recipe.cuisine_id = cuisine.id where cui_name != 'Indian';
