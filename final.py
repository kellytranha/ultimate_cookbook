from bottle import Bottle, post, get, HTTPResponse, request, response, template, route, static_file
import bottle
import os
import sys
import psycopg2 as pg
import logging
import argparse


#The logging level to control what messages are shown (skipping debug)
logging.basicConfig(level=logging.INFO)

#Our bottle app, using the default. We can store variables in app
app = bottle.default_app()



@get('/')
def index():
    return template('main', page_name='Home', body='Welcome to the Ultimate Cookbook!')

@get('/static/<filepath:path>')
def static(filepath):
    return static_file(filepath, root='static')

# Handle recipe search 
@route('/recipes')
def do_search():
    recipe_name = request.query.get('recipe', '').lower()
    cuisine_name = request.query.get('cuisine', '').lower()

    # creating database_cursor to perform SQL operation
    cursor = app.db_connection.cursor()

    # handle input
    if recipe_name and cuisine_name:
        query = ('SELECT * FROM recipe_data WHERE lower(recipe_name) LIKE %s AND lower(cuisine_name) LIKE %s ORDER BY recipe_id DESC LIMIT 20;', (f'%{recipe_name}%', f'%{cuisine_name}%'))
    elif recipe_name:
        query = ('SELECT * FROM recipe_data WHERE lower(recipe_name) LIKE %s ORDER BY recipe_id DESC LIMIT 20;', (f'%{recipe_name}%',))
    elif cuisine_name:
        query = ('SELECT * FROM recipe_data WHERE lower(cuisine_name) LIKE %s ORDER BY recipe_id DESC LIMIT 20;', (f'%{cuisine_name}%',))
    else:
        query = ('SELECT * FROM recipe_data ORDER BY recipe_id DESC LIMIT 20;', ())

    cursor.execute(query[0], query[1])
    query_result = cursor.fetchall()

    cursor.close()
    return template('query_result', page_name='Recipe Search', results=query_result)

# edit_recipe page
@get('/edit_recipe/<recipe_id>')
def edit_recipe(recipe_id):
    cursor = app.db_connection.cursor()

    cursor.execute('SELECT * FROM recipe WHERE id=%s', (recipe_id, ))
    query_result = cursor.fetchall()
    cursor.execute('SELECT * FROM cuisine')
    cuisines = cursor.fetchall()
    cursor.close()
    print(query_result)
    
    return template('edit_recipe', page_name='Edit Recipe', results=query_result, cuisines=cuisines)

@post('/edit_recipe/<recipe_id>')
def edit_recipe_update(recipe_id):

    recipe_name_new = request.forms.get('recipe_name')
    recipe_descript_new = request.forms.get('recipe_descript')
    prep_time_new = request.forms.get('prep_time')
    cook_time_new = request.forms.get('cook_time')
    cuisine_id_new = request.forms.get('cuisine_id')
    
    cursor = app.db_connection.cursor()

    # handle recipe name input
    if not recipe_name_new:
        cursor.close()
        return template('bad_input', page_name='Bad Recipe Name', body='Recipe name must not null.', recipe_id=recipe_id)

    # handle recipe descript input
    if not recipe_descript_new:
        cursor.close()
        return template('bad_input', page_name='Bad Recipe Descript', body='Recipe description must not null.', recipe_id=recipe_id)

    # handle prep time input
    try:
        prep_time_check = int(prep_time_new)
        if prep_time_check < 0 or prep_time_check > 300:
            cursor.close()
            return template('bad_input', page_name='Bad Prep Time', body='Prep time must be an integer between 0-300.', recipe_id=recipe_id)
    except ValueError:
        cursor.close()
        return template('bad_input', page_name='Bad Prep Time', body='Prep time must be an integer between 0-300.', recipe_id=recipe_id)

    # handle prep time input
    try:
        cook_time_check = int(cook_time_new)
        if cook_time_check < 0 or cook_time_check > 300:
            cursor.close()
            return template('bad_input', page_name='Bad Cook Time', body='Cook time must be an integer between 0-300.', recipe_id=recipe_id)
    except ValueError:
        cursor.close()
        return template('bad_input', page_name='Bad Cook Time', body='Cook time must be an integer between 0-300.', recipe_id=recipe_id)
    
    update_name = ('update recipe set recipe_name =%s where id =%s', (recipe_name_new, recipe_id))
    cursor.execute(update_name[0], update_name[1])

    update_descript = ('update recipe set rep_descript =%s where id =%s', (recipe_descript_new, recipe_id))
    cursor.execute(update_descript[0], update_descript[1])

    update_prep_time = ('update recipe set prep_time =%s where id =%s', (prep_time_new, recipe_id))
    cursor.execute(update_prep_time[0], update_prep_time[1])

    update_cook_time = ('update recipe set cook_time =%s where id =%s', (cook_time_new, recipe_id))
    cursor.execute(update_cook_time[0], update_cook_time[1])

    update_cuisine = ('update recipe set cuisine_id =%s where id =%s', (cuisine_id_new, recipe_id))
    cursor.execute(update_cuisine[0], update_cuisine[1])
   
    return template('success', page_name='Success')

# add recipe page
@get('/add_recipe')
def add_recipe():
    cursor = app.db_connection.cursor()

    cursor.execute('SELECT * FROM cuisine')
    cuisines = cursor.fetchall()

    cursor.close()

    return template('add_recipe', page_name='Add A New Recipe', cuisines=cuisines)

