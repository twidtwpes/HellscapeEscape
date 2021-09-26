if(other.image_speed == 0 && !destroyed){
	flash = 3;
	with(other){
		instance_destroy();
	}
	destroyed = true;
	instance_create_layer(x, y, "ExtraObjects", objGate1OneDestroyed);
	screen_shake(5,8,0.4,0.4,8);
	instance_destroy();
}