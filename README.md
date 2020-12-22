Welcome to Ultimate Cookbook! 

Database Final Project by Kelly Tran

This is a simple PostgreSQL database webapp using using Python's bottle framework and Bootstrap. 

Please run drop_tables.sql, create_db.sql and populate_db.sql before running the app.

For this application, I built a series of screens/functions around a particular relation/table Recipe (RelationX) and Review (RelationY), an relation that has a foreign key relationship with RelationX.


Home page (0): have a form that allows user to search for a record of RelationX by 2 different attributes. 
-> User can look up a recipe by name or cuisine. Both of them are wildcard search. User can fill in one, both, or neither fields. The site will run a conjunctive search and generate the best match based on the input. If neither search field is populated, the site will show all (up to 20) records in the recipe database.

The search result page shows the below:

(1): Recipe ID, Recipe Name, Description, Cuisine of each record of the result.

(2): A link to view and/or update the record (Category ID and Author ID are fkeys).

(3): A button or link to delete the Recipe record.

(4): A link to view a table of all Review records for this particular Recipe record.

(5): A link to create a new Review record that is linked to this particular Recipe record.

(6): A link to create a new Recipe record that appear on top of the search result (Author ID and Category ID are None by default).

Error handling for all attributes have been implemented. You may use recipe with id = 20 as an example.



