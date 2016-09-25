// highlight the table's field, which is covered by the selected item

var center_x, center_y; // arguments

if(argument_count != 2 or !is_real(argument0) or !is_real(argument1))
{
    return noone;
}

center_x = argument0;
center_y = argument1; 

with(instance_find(obj_table, 0))
{
    var table_left_position = x - sprite_xoffset;
    var table_top_position = y - sprite_yoffset;
    
    var table_position_x = floor(center_x - table_left_position) / floor(field_width);
    var table_position_y = floor(center_y - table_top_position) / floor(field_height);
    
    if(highlighted_field != noone)
    {
        with(highlighted_field)
        {
            instance_destroy();
        }
    }    
        
    if(center_x >= table_left_position and center_x <= table_left_position + sprite_width and center_y >= table_top_position and center_y <= table_top_position + sprite_height and ds_grid_get(grid, table_position_x, table_position_y) != 1)
    {
        var new_x = table_left_position + field_width * int64((center_x - table_left_position) / field_width);
        var new_y = table_top_position + field_height * int64((center_y - table_top_position) / field_height);    

        highlighted_field = instance_create(new_x, new_y, obj_item);        
                
        with(highlighted_field)
        {
            sprite_index = scr_load_sprite(images_helpers, "it_covered.png");        
            depth = obj_table.depth - 1;            
        }
    } 
    else
    {
        highlighted_field = noone;
    }
    
}


