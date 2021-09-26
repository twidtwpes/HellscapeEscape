//window_set_fullscreen(true);

//Tile Macros
#macro CELL_WIDTH 32
#macro CELL_HEIGHT 32
#macro FLOOR -5
//#macro ANY -6
#macro VOID -7

#macro NORTH 1
#macro WEST 2
#macro EAST 4
#macro SOUTH 8

//global.upperleft = [FLOOR, FLOOR, ANY, FLOOR, VOID, VOID, ANY, VOID, ANY];
//global.uppermid = [ANY, FLOOR, ANY, VOID, VOID, VOID, ANY, VOID, ANY];
//global.upperright = [ANY, FLOOR, FLOOR, VOID, VOID, FLOOR, ANY, VOID, ANY];
//global.middleleft = [ANY, VOID, ANY, FLOOR, VOID, VOID, ANY, VOID, ANY];
//global.middlemid = [VOID, VOID, VOID, VOID, VOID, VOID, VOID, VOID, VOID];
//global.middleright = [ANY, VOID, ANY, VOID, VOID, FLOOR, ANY, VOID, ANY];
//global.bottomleft = [ANY, VOID, ANY, VOID, VOID, FLOOR, ANY, VOID, ANY];

//function grid_tile_check(tile_grid, tile_x, tile_y, tile_array){

//}

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
	//var start_x = list_value[0] * CELL_WIDTH + CELL_WIDTH/2;
	//var start_y = list_value[1] * CELL_HEIGHT + CELL_HEIGHT/2;
	//return [start_x, start_y];
	
	return [list_value[0], list_value[1]];
}

function knock_out_walls(grid, _x, _y){
	var edge_id = layer_tilemap_get_id("WallTilesEdge");
	var front_id = layer_tilemap_get_id("WallTilesFront");
	var back_id = layer_tilemap_get_id("WallTilesBack");
	var clear_id = layer_get_id("FloorClear");
	
	clear_wall(grid, _x-1, _y-1, front_id, back_id, edge_id, clear_id);
	clear_wall(grid, _x, _y-1, front_id, back_id, edge_id, clear_id);
	clear_wall(grid, _x+1, _y-1, front_id, back_id, edge_id, clear_id);
	clear_wall(grid, _x-1, _y, front_id, back_id, edge_id, clear_id);
	clear_wall(grid, _x+1, _y, front_id, back_id, edge_id, clear_id);
	clear_wall(grid, _x-1, _y+1, front_id, back_id, edge_id, clear_id);
	clear_wall(grid, _x, _y+1, front_id, back_id, edge_id, clear_id);
	clear_wall(grid, _x+1, _y+1, front_id, back_id, edge_id, clear_id);
}

function clear_wall(grid, _x, _y, front_id, back_id, edge_id, clear_id){
	if(grid[# _x,_y] == VOID){
		grid[# _x,_y] = FLOOR;
		tilemap_set(back_id,0,_x,_y);
		tilemap_set(front_id,0,_x,_y);
		tilemap_set(edge_id,0,_x-1,_y);
		tilemap_set(edge_id,0,_x+1,_y);
		var clear_x = _x * CELL_WIDTH;
		var clear_y = _y * CELL_HEIGHT;
		with(instance_create_layer(clear_x-1, clear_y-1, clear_id, objFloorClearOne)){
			//var rot = choose(0,90,180,270);
			//image_angle = rot;
			//image_index = 0;
		}
	} 
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
