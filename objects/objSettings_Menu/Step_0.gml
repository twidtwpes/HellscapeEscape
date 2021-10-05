function select_item(){
	menu_committed = menu_cursor;
	menu_control = false;
}

var key_down = false;
var key_up = false;
var key_enter = false;
var gp_down = false;
var gp_up = false;
var gp_enter = false;
	
if(objSettings_Tracker.controls == 0){
	key_down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
	key_up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
	key_enter = keyboard_check_pressed(vk_enter);
}else{
	gp_down = gamepad_button_check_pressed(0,gp_padd);
	gp_up = gamepad_button_check_pressed(0,gp_padu);
	gp_enter = gamepad_button_check_pressed(0,gp_face1);
}

if(menu_control){
	if(key_down || gp_down){
		menu_cursor++;
		if(menu_cursor >= menu_items) menu_cursor = 0;
	}
	if(key_up || gp_up){
		menu_cursor--;
		if(menu_cursor < 0) menu_cursor = menu_items - 1;
	}
	if(key_enter || gp_enter){
		select_item();
		if(gp_enter) screen_shake(2,7,0.2,0.2,10);
	}
	if(objSettings_Tracker.controls == 0){
		if(position_meeting(mouse_x, mouse_y, objSettings_FullScreen)){
			menu_cursor = 0;
			if(mouse_check_button_pressed(mb_left)) select_item();
		}
		if(position_meeting(mouse_x, mouse_y, objSettings_Audio)){
			menu_cursor = 1;
			if(mouse_check_button_pressed(mb_left)) select_item();
		}
		if(position_meeting(mouse_x, mouse_y, objSettings_Controls)){
			menu_cursor = 2;
			if(mouse_check_button_pressed(mb_left)) select_item();
		}
		if(position_meeting(mouse_x, mouse_y, objSettings_Credits)){
			menu_cursor = 3;
			if(mouse_check_button_pressed(mb_left)) select_item();
		}
	}
}else{
	switch(menu_cursor){
		case 0: 
			update_settings("fullscreen", !objSettings_Tracker.fullscreen);
			set_menu(1, 0, 0, 0, 47);
			window_set_fullscreen(objSettings_Tracker.fullscreen);
			menu_control = true;
			break;
		case 1: room_goto(rmAudio); break;
		case 2: room_goto(rmControls); break;
		case 3: room_goto(rmCredits); break;
	}
}

switch(menu_cursor){
	case 0: set_menu(1, 0, 0, 0, 47); break;
	case 1: set_menu(0, 1, 0, 0, 105); break;
	case 2: set_menu(0, 0, 1, 0, 173); break;
	case 3: set_menu(0, 0, 0, 1, 241); break;
}

if((objSettings_Tracker.controls == 0 && ((position_meeting(mouse_x, mouse_y, objSettings_BackKM) && mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(vk_escape))) || (objSettings_Tracker.controls == 1 && gamepad_button_check_pressed(0,gp_face2))){
	room_goto(rmTitle);
}