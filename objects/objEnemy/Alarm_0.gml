if(!dead){
	move_opt = get_weighted_value(move_weights);

	if(move_opt == 0){
		var dir = irandom(array_length(move_directions)-1);
		//move_dir = move_directions[dir];
		//speed = move_speed;
		//current_move = move_ammount;
		//image_xscale = choose(1, -1);
		
		move_rnd = random_range(-20, 20);
		spd_array[2] = move_speed;
		dir_array[2] = move_directions[dir];
		amt_array[2] = move_ammount;
		xsc_array[2] = choose(1, -1);
		new_move = true;
	}else if(move_opt == 1){
		//direction = 0;
		//speed = 0;
		move_rnd = 0;
		spd_array[0] = 0;
		dir_array[0] = 0;
		amt_array[0] = 0;
		xsc_array[0] = image_xscale;
		new_move = true;
	}else if(move_opt ==2){
		//current_move = 20;
		//move_towards_point(objTodd.x, objTodd.y, 2);
		var p_dir = point_direction(x, y, objTodd.x, objTodd.y);
		//if(p_dir > 90 && p_dir < 270) image_xscale = -1; else image_xscale = 1;
		move_rnd = 0;
		spd_array[3] = 2;
		dir_array[3] = p_dir;
		amt_array[3] = 20;
		if(p_dir > 90 && p_dir < 270) xsc_array[3] = -1; else xsc_array[3] = 1;
		new_move = true;
		sprite_index = sptHornet_Attack;
	}
	alarm[0] = irandom_range(move_timer - move_timer_rnd, move_timer + move_timer_rnd);
}

