//if(!dead){
//	x += hsp;
//	y += vsp;
//	hsp = 0;
//	vsp = 0;

//	if(move_opt == 0){
//		if(grid_place_meeting(self, objLevelOne.grid_)){
//			speed = -speed;
//		}
//		if(current_move > 0){
//			direction = (move_dir + move_rnd);
//			move_rnd--;
//			current_move--;
//		}else{
//			direction = 0;
//			speed = 0;
//		}
//	}else if(move_opt == 2){
//		if(current_move > 0){
//			current_move--;
//		}else{
//			direction = 0;
//			speed = 0;
//			sprite_index = sptHornet;
//		}
//	}
//	if collision_circle(x, y, 100, objTodd, false, true) move_weights[2] = 80; else move_weights[2] = 0;
//}else{
//	direction = 0;
//	speed = 0;
//}


if(!dead){
	
	var tmp_spd = 0, tmp_dir = 0, tmp_amt = 0, tmp_xsc = 1;
	for(var _i = 0; _i < array_length(spd_array); _i++){
		if(spd_array[_i] != 0){
			tmp_spd = spd_array[_i];
			tmp_dir = dir_array[_i];
			tmp_amt = amt_array[_i];
		}
		//tmp_xsc += xsc_array[_i];
	}
	
	//if(move_opt == 1){
	//	tmp_dir = (direction + move_rnd);
	//}
	if(move_opt == 1){
		tmp_xsc = choose(-1, 1);
	}else if(move_opt == 2){
		tmp_xsc = sign(point_direction(x, y, objTodd.x, objTodd.y));
	}
		
	if(new_move){
		current_move = tmp_amt;
		direction = tmp_dir;
		speed = tmp_spd;
		//if(tmp_xsc != 0) image_xscale = sign(tmp_xsc);
		image_xscale = tmp_xsc;
		new_move = false;
	}
	direction = (direction + move_rnd);
		
	if(current_move > 0){
		//if(move_rnd != 0) move_rnd--;
		current_move--;
	}else{
		direction = 0;
		speed = 0;
		sprite_index = sptHornet;
	}
	
	// Check collision
	if(grid_place_meeting(self, objLevelOne.grid_)){
		speed = -speed;
	}
	
	// Check attack radius
	if collision_circle(x, y, 100, objTodd, false, true) move_weights[2] = 80; else move_weights[2] = 0;
	
	spd_array = [0, 0, 0, 0];
	dir_array = [0, 0, 0, 0];
	amt_array = [0, 0, 0, 0];
	xsc_array = [0, 0, 0, 0];
}else{
	direction = 0;
	speed = 0;
}