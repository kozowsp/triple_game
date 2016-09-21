scr_log("The gameplay room initialization have just started.");

global.ingredients_queue = ds_list_create();

scr_init_table();
scr_init_queue();
scr_init_orders();

scr_log("The gameplay room initialization have just finished.");
