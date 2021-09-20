//window_set_fullscreen(true);

//Tile Macros
#macro CELL_WIDTH 32
#macro CELL_HEIGHT 32
#macro FLOOR -5
#macro WALL -6
#macro VOID -7

#macro NORTH 1
#macro WEST 2
#macro EAST 4
#macro SOUTH 8

//Gun Macros
#macro REVOLVER 0
#macro MACHINEGUN 1
#macro SUBMACHINEGUN 2
#macro ASSAULTRIFFLE 3
#macro KNIFE 4
#macro SWORD 5
#macro KATANA 6
#macro CLUB 7
#macro MALLET 8

#macro RECOILSTART 0
#macro FIRINGDELAYSTART 1
#macro YOFFSET 2
#macro XOFFSET 3
#macro BOFFSET 4
#macro BANGLEOFFSET 5
#macro SPREAD 6
#macro BSPEED 7


function wait(stime,secs){
	var microsecs = secs * 1000000;
	if(get_timer() >= stime + microsecs) return true; else return false;
}

function grid_place_meeting(_object,_grid){
	var _top_right = _grid[# (_object.bbox_right-1) div CELL_WIDTH, _object.bbox_top div CELL_HEIGHT] == VOID;
	var _top_left = _grid[# _object.bbox_left div CELL_WIDTH, _object.bbox_top div CELL_HEIGHT] == VOID;
	var _bottom_right = _grid[# (_object.bbox_right-1) div CELL_WIDTH, (_object.bbox_bottom-1) div CELL_HEIGHT] == VOID;
	var _bottom_left = _grid[# _object.bbox_left div CELL_WIDTH, (_object.bbox_bottom-1) div CELL_HEIGHT] == VOID;
	
	return _top_right || _top_left || _bottom_right || _bottom_left;
}

function screen_shake(magnitude,frames,leftrumble,rightrunble,rumbleframes){
	with(objCamera){
		if(magnitude > shake_remain){
			shake_magnitude = magnitude;
			shake_remain = magnitude;
			shake_length = frames;
		}
		if(instance_exists(objTodd) && objTodd.controller == 1){
			if(leftrumble > vibrate_left || rightrunble > vibrate_right){
				vibrate_left = leftrumble;
				vibrate_right = rightrunble;
				vibrate_remain = rumbleframes;
			}
		}else{
			if(leftrumble > vibrate_left || rightrunble > vibrate_right){
				vibrate_left = leftrumble;
				vibrate_right = rightrunble;
				vibrate_remain = rumbleframes;
			}
		}
	}
}

function get_empty_floor(obj){
	var list_size = (ds_list_size(obj.floor_list) - 1) div 2;
	var list_index = (irandom_range(0, list_size)) * 2;
	var list_value = ds_list_find_value(obj.floor_list, list_index);
	while(ds_list_find_index(obj.floor_used_list, list_value) != -1){
		list_index = (irandom_range(0, list_size)) * 2;
		list_value = ds_list_find_value(obj.floor_list, list_index);
	}
	ds_list_add(obj.floor_used_list, list_value);
	var start_x = list_value[0] * CELL_WIDTH + CELL_WIDTH/2;
	var start_y = list_value[1] * CELL_HEIGHT + CELL_HEIGHT/2;
	return [start_x, start_y];
}

function get_weighted_value(options){
	var weight_total = 0;
	var weight_array = array_create(array_length(options));
	for(var _i = 0; _i < array_length(options); _i++) {
	   weight_total += options[_i];
	   weight_array[_i] = weight_total;
	}
	var rnd = random(weight_total);
	for(var _i = 0; _i < array_length(options); _i++) {
	  if(rnd < weight_array[_i]) return _i;
	  //rnd -= options[_i];
	}
}
