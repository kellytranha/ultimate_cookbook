% include('header.tpl')
<!-- Main content should go here-->

<h1>{{page_name}}</h1>
<h5>Are you sure to delete this recipe from the database?</h5>

<form action="" method="post">
  <div class="form-group">
    <label for="recipe_id">Recipe ID:</label>
    <div>
      <input type="text" class="form-control" name="recipe_id" value="{{results[0][0]}}" readonly>
    </div>
  </div>
  <div class="form-group">
    <label for="recipe_name">Recipe Name:</label>
    <div>
      <input type="text" class="form-control" name="recipe_name" value="{{results[0][1]}}" readonly>
    </div>
  </div>
  <div class="form-group">
    <label for="recipe_descript">Description:</label>
    <div>
      <input type="text" class="form-control" name="recipe_descript" value="{{results[0][2]}}" readonly>
    </div>
  </div>
  <div class="form-group">
    <label for="prep_time">Prep Time:</label>
    <div>
      <input type="text" class="form-control" name="prep_time" value="{{results[0][3]}}" readonly>
    </div>
  </div>
  <div class="form-group">
    <label for="cook_time">Cook Time:</label>
    <div>
      <input type="text" class="form-control" name="cook_time" value="{{results[0][4]}}" readonly>
    </div>
  </div>
  <div class="form-group">
    <label for="category_id">Category ID:</label>
    <div>
      <input type="text" class="form-control" name="category_id" value="{{results[0][5]}}" readonly>
    </div>
  </div>
  <div class="form-group">
    <label for="author_id">Author ID:</label>
    <div>
      <input type="text" class="form-control" name="author_id" value="{{results[0][7]}}" readonly>
    </div>
  </div>
  <div class="form-group mb-2">
    <label for="cuisine_id">Cuisine ID:</label>
    <div>
      <input type="text" class="form-control" name="cuisine_id" value="{{results[0][6]}}" readonly>
    </div>
  </div>
  <div>
    <button type="submit" class="btn btn-danger mb-2">Delete</button>
  </div>
</form>

% include('footer.tpl')