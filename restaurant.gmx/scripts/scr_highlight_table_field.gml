// highlight the table's field, which is covered by the selected item

var in_grid_position_x, in_grid_position_y; // arguments

if(argument_count != 2 or !is_real(argument0) or !is_real(argument1))
{
    return noone;
}

in_grid_position_x = argument0;
in_grid_position_y = argument1; 

with(instance_find(obj_table, 0))
{ 
    if(highlighted_field != noone)
    {
        with(highlighted_field)
        {
            instance_destroy();
        }
    }    
        
    if(in_grid_position_x >= 0 and in_grid_position_x <= cols - 1 and in_grid_position_y >= 0 and in_grid_position_y <= rows - 1 and ds_grid_get(grid, in_grid_position_x, in_grid_position_y) == 0)
    {
        var new_pos_x = left_position + field_width * in_grid_position_x;
        var new_pos_y = top_position + field_height * in_grid_position_y;

        highlighted_field = instance_create(new_pos_x, new_pos_y, obj_item);        
                
        with(highlighted_field)
        {
            sprite_index = scr_load_sprite(images_helpers, "it_covered.png");        
            depth = DEPTH_PLACED_ITEM;       
        }
    } 
    else
    {
        highlighted_field = noone;
    }
    
}


