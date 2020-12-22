-- view healthy_authors to list all authors who write recipe in category 'Salads' or 'Healthy Diet' (simplified querying)

drop view if exists healthy_authors;

create view healthy_authors as select author_name, author_id from author join recipe on author.id = recipe.author_id join category on recipe.category_id = category.id where cat_name = 'Healthy Diet' or cat_name = 'Salads';

-- view celebrities_photos list all authors who are "liked" by the users from Korea (simplified querying)

drop view if exists authors_for_korean;

create view authors_for_korean as select author.id as author_id, author.author_name, author.country from users join rate on users.id = rate.users_id join author on rate.author_id = author.id where rate.num_of_like = 1 and users.country = 'Korea';

-- view popular_authors to list all authors whose have total recipe views > average view of all recipes (simplified querying)

drop view if exists popular_authors;

create view popular_authors as select t.* from ( select author.id, author.author_name, sum(recipe.views) as total_views from author left join recipe on author.id = recipe.author_id where recipe.author_id is not null group by author.id ) t where t.total_views > (select avg(recipe.views) from recipe);

