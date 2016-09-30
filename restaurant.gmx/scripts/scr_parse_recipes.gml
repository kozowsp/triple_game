// Aidjasd

var recipes_filepath, recipes_list; // arguments

if(argument_count != 2 or !is_string(argument0) or !ds_exists(argument1, ds_type_map))
{   
    return noone;
}

recipes_filepath = argument0;
recipes_list = argument1;

var file = file_text_open_read(working_directory + recipes_filepath);
var lines = ds_list_create();

while(!file_text_eof(file))
{
    var fetched_line = file_text_readln(file);
    if(string_char_at(fetched_line, 0) == "/" and string_char_at(fetched_line, 1) == "/")
    {
        continue;
    } 

    var sliced_recipe = scr_slice(fetched_line, "="); // array    
    if(is_undefined(sliced_recipe) or sliced_recipe == noone or !is_array(sliced_recipe) or array_length_1d(sliced_recipe) != 2)
    {
        scr_log("The '" + fetched_line + "' line is not a parsable recipe!");
        continue;
    }
    
    var ingredient_refcodes = scr_slice(sliced_recipe[0], "+");
    var result_refcode = sliced_recipe[1];
    
    scr_log("The recipe was parsed successfully. Ingredients: " + string(ingredient_refcodes) + ", result: " + string(result_refcode) + ".");
    
    ds_map_add(recipes_list, ingredient_refcodes, result_refcode);
}

file_text_close(file);
