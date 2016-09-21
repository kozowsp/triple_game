// Populates the specified number of the table's fields with the obstacles

var desired_fields_number;

//global.obstacle_refcodes = ds_list_create();
//global.obstacle_properties = ds_map_create();

if(argument_count != 1 or !is_real(argument0) or argument0 < 1)
{
    return noone;
}

desired_fields_number = floor(argument0);
var obstacle_refcode_to_area = ds_map_create();
var viable_obstacle_refcodes = ds_list_create();
for(var i = 0; i < ds_list_size(global.obstacle_refcodes); ++i)
{
    var refcode = ds_list_find_value(global.obstacle_refcodes, i);
    var properties = ds_map_find_value(global.obstacle_properties, refcode);
    var area = real(properties[OBSTACLE_WIDTH_INDEX]) * real(properties[OBSTACLE_HEIGHT_INDEX]);
    if(area <= desired_fields_number and area > 0)
    {
        var new_index = 0;
        for(var j = 0; j < ds_list_size(viable_obstacle_refcodes); ++j)
        {                       
            if (area <= ds_map_find_value(obstacle_refcode_to_area, ds_list_find_value(viable_obstacle_refcodes, j)))
            {
                new_index = j;
                break;
            }
            else
            {
                new_index = j + 1;
            }
        } 
        
        ds_map_add(obstacle_refcode_to_area, refcode, area);   
        ds_list_insert(viable_obstacle_refcodes, new_index, refcode);        
    }
}

if(ds_map_empty(obstacle_refcode_to_area) or ds_list_empty(viable_obstacle_refcodes))
{
    return noone;
}

with(obj_table)
{
    var filled_fields_number = 0;    
    while(filled_fields_number < desired_fields_number)
    {
        var obstacle_index = irandom(ds_list_size(viable_obstacle_refcodes) - 1);        
        if(ds_map_find_value(obstacle_refcode_to_area, ds_list_find_value(viable_obstacle_refcodes, obstacle_index)) + filled_fields_number > desired_fields_number)
        {
            continue;
        }
        
        var obstacle_position_x, obstacle_position_y;
        var properties_array = ds_map_find_value(global.obstacle_properties, ds_list_find_value(viable_obstacle_refcodes, obstacle_index));
        
        do
        {
            obstacle_position_x = irandom(ds_grid_width(grid) - 1);
            obstacle_position_y = irandom(ds_grid_height(grid) - 1);
        }
        until(scr_check_fields_availability(grid, obstacle_position_x, obstacle_position_y, real(properties_array[OBSTACLE_WIDTH_INDEX]), real(properties_array[OBSTACLE_HEIGHT_INDEX])));
        
        with(instance_create(left_position + obstacle_position_x * field_width, top_position + obstacle_position_y * field_height, obj_obstacle))
        {
            name = properties_array[OBSTACLE_NAME_INDEX];
            refcode = properties_array[OBSTACLE_REFCODE_INDEX];
            sprite_index = scr_load_sprite(images_obstacles, properties_array[OBSTACLE_SPRITE_NAME_INDEX]);

            moveable = properties_array[OBSTACLE_MOVEABLE_INDEX];
            destroyable = properties_array[OBSTACLE_DESTROYABLE_INDEX];
            mergeable = properties_array[OBSTACLE_MERGEABLE_INDEX];
            cleanable = properties_array[OBSTACLE_CLEANABLE_INDEX];
            complexity = 0;
            selected = false;
            width = properties_array[OBSTACLE_WIDTH_INDEX];
            height = properties_array[OBSTACLE_HEIGHT_INDEX];      
            depth = obj_table.depth - 1;
        }        
        filled_fields_number += ds_map_find_value(obstacle_refcode_to_area, ds_list_find_value(viable_obstacle_refcodes, obstacle_index));
        ds_grid_add_region(grid, obstacle_position_x, obstacle_position_y, obstacle_position_x + real(properties_array[OBSTACLE_WIDTH_INDEX]) - 1, obstacle_position_y + real(properties_array[OBSTACLE_HEIGHT_INDEX]) - 1, 1);
    }
}
