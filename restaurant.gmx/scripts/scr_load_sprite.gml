// Loads the sprite 

if(argument_count != 1 or !is_string(argument0))
{
    return noone;
}

var image_path = argument0;
var found_sprite_index = ds_map_find_value(global.sprites, image_path);

if(is_undefined(found_sprite_index))
{  
    var newly_added_sprite_index = sprite_add(working_directory + argument0, 1, false, false, 0, 0);
    ds_map_add(global.sprites, image_path, newly_added_sprite_index);
    return newly_added_sprite_index;
}
else
{
    return found_sprite_index;
}
