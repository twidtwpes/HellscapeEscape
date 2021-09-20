if(!dead){
	move_opt = get_weighted_value(move_weights);

	if(move_opt == 0){
		var dir = irandom(array_length(move_directions)-1);
		move_dir = move_directions[dir];
		speed = move_speed;
		move_rnd = random_range(-45, 45);
		current_move = move_ammount;
		image_xscale = choose(1, -1);
	}else if(move_opt == 1){
		direction = 0;
		speed = 0;
	}else if(move_opt ==2){
		current_move = 20;
		move_towards_point(objTodd.x, objTodd.y, 2);
		sprite_index = sptHornet_Attack;
		var p_dir = point_direction(x, y, objTodd.x, objTodd.y);
		if(p_dir > 90 && p_dir < 270) image_xscale = -1; else image_xscale = 1;
	}
	alarm[0] = irandom_range(move_timer - move_timer_rnd, move_timer + move_timer_rnd);
}

//move_dir = get_weighted_value(move_weights);
//speed = move_speed;
//move_rnd = random_range(-45, 45);
//current_move = move_ammount;
//alarm[0] = irandom_range(move_timer - move_timer_rnd, move_timer + move_timer_rnd);