var key_enter = false;
var gp_enter = false;
	
if(objSettings_Tracker.controls == 0){
	key_enter = keyboard_check_pressed(vk_enter);
}else{
	gp_enter = gamepad_button_check_pressed(0,gp_face1);
}

if(key_enter || gp_enter) change_controls();

if(objSettings_Tracker.controls == 0){
	if(position_meeting(mouse_x, mouse_y, objControls_Gamepad)){
		if(mouse_check_button_pressed(mb_left)) change_controls();
	}
}

if((objSettings_Tracker.controls == 0 && ((position_meeting(mouse_x, mouse_y, objSettings_BackKM) && mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(vk_escape))) || (objSettings_Tracker.controls == 1 && gamepad_button_check_pressed(0,gp_face2))){
	room_goto(rmSettings);
}