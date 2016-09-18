// Loads the named sprite (2nd argument) from the pointed location (1st argument).

var image_name, image_location; // args

if(argument_count != 2 or !is_real(argument0) or !is_string(argument1))
{
    return noone;
}

image_location = scr_images_location(argument0);
image_name = argument1;

if(image_location == noone)
{
    return noone;   
}

var image_filepath = image_location + image_name;
var found_sprite_index = ds_map_find_value(global.sprites, image_filepath);

if(is_undefined(found_sprite_index))
{  
    var newly_added_sprite_index = sprite_add(working_directory + image_filepath, 1, false, false, 0, 0);
    ds_map_add(global.sprites, image_name, newly_added_sprite_index);
    return newly_added_sprite_index;
}
else
{
    return found_sprite_index;
}
