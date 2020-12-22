% include('header.tpl')
<!-- Main content should go here-->
<h1>{{ page_name }}</h1>
<h5>Fill out the form to add a new review for:</h5>

<form action="/add_review/{{results[0][0]}}" method="post">

  <div class="form-group">
    <label for="recipe_name">Recipe Name:</label>
    <div>
      <input type="text" class="form-control" name="recipe_name" value="{{results[0][1]}}" readonly>
    </div>
  </div>
  
  <div>
    <hr class="style2">
  </div>

  <div class="form-group">
    <label for="users_id">User ID:</label>
    <select class="form-control" name="users_id">
      % for item in users:
        <option value="{{item[0]}}">{{item[0]}}</option>
      % end
    </select>
  </div>

  <div class="form-group">
    <label for="recipe_id">Recipe ID:</label>
    <div>
      <input type="text" class="form-control" name="recipe_id" value="{{results[0][0]}}" readonly>
    </div>
  </div>
  
  <div class="form-group">
    <label for="rating">Rating: (1-5 stars)</label>
    <select class="form-control" name="rating">
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
    </select>
  </div>
  <div class="form-group">
    <label for="review_text">Review Content</label>
    <div>
      <input type="text" class="form-control" name="review_text" placeholder="Type the review here">
    </div>
  </div>
  <div>
    <button href="/add_review/{{results[0][0]}}" type="submit" class="btn btn-success mb-2">Add</button>
  </div>
</form>
% include('footer.tpl')
