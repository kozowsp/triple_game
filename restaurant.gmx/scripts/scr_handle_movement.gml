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
    
    var new_hovered_field_x = floor(floor(center_x - table_left_position) / floor(field_width));
    var new_hovered_field_y = floor(floor(center_y - table_top_position) / floor(field_height));
    
    if(new_hovered_field_x == hovered_field_x and new_hovered_field_y == hovered_field_y)
    {
        return noone;
    }
    else 
    {
        scr_log("The item was moved above the table's (" + string(new_hovered_field_x) + ", " + string(new_hovered_field_y) + ") field.");
        scr_stop_highlighting_items();
        scr_highlight_items(new_hovered_field_x, new_hovered_field_y);
        scr_highlight_table_field(new_hovered_field_x, new_hovered_field_y);
    }
    
    hovered_field_x = new_hovered_field_x;
    hovered_field_y = new_hovered_field_y;        
}


