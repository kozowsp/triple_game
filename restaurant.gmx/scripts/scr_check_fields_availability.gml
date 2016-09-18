// Checks if the grid's given position is viable for the newly created item.

var grid, position_x, position_y, item_width, item_height; // arguments

if(argument_count != 5 or !ds_exists(argument0, ds_type_grid) or !is_real(argument1) or !is_real(argument2) or !is_real(argument3) or !is_real(argument4))
{
    return noone;
}

grid = argument0;
position_x = floor(argument1);
position_y = floor(argument2);
item_width = floor(argument3);
item_height = floor(argument4);

show_debug_message("pos: (" + string(position_x) + ", " + string(position_y) + "), size: (" + string(item_width) + ", " + string(item_height) + ")");

var end_position_x = position_x + item_width - 1;
var end_position_y = position_y + item_height - 1;

var grid_width = ds_grid_width(grid);
var grid_height = ds_grid_height(grid);
var grid_max_x_position = grid_width - 1;
var grid_max_y_position = grid_height - 1;

if(position_x < 0 or position_y < 0 or position_x > grid_max_x_position or position_y > grid_max_y_position or end_position_x > grid_max_x_position or end_position_y > grid_max_y_position)
{
    return false;
}

var sum = ds_grid_get_sum(grid, position_x, position_y, end_position_x, end_position_y);
if(sum != 0)
{
    return false;
}

return true;
