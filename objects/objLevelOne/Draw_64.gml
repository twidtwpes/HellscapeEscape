draw_set_font(fntDebug);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

var list_size = (ds_list_size(floor_list) - 1) div 2;
var list_index = (irandom_range(0, list_size)) * 2;
var list_value = ds_list_find_value(floor_list, list_index);
//draw_text(10,10,list_index);
//draw_text(10,20,list_value[0]);