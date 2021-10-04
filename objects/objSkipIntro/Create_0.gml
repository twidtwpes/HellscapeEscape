if(objSettings_Tracker.mute) audio_master_gain(0); else audio_master_gain(objSettings_Tracker.audio_level);
window_set_fullscreen(objSettings_Tracker.fullscreen);

audio_play_sound(sndTGP, 1, true);