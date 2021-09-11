/// @description Fade In Glow Pig


if(fade_in){
	image_alpha = min(1, image_alpha + fade_ammount);
	if(image_alpha == 1) fade_in = false;
}else{
	image_alpha = max(0, image_alpha - fade_ammount);
	if(image_alpha == 0) fade_in = true;
}