if(!dead){
	hp-=other.ap;
	flash = 3;
	spd_array[1] = 1;
	dir_array[1] = other.direction;
	amt_array[1] = 10;
	xsc_array[1] = sign(dir_array[1]);
	new_move = true;
	with(other){
		instance_destroy();
	}
	if(hp <= 0){
		//layer = layer_get_id("Dead");
		dead = true;
		instance_create_layer(x, y, "Dead", objHornetDead);
		//sprite_index = sptHornet_Dead;
		//image_index = 0;
		//image_speed = 0;
		screen_shake(5,8,0.4,0.4,8);
		instance_destroy();
	}
}