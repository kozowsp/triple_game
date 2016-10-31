/// scr_populate_items(desired_fields_number, items_refcodes, items_properties, images_location)
// Populates the specified number of the table's fields with the items.

var desired_fields_number, items_refcodes, items_properties, images_location, item_type;

if(argument_count != 5 or !is_real(argument0) or argument0 < 1 or !ds_exists(argument1, ds_type_list) or ds_list_empty(argument1) or !ds_exists(argument2, ds_type_map) or ds_map_empty(argument2) or !is_real(argument3) or argument4 == noone)
{
    return noone;
}

desired_fields_number = floor(argument0);
items_refcodes = argument1;
items_properties = argument2;
images_location = argument3;
item_type = argument4;

var item_refcode_to_area = ds_map_create();
var viable_item_refcodes = ds_list_create();
for(var i = 0; i < ds_list_size(items_refcodes); ++i)
{
    var refcode = ds_list_find_value(items_refcodes, i);
    var properties = ds_map_find_value(items_properties, refcode);
    var area = real(properties[OBSTACLE_WIDTH_INDEX]) * real(properties[OBSTACLE_HEIGHT_INDEX]);
    if(area <= desired_fields_number and area > 0)
    {
        var new_index = 0;
        for(var j = 0; j < ds_list_size(viable_item_refcodes); ++j)
        {                       
            if (area <= ds_map_find_value(item_refcode_to_area, ds_list_find_value(viable_item_refcodes, j)))
            {
                new_index = j;
                break;
            }
            else
            {
                new_index = j + 1;
            }
        } 
        
        ds_map_add(item_refcode_to_area, refcode, area);   
        ds_list_insert(viable_item_refcodes, new_index, refcode);        
    }
}

if(ds_map_empty(item_refcode_to_area) or ds_list_empty(viable_item_refcodes))
{
    return noone;
}

with(obj_table)
{
    var filled_fields_number = 0;    
    while(filled_fields_number < desired_fields_number)
    {
        var item_index = irandom(ds_list_size(viable_item_refcodes) - 1);        
        if(ds_map_find_value(item_refcode_to_area, ds_list_find_value(viable_item_refcodes, item_index)) + filled_fields_number > desired_fields_number)
        {
            continue;
        }
        
        var item_position_x, item_position_y;
        var properties_array = ds_map_find_value(items_properties, ds_list_find_value(viable_item_refcodes, item_index));
        
        do
        {
            item_position_x = irandom(ds_grid_width(grid) - 1);
            item_position_y = irandom(ds_grid_height(grid) - 1);
        }
        until(scr_check_fields_availability(grid, item_position_x, item_position_y, real(properties_array[OBSTACLE_WIDTH_INDEX]), real(properties_array[OBSTACLE_HEIGHT_INDEX])));    
        
        //var created_item = instance_create(left_position + item_position_x * field_width, top_position + item_position_y * field_height, if (images_location == images_ingredients) { return obj_ingredient;);
        var created_item = instance_create(left_position + item_position_x * field_width, top_position + item_position_y * field_height, item_type);

        with(created_item)
        {
            name = properties_array[OBSTACLE_NAME_INDEX];
            refcode = properties_array[OBSTACLE_REFCODE_INDEX];
            sprite_index = scr_load_sprite(images_location, properties_array[OBSTACLE_SPRITE_NAME_INDEX]);
            moveable = false;
            destroyable = properties_array[OBSTACLE_DESTROYABLE_INDEX];
            mergeable = properties_array[OBSTACLE_MERGEABLE_INDEX];
            cleanable = properties_array[OBSTACLE_CLEANABLE_INDEX];
            complexity = properties_array[OBSTACLE_COMPLEXITY_INDEX];
            selected = false;
            width = properties_array[OBSTACLE_WIDTH_INDEX];
            height = properties_array[OBSTACLE_HEIGHT_INDEX];      
            depth = DEPTH_PLACED_ITEM;
        }        
        filled_fields_number += ds_map_find_value(item_refcode_to_area, ds_list_find_value(viable_item_refcodes, item_index));
        ds_grid_add_region(grid, item_position_x, item_position_y, item_position_x + real(properties_array[OBSTACLE_WIDTH_INDEX]) - 1, item_position_y + real(properties_array[OBSTACLE_HEIGHT_INDEX]) - 1, created_item);
    }
}
