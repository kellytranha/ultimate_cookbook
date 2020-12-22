% include('header.tpl')
<!-- Main content should go here-->
<h1>{{ page_name }}</h1>
<table class="table table-striped table-bordered">
  %if len(results) == 0:
    <tr>
      <td>No results found!</td>
    </tr>
  %else:
    <tr>
      <th>Recipe ID</th> <th>Recipe Name</th> <th>Description</th> <th>Cuisine</th> <th colspan="4" class="text-center">Options</th>
    </tr>
    %for entry in results:
      <tr>
      %for value in entry:
        <td>{{ value }}</td>
      %end
      <td> <a href="/edit_recipe/{{entry[0]}}">View/Edit</a></td>
      <td> <a href="/delete_recipe/{{entry[0]}}">Delete</button></a></td>
      <td> <a href="/view_review/{{entry[0]}}">Show Reviews</a></td>
      <td> <a href="/add_review/{{entry[0]}}">Add A New Review</a> </td>
      </tr>
    %end
  %end
</table>
<a href="/" class="btn btn-primary btn-lg btn-block" role="button">Find another recipe</a>
<a href="/add_recipe" class="btn btn-success btn-lg btn-block" role="button">Add a new recipe to the database</a>
% include('footer.tpl')