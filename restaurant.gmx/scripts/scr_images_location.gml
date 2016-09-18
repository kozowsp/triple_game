// gets the images sublocation, based on the predefined macros

var macro; // arguments

if (argument_count != 1 or argument0 == noone or !is_real(argument0))
{
    return noone;
}

macro = argument0;

var path;

switch(macro)
{
    case images_ingredients:
        path = "Images/Ingredients/";
        break;    
    case images_helpers:
        path = "Images/Helpers/";
        break;            
    case images_obstacles:
        path = "Images/Obstacles/";
        break;            
    case images_root:
    default:
        path = "Images/";
        break;
}

return path;
