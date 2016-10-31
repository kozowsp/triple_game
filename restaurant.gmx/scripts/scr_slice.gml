// slice the input string and returns the array of substrings (empty string are also being considered)
// eg. the src_slice(";;", ";") call will return the list of three empty strings

var text, separator; // arguments

if(argument_count == 2)
{
    text = argument0;
    separator = argument1;
}
else if(argument_count == 1)
{
    text = argument0;
    separator = " ";
}
else
{
    return noone;
}

if(!is_string(text) or !is_string(separator))
{
    return noone;
}

if(text == "" or string_count(separator, text) == 0)
{
    return text;
}

var substrings = ds_list_create();
var substrings_array;
var substrings_array_index = 0;
var substring = "";
var i;

if(string_char_at(text, string_length(text)) == " ")
{
    text = string_delete(text, string_length(text), 1);
}

for(i = 1; i <= string_length(text); ++i)
{
    var current_char = string_char_at(text, i);
    
    if(current_char == chr(13) or current_char == chr(10))
    {
        continue;
    }
    
    if(current_char != separator)
    {
        substring = substring + current_char;
    }
    else
    {
        ds_list_add(substrings, substring);
        substrings_array[substrings_array_index++] = substring;
        substring = "";
    }
}

if(substring != "" and substring != chr(10) and substring != chr(13) and substring != (chr(13) + chr(10)))
{
    ds_list_add(substrings, substring); // last char in the string is the saparator, so after it there is still one empty string
    substrings_array[substrings_array_index] = substring;   
}

return substrings_array;
