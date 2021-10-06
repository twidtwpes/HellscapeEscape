if(file_exists(SAVEFILE)){
	var settingsmap = load_hash();
	objSettings_Tracker.fullscreen = settingsmap[? "fullscreen"];
	objSettings_Tracker.mute = settingsmap[? "mute"];
	objSettings_Tracker.audio_level = settingsmap[? "audio_level"];
	objSettings_Tracker.controls = settingsmap[? "controls"];
}else{
	var settingsmap = ds_map_create();
	ds_map_add(settingsmap, "fullscreen", objSettings_Tracker.fullscreen);
	ds_map_add(settingsmap, "mute", objSettings_Tracker.mute);
	ds_map_add(settingsmap, "audio_level", objSettings_Tracker.audio_level);
	ds_map_add(settingsmap, "controls", objSettings_Tracker.controls);
	save_settings(settingsmap);
}

if(objSettings_Tracker.mute) audio_master_gain(0); else audio_master_gain((objSettings_Tracker.audio_level/10));
window_set_fullscreen(objSettings_Tracker.fullscreen);

stime = get_timer();
