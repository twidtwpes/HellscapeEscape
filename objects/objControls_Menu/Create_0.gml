function change_controls(){
	if(objSettings_Tracker.controls == 0){
		objSettings_Tracker.controls = 1;
		update_settings("controls", objSettings_Tracker.controls);
		objControls_Gamepad_Off.image_alpha = 0;
		objControls_Gamepad_OffHighlight.image_alpha = 0;
		objControls_Gamepad_On.image_alpha = 1;
		objControls_Gamepad_OnHighlight.image_alpha = 1;
		objControls_BackKM.image_alpha = 0;
		objControls_BackGP.image_alpha = 1;
		layer_set_visible("Keyboard", false);
		layer_set_visible("Gamepad", true);
	}else{
		objSettings_Tracker.controls = 0;
		update_settings("controls", objSettings_Tracker.controls);
		objControls_Gamepad_Off.image_alpha = 1;
		objControls_Gamepad_OffHighlight.image_alpha = 1;
		objControls_Gamepad_On.image_alpha = 0;
		objControls_Gamepad_OnHighlight.image_alpha = 0;
		objControls_BackKM.image_alpha = 1;
		objControls_BackGP.image_alpha = 0;
		layer_set_visible("Keyboard", true);
		layer_set_visible("Gamepad", false);
	}
}

objControls_GamepadHighlight.image_alpha = 1;
objControls_AimHighlight.image_alpha = 0;
if(objSettings_Tracker.controls == 0){
	objControls_Gamepad_Off.image_alpha = 1;
	objControls_Gamepad_OffHighlight.image_alpha = 1;
	objControls_Gamepad_On.image_alpha = 0;
	objControls_Gamepad_OnHighlight.image_alpha = 0;
	objControls_BackKM.image_alpha = 1;
	objControls_BackGP.image_alpha = 0;
	layer_set_visible("Keyboard", true);
	layer_set_visible("Gamepad", false);
}else{
	objControls_Gamepad_Off.image_alpha = 0;
	objControls_Gamepad_OffHighlight.image_alpha = 0;
	objControls_Gamepad_On.image_alpha = 1;
	objControls_Gamepad_OnHighlight.image_alpha = 1;
	objControls_BackKM.image_alpha = 0;
	objControls_BackGP.image_alpha = 1;
	layer_set_visible("Keyboard", false);
	layer_set_visible("Gamepad", true);
}

objControls_Aim.image_alpha = 0;
objControls_Aim_Left.image_alpha = 0;
objControls_Aim_LeftHighlight.image_alpha = 0;
objControls_Aim_Right.image_alpha = 0;
objControls_Aim_RightHighlight.image_alpha = 0;