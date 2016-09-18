// highlight the table's cell, which is covered by the selected item

var center_x, center_y; // arguments

if(argument_count != 2)
{
    return noone;
}

center_x = argument0;
center_y = argument1; 

if(!is_real(center_x) or !is_real(center_y))
{
    return noone;
}

with(instance_find(obj_table, 0))
{
    var table_left_position = x - sprite_xoffset;
    var table_top_position = y - sprite_yoffset;
    
    var table_position_x = floor(center_x - table_left_position) / floor(cell_width);
    var table_position_y = floor(center_y - table_top_position) / floor(cell_height);
        
    if(center_x >= table_left_position and center_x <= table_left_position + sprite_width and center_y >= table_top_position and center_y <= table_top_position + sprite_height and ds_grid_get(grid, table_position_x, table_position_y) != 1)
    {
        var new_x = table_left_position + cell_width * int64((center_x - table_left_position) / cell_width);
        var new_y = table_top_position + cell_height * int64((center_y - table_top_position) / cell_height);
        
        if(highlighted_cell != noone)
        {
            with(highlighted_cell)
            {
                instance_destroy();
            }
        }

        highlighted_cell = instance_create(new_x, new_y, obj_item);        
                
        with(highlighted_cell)
        {
            sprite_index = scr_load_sprite(images_helpers, "it_covered.png");        
            depth = obj_table.depth - 1;            
        }
    }
}


