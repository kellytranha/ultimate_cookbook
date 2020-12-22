drop table if exists author;
create table author (
    id serial not null primary key,
    author_name varchar(50) not null,
    country varchar(50) not null
    
);

drop table if exists category;
create table category (
    id serial not null primary key,
    cat_name varchar(50) not null
);

drop table if exists cuisine;
create table cuisine (
    id serial not null primary key,
    cui_name varchar(50) not null
);


drop table if exists recipe;
create table recipe (
    id serial not null primary key,
    recipe_name text not null,
    rep_descript text not null,
    prep_time integer not null,
    cook_time integer not null,
    category_id integer,
    cuisine_id integer not null,
    author_id integer,
    views integer,
    foreign key (author_id) references author(id) ON DELETE CASCADE,
    foreign key (category_id) references category(id) ON DELETE CASCADE,
    foreign key (cuisine_id) references cuisine(id) ON DELETE CASCADE
);


drop table if exists ingredient;
create table ingredient (
    id serial not null primary key,
    recipe_id integer not null,
    ingre_name varchar(50) not null,
    foreign key (recipe_id) references recipe(id) ON DELETE CASCADE
);

drop table if exists quantity;
create table quantity (
    recipe_id integer not null,
    ingredient_id integer not null,
    quantity float not null,
    measurement varchar(50) not null,
    primary key (recipe_id, ingredient_id),
    foreign key (ingredient_id) references ingredient(id) ON DELETE CASCADE,
    foreign key (recipe_id) references recipe(id) ON DELETE CASCADE
);


drop table if exists instruction;
create table instruction (
    recipe_id integer not null primary key,
    method_descript text not null,
    foreign key (recipe_id) references recipe(id) ON DELETE CASCADE
);

drop table if exists note;
create table note (
    recipe_id integer not null primary key,
    note_descript text not null,
    foreign key (recipe_id) references recipe(id) ON DELETE CASCADE
);

drop table if exists users;
create table users (
    id serial not null primary key,
    username varchar(50) not null,
    country varchar(50) not null,
    email varchar(50) not null
);

drop table if exists review;
create table review (
	id serial not null primary key,
    users_id integer not null,
    recipe_id integer not null,
    num_of_stars smallint not null,
    review_text text not null,
    constraint num_of_stars_check check (((num_of_stars >= 1) and (num_of_stars <= 5))),
    foreign key (recipe_id) references recipe(id) ON DELETE CASCADE,
    foreign key (users_id) references users(id) ON DELETE CASCADE

);

drop table if exists rate;
create table rate (
    users_id integer not null,
    author_id integer not null,
    num_of_like smallint not null,
    review_text text not null,
    constraint num_of_like_check check (((num_of_like >= 0) and (num_of_like <= 1))),
    primary key (users_id, author_id),
    foreign key (author_id) references author(id) ON DELETE CASCADE,
    foreign key (users_id) references users(id) ON DELETE CASCADE
);

-- Create table logs - users
DROP TABLE IF EXISTS logs;
create table logs
    (id serial not null primary key, 
     user_id int not null,  
	 user_name varchar(50) not null,
     previous_email varchar(50) not null
);

-- create trigger table to display a message
DROP TABLE IF EXISTS message_display;
CREATE TABLE message_display(
		message VARCHAR(100),
		author_id INT
);

--create new trigger tables to log changes when add new author
DROP TABLE IF EXISTS add_author;
CREATE TABLE add_author(
		message VARCHAR(100)
);

-- Create view recipe_data
drop view if exists recipe_data;
create view recipe_data as (select recipe.id as recipe_id, recipe_name, rep_descript, cui_name as cuisine_name from recipe inner join cuisine on recipe.cuisine_id = cuisine.id);