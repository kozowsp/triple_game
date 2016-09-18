// Aidjasd

var items_filepath, item_refcodes, item_properties; // arguments

if(argument_count != 3 or !is_string(argument0) or !ds_exists(argument1, ds_type_list) or !ds_exists(argument2, ds_type_map))
{   
    return noone;
}

items_filepath = argument0;
item_refcodes = argument1;
item_properties = argument2;

var file = file_text_open_read(working_directory + items_filepath);
var lines = ds_list_create();

while(!file_text_eof(file))
{
    var fetched_line = file_text_readln(file);
    if(string_char_at(fetched_line, 0) == "/" and string_char_at(fetched_line, 1) == "/")
    {
        continue;
    } 
    
    var sliced_properties = scr_slice(fetched_line, ";"); // array    
    if(is_undefined(sliced_properties) or sliced_properties == noone or !is_array(sliced_properties) or array_length_1d(sliced_properties) < 8)
    {
        continue;
    }

    var refcode = sliced_properties[real(OBSTACLE_REFCODE_INDEX)];
    ds_list_add(item_refcodes, refcode);
    ds_map_add(item_properties, refcode, sliced_properties);
}

file_text_close(file);
