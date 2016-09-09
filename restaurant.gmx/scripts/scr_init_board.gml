var width = room_width;
var height = room_height;

if !(instance_exists(obj_table) and instance_number(obj_table) > 0)
{
    instance_create(width / 2, height / 2, obj_table);
}
else
{
    var table = instance_find(obj_table, 0);
    table.x = width / 2;
    table.y = height / 2;
    with(table)
    {
        left_position = x - sprite_xoffset;
        top_position = y - sprite_yoffset;
        right_position = left_position + sprite_width;
        bottom_position = top_position + sprite_height;    
    }
}
