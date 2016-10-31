// Animates the pointed item.

var target_item_x, target_item_y, chosen_item_x, chosen_item_y; // arguments

if(argument_count != 4 or !is_real(argument0) or !is_real(argument1) or !is_real(argument2) or !is_real(argument3))
{
    return noone;
}

target_item_x = argument0;
target_item_y = argument1; 
chosen_item_x = argument2;
chosen_item_y = argument3;

with(obj_table)
{
    
    grid_width = ds_grid_width(grid);
    grid_height = ds_grid_height(grid);    
    
    if(chosen_item_x < 0 or chosen_item_y < 0 or chosen_item_x >= grid_width or chosen_item_y >= grid_height)
    {
        scr_log("The item position is out of the bounds (" + string(chosen_item_x) + ", " + string(chosen_item_y) + ").");
        return noone;
    }
    

    chosen_item = ds_grid_get(grid, chosen_item_x, chosen_item_y);
    if(chosen_item == 0 or !instance_exists(chosen_item))
    {
        scr_log("The (" + string(chosen_item_x) + ", " + string(chosen_item_y) + ") field is not occupied by the item.");
        return noone;
    }

    if(object_get_name(chosen_item.object_index) == object_get_name(obj_ingredient))
    {
        scr_log("Animating the ingredient at " + string(chosen_item_x) + ", " + string(chosen_item_y) + ".");     
        with(chosen_item)
        {
            image_alpha = 0.5;
            scr_log("Chosen item 'object index' equals to " + string(object_index) + " and 'object name' is " + string(object_get_name(object_index)) + ".");                               
        }
        ds_list_add(highlighted_ingredients, chosen_item);
    }
    else
    {
        scr_log("Animating the ingredient at " + string(chosen_item_x) + ", " + string(chosen_item_y) + " failed. It is not an ingredient.");        
    }    
}
