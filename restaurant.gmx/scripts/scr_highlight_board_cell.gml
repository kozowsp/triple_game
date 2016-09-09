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
    
    if(center_x >= table_left_position and center_x <= table_left_position + sprite_width and center_y >= table_top_position and center_y <= table_top_position + sprite_height)
    {
        show_debug_message("the item center is inside the board");
        var new_x = table_left_position + cell_width * int64((center_x - table_left_position) / cell_width);
        var new_y = table_top_position + cell_height * int64((center_y - table_top_position) / cell_height);
        var inst = instance_create(new_x, new_y, obj_item);
        with(inst)
        {
            sprite_index = scr_load_sprite("Images/Helpers/it_covered.png");        
            show_debug_message("covered tile sprite index: " + string(sprite_index));

            x = new_x;
            y = new_y;
        }
    }
}


