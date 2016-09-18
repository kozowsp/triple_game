scr_add_item(100, 100, "baguette", "BAGUE", "Images/Items/it_banana.png", true, true, true, false, 0, 1, 1);
//baguette;BAGUE;spr_baguette.sprite.gmx;1;1;1;0;0
//position_x, position_y, name, refcode, sprite, moveable, destroyable, mergeable, cleanable, complexity;

var table_width, table_height, table_left_position, table_right_position, table_bottom_position;

with(obj_table)
{
    table_width = sprite_width;
    table_height = sprite_height;
    table_left_position = x - sprite_xoffset;
    table_right_position = x - sprite_xoffset + sprite_width;
    table_bottom_position = y - sprite_yoffset + sprite_height;
}

if !(instance_exists(obj_queue) and instance_number(obj_queue) > 0)
{
    instance_create(room_width / 2, table_bottom_position, obj_queue);
}
else
{
    var queue = instance_find(obj_queue, 0);
    queue.x = room_width / 2;
    queue.y = table_bottom_position;
    with(queue)
    {
        //left_position = x - sprite_xoffset;
        //top_position = y - sprite_yoffset;
        //right_position = left_position + sprite_width;
        //bottom_position = top_position + sprite_height;    
    }
}



