if((objSettings_Tracker.controls == 0 && ((position_meeting(mouse_x, mouse_y, objCredits_BackKM) && mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(vk_escape))) || (objSettings_Tracker.controls == 1 && gamepad_button_check_pressed(0,gp_face2))){
	room_goto(rmSettings);
}