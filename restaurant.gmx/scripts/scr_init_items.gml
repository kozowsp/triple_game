global.obstacle_refcodes = ds_list_create();
global.obstacle_properties = ds_map_create();
global.ingredient_refcodes = ds_list_create();
global.ingredient_properties = ds_map_create();

scr_parse_items("ingredients.txt", global.ingredient_refcodes, global.ingredient_properties);
scr_parse_items("obstacles.txt", global.obstacle_refcodes, global.obstacle_properties);

global.recipes = ds_map_create();

scr_parse_recipes("recipes.txt", global.recipes);
