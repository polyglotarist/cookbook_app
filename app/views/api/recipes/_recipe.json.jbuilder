json.id recipe.id
json.title recipe.title
json.chef recipe.chef
json.ingredients recipe.ingredients
json.directions recipe.directions
json.prep_time recipe.prep_time
json.img_url recipe.img_url

json.formatted do
  json.ingredients recipe.ingredients_list
  json.prep_time recipe.friendly_prep_time
  json.created_at recipe.friendly_created_at
end