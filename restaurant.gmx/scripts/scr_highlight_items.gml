// Checks if the picked item with the closest neighbours matches any recipe.

var in_grid_position_x, in_grid_position_y; // arguments

if(argument_count != 2 or !is_real(argument0) or !is_real(argument1))
{
    return noone;
}

in_grid_position_x = argument0;
in_grid_position_y = argument1; 

scr_get_recipes(in_grid_position_x, in_grid_position_y, ds_list_create())

scr_highlight_ingredient(in_grid_position_x, in_grid_position_y, in_grid_position_x, in_grid_position_y + 1);
scr_highlight_ingredient(in_grid_position_x, in_grid_position_y, in_grid_position_x, in_grid_position_y - 1);
scr_highlight_ingredient(in_grid_position_x, in_grid_position_y, in_grid_position_x + 1, in_grid_position_y);
scr_highlight_ingredient(in_grid_position_x, in_grid_position_y, in_grid_position_x - 1, in_grid_position_y);

with(instance_find(obj_table, 0))
{
    
}
