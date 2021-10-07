title_menu = 0;

fullscreen = false;
mute = true;
audio_level = 9;
controls = 0;

level = 1;
stage = 1;
kills = 0;

lifetime_kills = 0;
lifetime_hours = 0;
session_kills = 0;
session_hours = 0;
furthest_complete = 0;
session_complete = 0;
weapons_received = [];
specials_received = [];
ultras_received = [];
weapon_default = [];
specials_default = [];
ultras_default = [];
weapon_pellets = 0;
special_pellets = 0;
ultra_pellets = 0;
weapon_lockers_available = [];
special_lockers_available = [];
ultra_lockers_available = [];


title_menu = 0;

level = 1;
stage = 1;
kills = 0;

settings = ds_map_create();
ds_map_add(settings, "fullscreen", false);
ds_map_add(settings, "mute", true);
ds_map_add(settings, "audio_level", 9);
ds_map_add(settings, "controls", 0);

stats = ds_map_create();
ds_map_add(stats, "lifetime_kills", 0);
ds_map_add(stats, "lifetime_hours", 0);
ds_map_add(stats, "session_kills", 0);
ds_map_add(stats, "session_hours", 0);
ds_map_add(stats, "furthest_complete", 0);
ds_map_add(stats, "session_complete", 0);
ds_map_add(stats, "weapons_received", []);
ds_map_add(stats, "specials_received", []);
ds_map_add(stats, "ultras_received", []);
ds_map_add(stats, "weapon_default", []);
ds_map_add(stats, "specials_default", []);
ds_map_add(stats, "ultras_default", []);
ds_map_add(stats, "weapon_pellets", 0);
ds_map_add(stats, "special_pellets", 0);
ds_map_add(stats, "ultra_pellets", 0);
ds_map_add(stats, "weapon_lockers_available", []);
ds_map_add(stats, "special_lockers_available", []);
ds_map_add(stats, "ultra_lockers_available", []);

