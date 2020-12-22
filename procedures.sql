-----------------------------------------------------------------------------------------------------
-- #1 
-- keep track of email changes from the table users
drop function if exists email_log() cascade;
create or replace function email_log()
    returns trigger
    language plpgsql
    as 
$$
begin 
    if new.email <> old.email then 
        insert into logs(user_id, user_name, previous_email)
        values (old.id, old.username, old.email);
    end if;

    return new;

end;
$$
;
--------------------------------------------------------------------------------------------------
-- #2 
-- enforces the username has to be between 5 and 10 characters when a new user is created 
drop function if exists check_username_length() cascade;
create or replace function check_username_length()
    returns trigger
    language plpgsql
    as 
$$
begin
    if length(NEW.username) < 5 or length(NEW.username) > 10  then
        raise exception 'Error: Username must be between 5 and 10 characters.';
    end if;
    return new;
    
end
$$
;
-----------------------------------------------------------------------------------------------------
-- #3
-- log changes when we add new author
drop function if exists message_new_author() cascade;
CREATE OR REPLACE FUNCTION message_new_author()
  RETURNS TRIGGER
  LANGUAGE PLPGSQL
  AS
$$
BEGIN
  INSERT INTO add_author VALUES ('New author is added');
	RETURN NEW;
END;
$$
;
-----------------------------------------------------------------------------------------------------
-- #4
-- display a message
drop function if exists display_message(INOUT msg TEXT) cascade;
CREATE OR REPLACE FUNCTION display_message(INOUT msg TEXT)
  LANGUAGE PLPGSQL
  AS
$$
BEGIN
  RAISE NOTICE 'Message: %', msg ;
END;
$$
;

