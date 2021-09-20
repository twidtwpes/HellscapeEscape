if(!dead){
	x += hsp;
	y += vsp;
	hsp = 0;
	vsp = 0;
	
	dir_wait--;
	if(grid_place_meeting(self, objLevelOne.grid_) && dir_wait < 0){
		dir_change = -dir_change;
		dir_wait = 10;
	}
	if(current_move > 0){
		direction = (move_options[move_dir] + move_rnd) * dir_change;
		move_rnd--;
		current_move--;
	}else{
		direction = 0;
		speed = 0;
	}
}else{
	direction = 0;
	speed = 0;
}