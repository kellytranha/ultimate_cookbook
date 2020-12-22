% include('header.tpl')
<!-- Main content should go here-->
<h1>{{ page_name }}</h1>
<h5>{{ body }}</h5>

<a href="/edit_recipe/{{recipe_id}}" class="btn btn-primary btn-lg btn-block" role="button">Go back</a>
% include('footer.tpl')
