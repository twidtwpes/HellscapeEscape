randomize();

shadow_surface_ = noone;

// Get the tile layer map id
var _wall_map_front_id = layer_tilemap_get_id("WallTilesFront");
var _wall_map_back_id = layer_tilemap_get_id("WallTilesBack");

// Set up the grid
width_ = room_width div CELL_WIDTH;
height_ = room_height div CELL_HEIGHT;
grid_ = ds_grid_create(width_,height_);
ds_grid_set_region(grid_,0,0,width_,height_,VOID);

// Create the controller
var _controller_x = width_ div 2;
var _controller_y = height_ div 2;
var _controller_direction = irandom(3);
var _steps = 400;

//var _player_start_x = _controller_x * CELL_WIDTH + CELL_WIDTH/2;
//var _player_start_y = _controller_y * CELL_HEIGHT + CELL_HEIGHT/2;
//instance_create_layer(_player_start_x, _player_start_y, "Todd", objTodd);

var _direction_change_odds = 1;

repeat (_steps){
	grid_[# _controller_x, _controller_y] = FLOOR;
	
	// Randomize the direction
	if(irandom(_direction_change_odds) == _direction_change_odds){
		_controller_direction = irandom(3);
	}
	
	// Move the controller
	var _x_direction = lengthdir_x(1,_controller_direction * 90);
	var _y_direction = lengthdir_y(1,_controller_direction * 90);
	_controller_x += _x_direction;
	_controller_y += _y_direction;
	
	// Maker sure we don't go outside the grid
	if(_controller_x < 2 || _controller_x >= width_ - 2){
		_controller_x += -_x_direction * 2;
	}
	if(_controller_y < 2 || _controller_y >= height_ - 2){
		_controller_y += -_y_direction * 2;
	}
}

//// Removing single tiles
//for(var _y = 1; _y < height_-1; _y++){
//	for(var _x = 1; _x < width_ - 1; _x++){
//		if(grid_[# _x, _y] != FLOOR){
//			var _north_tile = grid_[# _x,_y-1] == VOID;
//			var _west_tile = grid_[# _x-1,_y] == VOID;
//			var _east_tile = grid_[# _x+1,_y] == VOID;
//			var _south_tile = grid_[# _x,_y+1] == VOID;
			
//			var _tile_index = NORTH*_north_tile + WEST*_west_tile + EAST*_east_tile + SOUTH*_south_tile + 1;
//			if(_tile_index == 1) grid_[# _x,_y] = FLOOR;
//		}
//	}
//}

// Create floor arrays
floor_list = ds_list_create();
floor_used_list = ds_list_create();

// Placing tiles
for(var _y = 1; _y < height_-1; _y++){
	for(var _x = 1; _x < width_ - 1; _x++){
		if(grid_[# _x, _y] != FLOOR){
			var _north_tile = grid_[# _x,_y-1] == VOID;
			var _west_tile = grid_[# _x-1,_y] == VOID;
			var _east_tile = grid_[# _x+1,_y] == VOID;
			var _south_tile = grid_[# _x,_y+1] == VOID;
			
			var _tile_index = NORTH*_north_tile + WEST*_west_tile + EAST*_east_tile + SOUTH*_south_tile + 1;
			tilemap_set(_wall_map_back_id,_tile_index,_x,_y);
			tilemap_set(_wall_map_front_id,_tile_index,_x,_y);
		}else{
			ds_list_add(floor_list, [_x,_y]);
		}
	}
}



var list_value = get_empty_floor(self);
instance_create_layer(list_value[0], list_value[1], "Todd", objTodd);

enemy_types = [objHornet];
enemy_counts = [irandom_range(10,30)];
for(var i = 0; i < array_length(enemy_types); i++){
	for(var j = 1; j <= enemy_counts[i]; j++){
		var list_value = get_empty_floor(self);
		instance_create_layer(list_value[0], list_value[1], "Enemies", enemy_types[i]);
	}
}


