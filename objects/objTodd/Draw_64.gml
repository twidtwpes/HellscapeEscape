//draw_set_font(fntDebug);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
//draw_set_color(c_red);
//draw_text(10,10,hp);
var p = 5;
repeat(hp){
	draw_sprite_ext(sptHeart, 0, p, 5, 1, 1, 0, c_white, 1);
	p += 15;
}

draw_sprite_ext(sptClipBacker, 0, 5, 20, 1, 1, 0, c_white, 1);
//draw_sprite_ext(sptClipInner, 0, 5, 20, 1, 1, 0, c_white, 1);
//draw_sprite_part(sprite, subimg, left, top, width, height, x, y);

var w = sprite_get_width(sptClipInner);
var h = sprite_get_height(sptClipInner);
//var ratio = ((reloadtime - currentreload) div reloadtime) * h;
var ratio = h - ((currentreload/reloadtime) * h);
draw_sprite_part(sptClipInner, 0, 0, ratio, w, h-ratio, 5, 20+ratio); 
draw_sprite_ext(sptClipOuter, 0, 5, 20, 1, 1, 0, c_white, 1);