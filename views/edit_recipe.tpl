% include('header.tpl')
<!-- Main content should go here-->

<h1>{{results[0][1]}} - View/Edit</h1>
<h5>Hit 'Save' to confirm changes</h5>

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
      <input type="text" class="form-control" name="recipe_name" value="{{results[0][1]}}">
    </div>
  </div>
  <div class="form-group">
    <label for="recipe_descript">Description:</label>
    <div>
      <input type="text" class="form-control" name="recipe_descript" value="{{results[0][2]}}">
    </div>
  </div>
  <div class="form-group">
    <label for="prep_time">Prep Time: (must be an integer between 0-300)</label>
    <div>
      <input type="text" class="form-control" name="prep_time" value="{{results[0][3]}}">
    </div>
  </div>
  <div class="form-group">
    <label for="cook_time">Cook Time: (must be an integer between 0-300)</label>
    <div>
      <input type="text" class="form-control" name="cook_time" value="{{results[0][4]}}">
    </div>
  </div>
  <div class="form-group">
    <label for="category_id">Category ID:</label>
    <div>
      <input type="text" class="form-control" name="category_id" value="{{results[0][5]}}" readonly>
    </div>
  </div>
  <div class="form-group">
    <label for="cuisine_name">Cuisine:</label>
    <select class="form-control" name="cuisine_id">
      % for item in cuisines:
        % if results[0][6] == item[0]:
          <option value="{{item[0]}}" selected>{{item[0]}} - {{item[1]}}</option>
        % else:
          <option value="{{item[0]}}">{{item[0]}} - {{item[1]}}</option>
        % end
      % end

    </select>
  </div>
  <div class="form-group">
    <label for="author_id">Author ID:</label>
    <div>
      <input type="text" class="form-control" name="author_id" value="{{results[0][7]}}" readonly>
    </div>
  </div>
  <div>
    <button type="submit" class="btn btn-success mb-2">Save</button>
  </div>
  
</form>

% include('footer.tpl')