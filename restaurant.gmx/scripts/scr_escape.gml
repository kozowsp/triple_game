if(keyboard_check_pressed(vk_escape))
{
    if(room == room_first)
    {
        game_end();
    }
    else 
    {
        room_goto_previous();    
    }   
}

