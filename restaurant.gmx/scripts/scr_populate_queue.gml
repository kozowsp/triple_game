// Populates the queue with the ingredients.

var items_number;

if(argument_count != 1 or !is_real(argument0) or argument0 < 1)
{
    return noone;
}

items_number = argument0;

with(obj_queue)
{
    desired_ingredient_width = width / items_number;
    for(var i = 0; i < items_number; ++i)
    {        
        var new_ingredient_index = irandom(ds_list_size(global.ingredient_refcodes) - 1);        
        var properties_array = ds_map_find_value(global.ingredient_properties, ds_list_find_value(global.ingredient_refcodes, new_ingredient_index));
        
        with(instance_create(left_position + i * desired_ingredient_width, top_position, obj_ingredient))
        {
            name = properties_array[OBSTACLE_NAME_INDEX];
            refcode = properties_array[OBSTACLE_REFCODE_INDEX];
            sprite_index = scr_load_sprite(images_ingredients, properties_array[OBSTACLE_SPRITE_NAME_INDEX]);
            moveable = true;
            destroyable = properties_array[OBSTACLE_DESTROYABLE_INDEX];
            mergeable = properties_array[OBSTACLE_MERGEABLE_INDEX];
            cleanable = properties_array[OBSTACLE_CLEANABLE_INDEX];
            complexity = properties_array[OBSTACLE_COMPLEXITY_INDEX];
            selected = false;
            width = properties_array[OBSTACLE_WIDTH_INDEX];
            height = properties_array[OBSTACLE_HEIGHT_INDEX];      
            depth = obj_table.depth - 1;
        }                
    }
}
