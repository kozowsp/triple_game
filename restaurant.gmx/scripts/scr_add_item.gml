// Creates the new obj_item and sets the provided properies.

var p_position_x, p_position_y, p_name, p_refcode, p_sprite_index, p_moveable, p_destroyable, p_mergeable, p_cleanable, p_complexity; // arguments

if (argument_count != 10)
{
    return noone;
}

p_position_x = argument0;
p_position_y = argument1;
p_name = argument2;
p_refcode = argument3;
p_sprite_index = scr_load_sprite(argument4);
p_moveable = argument5;
p_destroyable = argument6;
p_mergeable = argument7;
p_cleanable = argument8;
p_complexity = argument9; 

if(!is_real(p_position_x) or !is_real(p_position_y) or !is_string(p_name) or !is_string(p_refcode) or !is_real(p_sprite_index) or !is_real(p_moveable) or !is_real(p_destroyable) or !is_real(p_mergeable) or !is_real(p_cleanable) or !is_real(p_complexity))
{
    return noone;
}

with(instance_create(p_position_x, p_position_y, obj_item))
{
    sprite_index = p_sprite_index;
    x = p_position_x;
    y = p_position_y;
    name = p_name;
    refcode = p_refcode;
    moveable = p_moveable;
    destroyable = p_destroyable;
    mergeable = p_mergeable;
    cleanable = p_cleanable;
    complexity = p_complexity;     
    selected = false;
}
