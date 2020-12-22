% include('header.tpl')

<h1>{{ page_name }}</h1>

<h5>Recipe Name: {{results[0][1]}}</h5>
<h5>Recipe ID: {{results[0][0]}}</h5>


<h2>Reviews for {{results[0][1]}}</h2>
<table class="table table-striped table-bordered">
  %if len(reviews) == 0:
    <tr>
      <td>No results found! The recipe does not have a review yet</td>
    </tr>
  %else:
    <tr>
      <td>Review ID</td> <td>User ID</td> <td>Recipe ID</td> <td>Rating (1-5 stars)</td> <td>Review Content</td>
    </tr>
    %for review in reviews:
      <tr>
      %for value in review:
        <td>{{ value }}</td>
      %end
      </tr>
    %end
  %end
</table>

<a href="/add_review/{{results[0][0]}}" class="btn btn-success btn-lg btn-block" role="button">Add a new review for this recipe</a>
<a href="/recipes" class="btn btn-primary btn-lg btn-block" role="button">Go back</a>

% include('footer.tpl')