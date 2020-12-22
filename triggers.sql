-----------------------------------------------------------------------------------------------------
-- #1 Trigger keeps track of email changes in a users table, 
-- previous emails are stored in a logs table.
drop trigger if exists users_change_email on users CASCADE;
create trigger users_change_email
    before update 
    on users
    for each row
    execute procedure email_log();
--------------------------------------------------------------------------------------------------
-- #2 Trigger enforces the username has to be between 5 and 10 characters when a new user is created 
--  integrity constraint on the database
drop trigger if exists users_check_username on users CASCADE;
create trigger users_check_username
    before insert 
    on users
    for each row
    execute procedure check_username_length();
-----------------------------------------------------------------------------------------------------
-- #3 Trigger tracks of changes when adding new author. 
-- "New author is added" is displayed when a new author is added
DROP TRIGGER IF EXISTS new_author ON author CASCADE;
CREATE TRIGGER new_author
  BEFORE INSERT
  ON author
  FOR EACH ROW
  EXECUTE PROCEDURE message_new_author();