@post('/add_recipe')
def add_recipe_update():

    recipe_name_new = request.forms.get('recipe_name')
    recipe_descript_new = request.forms.get('recipe_descript')
    prep_time_new = request.forms.get('prep_time')
    cook_time_new = request.forms.get('cook_time')
    cuisine_id_new = request.forms.get('cuisine_id')
    
    cursor = app.db_connection.cursor()

    # handle recipe name input
    if not recipe_name_new:
        cursor.close()
        return template('bad_input_add', page_name='Bad Recipe Name', body='Recipe name must not null.')

    # handle recipe descript input
    if not recipe_descript_new:
        cursor.close()
        return template('bad_input_add', page_name='Bad Recipe Descript', body='Recipe description must not null.')

    # handle prep time input
    try:
        prep_time_check = int(prep_time_new)
        if prep_time_check < 0 or prep_time_check > 300:
            cursor.close()
            return template('bad_input_add', page_name='Bad Prep Time', body='Prep time must be an integer between 0-300.')
    except ValueError:
        cursor.close()
        return template('bad_input_add', page_name='Bad Prep Time', body='Prep time must be an integer between 0-300.')

    # handle prep time input
    try:
        cook_time_check = int(cook_time_new)
        if cook_time_check < 0 or cook_time_check > 300:
            cursor.close()
            return template('bad_input_add', page_name='Bad Cook Time', body='Cook time must be an integer between 0-300.')
    except ValueError:
        cursor.close()
        return template('bad_input_add', page_name='Bad Cook Time', body='Cook time must be an integer between 0-300.')
    
    add_new_recipe = 'insert into recipe (recipe_name, rep_descript, prep_time, cook_time, cuisine_id) VALUES (%s, %s, %s, %s, %s)', (recipe_name_new, recipe_descript_new, prep_time_new, cook_time_new, cuisine_id_new,)
    cursor.execute(add_new_recipe[0], add_new_recipe[1])
   
    return template('success', page_name='Success')

@get('/delete_recipe/<recipe_id>')
def edit_recipe(recipe_id):
    cursor = app.db_connection.cursor()
    cursor.execute('SELECT * FROM recipe WHERE id=%s', (recipe_id, ))
    query_result = cursor.fetchall()
    cursor.close()
    
    return template('delete_recipe', page_name='Delete Recipe', results=query_result)

@post('/delete_recipe/<recipe_id>')
def delete_recipe_update(recipe_id):
    cursor = app.db_connection.cursor()
    delete_recipe = ('delete from recipe where id =%s', (recipe_id,))
    cursor.execute(delete_recipe[0], delete_recipe[1])
    return template('success', page_name='Success')

# show_review page
@get('/view_review/<recipe_id>')
def show_comment(recipe_id):
    cursor = app.db_connection.cursor()

    cursor.execute('SELECT * FROM recipe WHERE id=%s', (recipe_id, ))
    query_result = cursor.fetchall()

    cursor.execute('SELECT * FROM review WHERE recipe_id=%s', (recipe_id, ))
    reviews = cursor.fetchall()
    cursor.close()

    
    return template('view_review', page_name='View Reviews', results=query_result, reviews=reviews)

# add recipe page
@get('/add_review/<recipe_id>')
def add_review(recipe_id):
    cursor = app.db_connection.cursor()

    cursor.execute('SELECT * FROM recipe WHERE id=%s', (recipe_id, ))
    query_result = cursor.fetchall()

    cursor.execute('SELECT * FROM review')
    reviews = cursor.fetchall()

    cursor.execute('SELECT * FROM users')
    users = cursor.fetchall()
    cursor.close()

    return template('add_review', page_name='Add A New Review', results=query_result, reviews=reviews, users=users)

@post('/add_review/<recipe_id>')
def add_recipe_update(recipe_id):

    users_id = request.forms.get('users_id')
    recipe_id = request.forms.get('recipe_id')
    rating = request.forms.get('rating')
    content = request.forms.get('review_text')
    
    cursor = app.db_connection.cursor()
    
    # handle recipe descript input
    if not content:
        cursor.close()
        return template('bad_input_review', page_name='Bad Review Text', body='Review Text must not null.', recipe_id=recipe_id)
    
    add_new_review = 'insert into review (users_id, recipe_id, num_of_stars, review_text) VALUES (%s, %s, %s, %s)', (users_id, recipe_id, rating, content)
    cursor.execute(add_new_review[0], add_new_review[1])
    cursor.close()

    return template('success', page_name='Success')

#The main function to start the server
if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "-c","--config",
        help="The path to the .conf configuration file.",
        default="server.conf"
    )
    parser.add_argument(
        "--host",
        help="Server hostname (default localhost)",
        default="localhost"
    )
    parser.add_argument(
        "-p","--port",
        help="Server port (default 53001)",
        default=53001,
        type=int
    )
    parser.add_argument(
        "--nodb",
        help="Disable DB connection on startup",
        action="store_true"
    )

    #Get the arguments
    args = parser.parse_args()
    if not os.path.isfile(args.config):
        logging.error("The file \"{}\" does not exist!".format(args.config))
        sys.exit(1)

    app.config.load_config(args.config)

    # Below is how to connect to a database. We put a connection in the default bottle application, app
    if not args.nodb:
        try:
            app.db_connection = pg.connect(
                dbname = app.config['db.dbname'],
                user = app.config['db.user'],
                password = app.config.get('db.password'),
                host = app.config['db.host'],
                port = app.config['db.port']
            )
            app.db_connection.set_session(autocommit=True)

        except KeyError as e:
            logging.error("Is your configuration file ({})".format(args.config) +
                        " missing options?")
            raise

    try:
        logging.info("Starting Bottle Web Server")
        app.run(host=args.host, port=args.port, debug=True, reloader=True)

    finally:
        #Ensure that the connection opened is closed 
        if not args.nodb:
            app.db_connection.close()
