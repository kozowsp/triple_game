var file = file_text_open_read(working_directory + "items.txt");
var lines = ds_list_create();

while(!file_text_eof(file))
{
    ds_list_add(lines, scr_slice(file_text_readln(file), ";"));
}

file_text_close(file);
var i;
for(i = 0; i < ds_list_size(lines); ++i)
{
    //show_message(ds_list_find_value(lines, i));
}
