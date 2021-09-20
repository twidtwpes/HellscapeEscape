// Inherit the parent event
event_inherited();

if(wait(start_time, 0.1)){
	if(keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(0, gp_start)){
		if(selected) room_goto_next(); else if(objTitleControls.selected) room_goto(rmControls);
	}
	if(keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A")) || gamepad_button_check(0,gp_padl)){
		selected = false;
		objTitleControls.selected = true;
	}
	if(keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D")) || gamepad_button_check(0,gp_padr)){
		selected = true;
		objTitleControls.selected = false;
	}
}