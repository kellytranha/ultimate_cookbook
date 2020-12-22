-----------------------------------------------------------------------------------------------------
-- #1 
-- validate emails in the users table, 
-- if it does not follow to the format, then you cannot enter the user.
UPDATE users
SET email = 'coleman@uchicago.edu'
WHERE ID = 1;

select * from users order by id asc limit 1;
select * from logs;
--------------------------------------------------------------------------------------------------
-- #2 Example that satisfies username length requirements
insert into users(id, username, country, email) values (21, 'kellytran', 'Vietnam', 'kellytran@uchicago.edu');
select * from users order by id desc limit 1;

-- Example that does not satisfy username length requirements 
insert into users(id, username, country, email) values (22, 'kellytrankellytranlengthy', 'Vietnamm', 'kellytran1@uchicago.edu');
-- does not insert new value
select * from users order by id desc limit 1;
-----------------------------------------------------------------------------------------------------
-- #3 Trigger tracks of changes when adding new author. 
-- Example that activate the trigger
insert into author values (21, 'Kelly Chen', 'USA');
insert into author values (22, 'Kelly Chon', 'France');
-- Example that does not activate the trigger because it only updates a tuple
UPDATE author
SET country = 'Korea'
WHERE id = 20;
--check log changes
select * from add_author;

