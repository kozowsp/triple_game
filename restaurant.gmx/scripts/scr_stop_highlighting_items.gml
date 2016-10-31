with(obj_table)
{
    for(var i = 0; i < ds_list_size(highlighted_ingredients); ++i)
    {
        with(ds_list_find_value(highlighted_ingredients, i))
        {
            image_alpha = 1.0;        
        }
    }
}
