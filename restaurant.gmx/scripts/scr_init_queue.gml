/// scr_init_queue()

scr_log("The queue initialization have just started.");

var queue_position_x, queue_position_y;

if(instance_exists(obj_table) and instance_number(obj_table) == 1)
{
    with(obj_table)
    {
        queue_position_x = x - sprite_xoffset + sprite_width / 2;
        queue_position_x = y - sprite_yoffset + sprite_height;
    }
}
else
{
    queue_position_x = room_width / 2; 
    queue_position_y = room_height / 2;
}

if !(instance_exists(obj_queue) and instance_number(obj_queue) > 0)
{
    scr_log("The queue does not exist. It will be created...");
    instance_create(queue_position_x, queue_position_y, obj_queue);
    scr_log("The queue was successfully created.");
}
else
{
    scr_log("The queue have been already created.");
}

scr_log("The queue initialization have just finished.");
