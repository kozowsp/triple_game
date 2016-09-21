scr_log("The table initialization have just started.");

if !(instance_exists(obj_table) and instance_number(obj_table) > 0)
{
    scr_log("The table does not exist. It will be created...");
    instance_create(room_width / 2, room_height / 2, obj_table);
    scr_log("The table was successfully created.");
    
}
else
{
    scr_log("The table have been already created.");
}

scr_log("The table initialization have just finished.");
