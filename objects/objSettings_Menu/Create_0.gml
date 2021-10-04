function set_menu(fs, au, cn, cr, yy){
	objSettings_FullscreenHighlight.image_alpha = fs;
	if(objSettings_Tracker.fullscreen){
		objSettings_Fullscreen_OffHighlight.image_alpha = 0;
		objSettings_Fullscreen_Off.image_alpha = 0;
		objSettings_Fullscreen_On.image_alpha = 1;
		objSettings_Fullscreen_OnHighlight.image_alpha =fs;
	}else{
		objSettings_Fullscreen_OffHighlight.image_alpha = fs;
		objSettings_Fullscreen_Off.image_alpha =1;
		objSettings_Fullscreen_On.image_alpha = 0;
		objSettings_Fullscreen_OnHighlight.image_alpha = 0;
	}
	objSettings_AudioHighlight.image_alpha = au;
	objSettings_ControlsHighlight.image_alpha = cn;
	objSettings_CreditsHighlight.image_alpha = cr;
	objSettings_Select.y = yy;
	if(objSettings_Tracker.controls == 0){
		objSettings_BackKM.image_alpha = 1;
		objSettings_BackGP.image_alpha = 0;
	}else{
		objSettings_BackKM.image_alpha = 0;
		objSettings_BackGP.image_alpha = 1;
	}
}

set_menu(1, 0, 0, 0, 47);

menu_control = true;
menu_cursor = 0;
menu_items = 4;
menu_committed = false;