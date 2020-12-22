% include('header.tpl')
<!-- Main content should go here-->
<h1>Welcome to Ultimate Cookbook!</h1>

<div>
    <h5>Feel hungry? Let's find a good recipe. You can look up a recipe by name or cuisine.<h5>
    <i>You can fill in one, both, or neither fields. The site will run a conjunctive search and generate the best match based on your input.</i>
    <i>If neither search field is populated, then the site will show all (up to 20) records in the recipe database.</i>
    <h5>Enjoy :)<h5>
    <img width="350" src="/static/pic1.jpg">

</div>

<form onsubmit="recipeSearch()">
  <div class="form-group">
    <label for="recipe_name" class="form-label">Recipe Name*:</label>
    <div>
      <input id="recipe_name_field" type="text" class="form-control" name="recipe_name" placeholder="Enter a dish (ie. Banh Mi)">
    </div>
  </div>
   <div class="form-group">
    <label for="cuisine_name" class="form-label">Cuisine Name*:</label>
    <div>
      <input id="cuisine_name_field" type="text" class="form-control" name="cuisine_name" placeholder="Enter a cuisine name (ie. Vietnamese)">
    </div>
  </div>
  
  <button type="submit" class="btn btn-primary btn-lg btn-block">Search</button>
</form>

<a href="/add_recipe" class="btn btn-success btn-lg btn-block" role="button">Add a new recipe to the database</a>

<script>
function recipeSearch() {
  event.preventDefault()
  const recipe = document.getElementById("recipe_name_field").value;
  const cuisine = document.getElementById("cuisine_name_field").value;
  let params = new URLSearchParams();
  if (recipe) {
  	params.append('recipe', recipe);
  }
  if (cuisine) {
  	params.append('cuisine', cuisine);
  }

  const stringParams = params.toString();
  window.location.href = "/recipes" + (stringParams ? ('?' + stringParams) : '');
  return false;
}
</script>
% include('footer.tpl')
