-- Schema Modifications (at least 1 each of the 3 types of schema modifications - 3 in total ADD column, ALTER column, DROP column)
-- Each modification should have a short comment explaining its function.
-- They should not be too similar to each other.
-- They should not return errors and must affect your database.

-- Add column email into users table
alter table users add email varchar(50);

-- Change review table: num_of_stars <= 6 instead of 5
-- alter table users alter email varchar(20);

alter table recipe drop column rep_descript;