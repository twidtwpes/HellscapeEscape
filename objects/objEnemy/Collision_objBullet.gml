if(!dead){
	hp-=other.ap;
	flash = 3;
	hitfrom = other.direction;
	hsp = lengthdir_x(3,other.direction);
	vsp = lengthdir_y(3,other.direction);
	if(sign(hsp) != 0) other.image_xscale = sign(hsp);
	with(other){
		instance_destroy();
	}
	if(hp <= 0){
		sprite_index = sptHornet_Dead;
		image_index = 0;
		image_speed = 0;
		dead = true;
	}
}