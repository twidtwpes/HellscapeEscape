if(fade_out){
	image_alpha = max(0, image_alpha - fade_ammount);
	if(image_alpha == 0) fade_out = false;
	start_time = get_timer();
}else{
		if(wait(start_time, 1)){
			image_alpha = min(1, image_alpha + fade_ammount);
			if(image_alpha == 1){
				instance_create_layer(80,26,"Logos",objGameMaker);
				with(objEpicPigLogo) instance_destroy();
				instance_destroy();
			}
		}
}

//if(keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0,gp_face1)){
//	room_goto_next();
//}