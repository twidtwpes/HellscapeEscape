
draw_sprite_ext(sptToddShadow, 0, x, y+9, 1, -.75, 0, c_white, .4);

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

gx = x+(xoffset*xscale);
gy = y+yoffset;
if(gunplaceangle > 0 && gunplaceangle <= 180){
	draw_sprite_ext(gunSpt, 0, gx, gy, xscale, 1, gunangle, c_white, 1);
	if(image_xscale > 0){
		draw_sprite_ext(sptToddHead, 0, x-3, y-25, 1, 1, 0, c_white, 1);
	}else{
		draw_sprite_ext(sptToddHead, 0, x+4, y-25, -1, 1, 0, c_white, 1);
	}
}else{
	if(image_xscale > 0){
		draw_sprite_ext(sptToddHead, 0, x-3, y-25, 1, 1, 0, c_white, 1);
	}else{
		draw_sprite_ext(sptToddHead, 0, x+4, y-25, -1, 1, 0, c_white, 1);
	}
	draw_sprite_ext(gunSpt, 0, gx, gy, xscale, 1, gunangle, c_white, 1);
}

shader_reset();