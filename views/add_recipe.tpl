% include('header.tpl')
<!-- Main content should go here-->
<h1>{{ page_name }}</h1>
<h5>Fill out the form to add a new recipe</h5>

<form action="/add_recipe" method="post">
  <div class="form-group">
    <label for="recipe_name">Recipe Name: (must not null)</label>
    <div>
      <input id="recipe_name_field" type="text" class="form-control" name="recipe_name" placeholder="Enter a recipe name">
    </div>
  </div>
  <div class="form-group">
    <label for="recipe_descript">Description: (must not null)</label>
    <div>
      <input id="recipe_descipt_field" type="text" class="form-control" name="recipe_descript" placeholder="Enter a recipe description">
    </div>
  </div>
  <div class="form-group">
    <label for="prep_time">Prep Time: (must be an integer between 0-300)</label>
    <div>
      <input id="prep_time_field" type="text" class="form-control" name="prep_time" placeholder="Enter prep time in minutes">
    </div>
  </div>
  <div class="form-group">
    <label for="cook_time">Cook Time: (must be an integer between 0-300)</label>
    <div>
      <input id="cook_time_field" type="text" class="form-control" name="cook_time" placeholder="Enter cook time in minutes">
    </div>
  </div>
  
  <div class="form-group">
    <label for="cuisine_name">Cuisine:</label>
    <select class="form-control" name="cuisine_id">
      % for item in cuisines:
        <option value="{{item[0]}}">{{item[0]}} - {{item[1]}}</option>
      % end
    </select>
  </div>
  <div>
    <button type="submit" class="btn btn-success mb-2">Add</button>
  </div>
</form>
% include('footer.tpl')
