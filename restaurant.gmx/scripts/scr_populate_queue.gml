// Populates the queue with the ingredients.

with(obj_queue)
{
    for(var i = 0; i < slots_number; ++i)
    {
        if(slots[i] != noone)
        {
            show_debug_message("Slot " + string(i) + " does not equal noone. Skipping...");
            continue;
        }
        
        show_debug_message("Slot " + string(i) + " equals noone. The ingredient will be created...");        
        
        var ingredient_refcode_index = irandom(ds_list_size(global.ingredient_refcodes) - 1);        
        var fetched_ingredient_properties = ds_map_find_value(global.ingredient_properties, ds_list_find_value(global.ingredient_refcodes, ingredient_refcode_index));
        
        var new_ingredient = instance_create(slot_positions[i, 0], slot_positions[i, 1], obj_ingredient);
        slots[i] = new_ingredient;
        
        with(new_ingredient)
        {
            name = fetched_ingredient_properties[OBSTACLE_NAME_INDEX];
            refcode = fetched_ingredient_properties[OBSTACLE_REFCODE_INDEX];
            sprite_index = scr_load_sprite(images_ingredients, fetched_ingredient_properties[OBSTACLE_SPRITE_NAME_INDEX]);
            moveable = true;
            destroyable = fetched_ingredient_properties[OBSTACLE_DESTROYABLE_INDEX];
            mergeable = fetched_ingredient_properties[OBSTACLE_MERGEABLE_INDEX];
            cleanable = fetched_ingredient_properties[OBSTACLE_CLEANABLE_INDEX];
            complexity = fetched_ingredient_properties[OBSTACLE_COMPLEXITY_INDEX];
            selected = false;
            width = fetched_ingredient_properties[OBSTACLE_WIDTH_INDEX];
            height = fetched_ingredient_properties[OBSTACLE_HEIGHT_INDEX];      
            depth = DEPTH_PLACED_ITEM;
        }                
    }
}
