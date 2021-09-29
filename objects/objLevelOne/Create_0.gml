randomize();

shadow_surface_ = noone;

// Get the tile layer map id
var _wall_map_edge_id = layer_tilemap_get_id("WallTilesEdge");
var _wall_map_front_id = layer_tilemap_get_id("WallTilesFront");
var _wall_map_back_id = layer_tilemap_get_id("WallTilesBack");
var _wall_map_clear_id = layer_get_id("FloorClear");

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
	if(_controller_x < 4 || _controller_x >= width_ - 4){
		_controller_x += -_x_direction * 4;
	}
	if(_controller_y < 4 || _controller_y >= height_ - 4){
		_controller_y += -_y_direction * 4;
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


//Place extra tiles
for(var _n = 1; _n < 400; _n++){
		var extra_x = (irandom_range(0, width_-1) * CELL_WIDTH) - 2;
		var extra_y = (irandom_range(0, height_-1) * CELL_WIDTH) - 2;
		instance_create_layer(extra_x, extra_y, "FloorExtra", objFloorExtraOne);
}

//Place extra objects
var _t = irandom_range(1,5);
for(var _n = 1; _n < _t; _n++){
		var grid_x = irandom_range(1, width_-1);
		var grid_y = irandom_range(1, height_-1);
		if(grid_[# grid_x, grid_y] == FLOOR){
			var extra_x = grid_x * CELL_WIDTH + CELL_WIDTH/2;
			var extra_y = grid_y * CELL_WIDTH + CELL_WIDTH/2;
			instance_create_layer(extra_x, extra_y, "ExtraObjects", objGate1One);
			knock_out_walls(grid_, grid_x, grid_y);
		}
}

// Getting available tiles
floor_list = ds_list_create();
floor_used_list = ds_list_create();
for(var _y = 1; _y < height_-1; _y++){
	for(var _x = 1; _x < width_ - 1; _x++){
		if(grid_[# _x, _y] == FLOOR) ds_list_add(floor_list, [_x,_y]);
	}
}

////Place Todd
//var list_value = get_empty_floor(self);
//var start_x = list_value[0] * CELL_WIDTH + CELL_WIDTH/2;
//var start_y = list_value[1] * CELL_HEIGHT + CELL_HEIGHT/2;
//instance_create_layer(start_x, start_y, "Todd", objTodd);
//knock_out_walls(grid_, list_value[0], list_value[1]);


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
			
			if(grid_[# _x-1,_y] == FLOOR && grid_[# _x,_y+1] == VOID){
				_tile_index = choose(1,2);
				tilemap_set(_wall_map_edge_id,_tile_index,_x-1,_y);
			}
			if(grid_[# _x-1,_y] == FLOOR && grid_[# _x,_y+1] == FLOOR){
				_tile_index = choose(3,4);
				tilemap_set(_wall_map_edge_id,_tile_index,_x-1,_y);
			}
			if(grid_[# _x+1,_y] == FLOOR && grid_[# _x,_y+1] == VOID){
				_tile_index = choose(5,6);
				tilemap_set(_wall_map_edge_id,_tile_index,_x+1,_y);
			}
			if(grid_[# _x+1,_y] == FLOOR && grid_[# _x,_y+1] == FLOOR){
				_tile_index = choose(7,8);
				tilemap_set(_wall_map_edge_id,_tile_index,_x+1,_y);
			}
		}else{
			ds_list_add(floor_list, [_x,_y]);
		}
	}
}

//Place Todd
var list_value = get_empty_floor(self);
var start_x = list_value[0] * CELL_WIDTH + CELL_WIDTH/2;
var start_y = list_value[1] * CELL_HEIGHT + CELL_HEIGHT/2;
instance_create_layer(start_x, start_y, "Todd", objTodd);
knock_out_walls(grid_, list_value[0], list_value[1]);


//Place enemies
enemy_types = [objHornet, objDemon];
enemy_counts = [irandom_range(10,10),irandom_range(10,10)];
enemy_layers = ["EnemiesFlying", "EnemiesGrounded"];
enemy_knockout = [false, true];
for(var i = 0; i < array_length(enemy_types); i++){
	for(var j = 1; j <= enemy_counts[i]; j++){
		var list_value = get_empty_floor(self);
		var start_x = list_value[0] * CELL_WIDTH + CELL_WIDTH/2;
		var start_y = list_value[1] * CELL_HEIGHT + CELL_HEIGHT/2;
		instance_create_layer(start_x, start_y, enemy_layers[i], enemy_types[i]);
		if(enemy_knockout[i]) knock_out_walls(grid_, list_value[0], list_value[1]);
	}
}
