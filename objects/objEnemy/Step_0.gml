if(!dead){
	x += hsp;
	y += vsp;
	hsp = 0;
	vsp = 0;
	
	//dir_wait--;
	//if(grid_place_meeting(self, objLevelOne.grid_) && dir_wait < 0){
	//	dir_change = -dir_change;
	//	dir_wait = 10;
	//}
	if(move_opt == 0){
		if(grid_place_meeting(self, objLevelOne.grid_)){
			speed = -speed;
		}
		if(current_move > 0){
			//direction = (move_directions[move_dir] + move_rnd) * dir_change;
			direction = (move_dir + move_rnd);
			move_rnd--;
			current_move--;
		}else{
			direction = 0;
			speed = 0;
		}
	}else if(move_opt == 2){
		if(current_move > 0){
			current_move--;
		}else{
			direction = 0;
			speed = 0;
			sprite_index = sptHornet;
		}
	}
	if collision_circle(x, y, 100, objTodd, false, true) move_weights[2] = 80; else move_weights[2] = 0;
}else{
	direction = 0;
	speed = 0;
}