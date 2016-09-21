/// scr_log(message)

if !(argument_count > 0 and argument0 != noone and is_string(argument0))
{
    return noone;
}

show_debug_message(string(current_year) + "-" + string(current_month) + "-" + string(current_day) + " " + string(current_hour) + ":" + string(current_minute) + ":" + string(current_second) + " " + argument0);

