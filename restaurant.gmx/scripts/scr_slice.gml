// slice the input string and returns the list of substrings (empty string are also being considered)
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
var substring = "";
var i;

for(i = 1; i <= string_length(text); ++i)
{
    if(string_char_at(text, i) != separator)
    {
        substring = substring + string_char_at(text, i)
    }
    else
    {
        ds_list_add(substrings, substring);
        substring = "";
    }
}

ds_list_add(substrings, substring); // last char in the string is the saparator, so after it there is still one empty string

return substrings;
