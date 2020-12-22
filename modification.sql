-- Data Modifications (at least 2 each of the 4 types of data modifications - 8 in total)
-- Each modification should have a short comment explaining its function.
-- They should not be too similar to each other.
-- They should not return errors and must affect your database.

-- Insert a single tuple
insert into author values (21, 'Kelly Tran', 'Vietnam');
insert into category values (21, 'Food Medicine');

-- Insert using a output control (insert using select)

-- Insert all cuisine objects into table category
insert into category select id + 25, cui_name from cuisine;
-- Insert all author objects who are not from Korea into table users
insert into users select id + 25, author_name, country from author where author.country != 'Korea';

-- Delete all reviews of the authors by the users where num_of_like = 0
delete from rate where num_of_like = 0;

-- Delete all reviews of the recipes by the users where review_text length < 100
delete from review where length(review_text) < 100;

-- Update user id = 1
update users set username = 'gacut3', country = 'Vietnam' where id = 1;

-- Update all authors' county Hong Kong -> HK
update author set country = 'HK' where country = 'Hong Kong';