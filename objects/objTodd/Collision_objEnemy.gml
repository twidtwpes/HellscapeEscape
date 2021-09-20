if(!other.dead){
	if(recovery_remain < 0){
		hp-=other.ap;
		recovery_remain = recovery;
		flash = 5;
		hsp = lengthdir_x(10,other.direction);
		vsp = lengthdir_y(10,other.direction);
		screen_shake(6,10,0.4,0.4,12);
	}else{
		recovery_remain--;
	}
}