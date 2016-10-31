// Aidjasd

var recipes_filepath, recipes_list; // arguments

if(argument_count != 2 or !is_string(argument0) or !ds_exists(argument1, ds_type_list))
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

    var recipe_items = scr_slice(fetched_line, ";"); // array    
    var recipe_items_count = array_length_1d(recipe_items);
    if(is_undefined(recipe_items) or recipe_items == noone or !is_array(recipe_items) or recipe_items_count < 3)
    {
        scr_log("The '" + fetched_line + "' line is not a parsable recipe!");
        continue;
    }

    var correct_refcodes = true;
    var missing_refcode = "";
    for(var i = 0; i < recipe_items_count; i++)
    {
        var refcode = recipe_items[i];
        var refcode_index = ds_list_find_index(global.ingredient_refcodes, string(refcode));
        if(refcode_index == -1)
        {
            correct_refcodes = false;     
            missing_refcode = refcode;  
            break;
        }
    }
    
    if(correct_refcodes == false)
    {
        scr_log("At least '" + string(missing_refcode) + "' item from the recipe was not found on the refcodes list. The fetched line from the file: " + fetched_line + ".");
        continue;
    }
    
    scr_log("The recipe was parsed successfully. Items: " + string(recipe_items) + ".");
    
    ds_list_add(recipes_list, recipe_items);
}

file_text_close(file);
