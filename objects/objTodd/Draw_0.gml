
draw_sprite_ext(sptToddShadow, 0, x, y+19, image_xscale, -.75, 0, c_white, .4);

draw_self();

// Set all white
if(flash > 0){
	flash--;
	shader_set(shdWhite);
	draw_self();
}

gunplaceangle = gunangle;
if(gunangle > 90 && gunangle < 270){
	var xscale = -1;
	gunangle += xscale*180;
}else{
	var xscale = 1;
}

if(gunplaceangle > 0 && gunplaceangle <= 180){
	draw_sprite_ext(gunsprite, 0, x, y, xscale, 1, gunangle, c_white, 1);
	draw_sprite_ext(sptToddHead, 0, x+image_xscale, y+1, xscale, 1, 0, c_white, 1);
}else{
	draw_sprite_ext(sptToddHead, 0, x+image_xscale, y+1, xscale, 1, 0, c_white, 1);
	draw_sprite_ext(gunsprite, 0, x, y, xscale, 1, gunangle, c_white, 1);
}

shader_reset();