#region Hit Back
x += hsp;
y += vsp;
hsp = 0;
vsp = 0;
#endregion Hit Back
	
#region Check Death
if(hp <= 0){
	room_goto(rmEndLevel);
}
#endregion Check Death

#region Get Player Input
if(hascontrol){
	//check keyboard first
	var key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	var key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	var key_up = keyboard_check(vk_up) || keyboard_check(ord("W"));
	var key_down = keyboard_check(vk_down) || keyboard_check(ord("S"));
	if(key_left || key_right || key_up || key_down) controller = 0;

	//overwrite with dpad
	if(gamepad_button_check(0,gp_padl)){
		key_left = 1;
		controller = 1;
	}
	if(gamepad_button_check(0,gp_padr)){
		key_right = 1;
		controller = 1;
	}
	if(gamepad_button_check(0,gp_padu)){
		key_up = 1;
		controller = 1;
	}
	if(gamepad_button_check(0,gp_padd)){
		key_down = 1;
		controller = 1;
	}

	//overwrite with left analog
	if(abs(gamepad_axis_value(0,gp_axislh)) > 0.2){
		key_left = abs(min(gamepad_axis_value(0,gp_axislh),0));
		key_right = max(gamepad_axis_value(0,gp_axislh),0);
		controller = 1;
	}
	if(abs(gamepad_axis_value(0,gp_axislv)) > 0.2){
		key_up = abs(min(gamepad_axis_value(0,gp_axislv),0));
		key_down = max(gamepad_axis_value(0,gp_axislv),0);
		controller = 1;
	}

	var _x_input = key_right - key_left;
	var _y_input = key_down - key_up;
	
	x_speed_ += _x_input * acceleration_;
	y_speed_ += _y_input * acceleration_;
}else{
	x_speed_ = 0;
	y_speed_ = 0;
}
#endregion Get Player Input

#region Calculate Movement
var _speed = point_distance(0, 0, x_speed_, y_speed_);
var _direction = point_direction(0, 0, x_speed_, y_speed_);
if(_speed > max_speed_){
	x_speed_ = lengthdir_x(max_speed_, _direction);
	y_speed_ = lengthdir_y(max_speed_, _direction);
}

if(_x_input == 0){
	x_speed_ = lerp(x_speed_, 0, .2);
}
if(_y_input == 0){
	y_speed_ = lerp(y_speed_, 0, .2);
}

if(_x_input == 0 && _y_input ==0){
	sprite_index = sptToddIdel;
	image_speed = 0.7;
}else{
	sprite_index = sptToddWalk;
	image_speed = 0.7;
}
#endregion Calculate Movement

#region Check Collisions
x += x_speed_;
if(x_speed_ > 0){
	image_xscale = 1;
	if(grid_place_meeting(self, objLevelOne.grid_)){
		x = bbox_right&~(CELL_WIDTH-1);
		x -= bbox_right-x;
		x_speed_ = 0;
	}
}else if (x_speed_ < 0){
	image_xscale = -1;
	if(grid_place_meeting(self, objLevelOne.grid_)){
		x = bbox_left&~(CELL_WIDTH-1);
		x += CELL_WIDTH+x-bbox_left;
		x_speed_ = 0;
	}
}

y += y_speed_;
if(y_speed_ > 0){
	if(grid_place_meeting(self, objLevelOne.grid_)){
		y = bbox_bottom&~(CELL_HEIGHT-1);
		y -= bbox_bottom-y;
		y_speed_ = 0;
	}
}else if (y_speed_ < 0){
	if(grid_place_meeting(self, objLevelOne.grid_)){
		y = bbox_top&~(CELL_HEIGHT-1);
		y += CELL_HEIGHT+y-bbox_top;
		y_speed_ = 0;
	}
}
#endregion Check Collisions

#region Set Gun
switch(currentGun){
	case REVOLVER:{
		gunSpt = sptRevolver;
		break;
	}
	case MACHINEGUN:{
		gunSpt = sptMachineGun;
		break;
	}
	case SUBMACHINEGUN:{
		gunSpt = sptSubmachineGun;
		break;
	}
	case ASSAULTRIFFLE:{
		gunSpt = sptAssaultRifle;
		break;
	}
	case KNIFE:{
		gunSpt = sptKnife;
		break;
	}
	case SWORD:{
		gunSpt = sptSword;
		break;
	}
	case KATANA:{
		gunSpt = sptKatana;
		break;
	}
	case CLUB:{
		gunSpt = sptClub;
		break;
	}
	case MALLET:{
		gunSpt = sptMallet;
		break;
	}
}
#endregion Set Gun

#region Update Gun
// Angle gun
if(controller == 0){
	gunangle = point_direction(x,y,mouse_x,mouse_y);
}else{
	var controllerh = gamepad_axis_value(0,gp_axisrh);
	var controllerv = gamepad_axis_value(0,gp_axisrv);
	/*
	if(abs(controllerh > 0.05) || abs(controllerv) > 0.05){
		controllerangle = point_direction(0,0,controllerh,controllerv);
		image_angle = controllerangle;
	}
	*/
	gunangle = point_direction(0,0,controllerh,controllerv);
	//image_angle = gunangle;
}
#endregion Update Gun

#region Move Target
with(objTarget){
	x = other.gx;
	y = other.gy;
	x = x + lengthdir_x(80,other.gunangle);
	y = y + lengthdir_y(80,other.gunangle);
}
#endregion Move Target

#region Fire Gun
// Update firing vars
if(firingdelay > 0) firingdelay--;
recoil = max(0,recoil - 1);

// Check firing
if((mouse_check_button_released(mb_left) || gamepad_button_check_released(0,gp_shoulderrb)) && firingdelay == -5) firingdelay = 0;

if((mouse_check_button(mb_left) || gamepad_button_check(0,gp_shoulderrb)) && firingdelay <= 0 && firingdelay > -5){
	recoil = recoilStart;
	firingdelay = firingdelayStart;
	screen_shake(2,7,0.2,0.2,10);
	//audio_play_sound(snShoot,5,false);
	with(instance_create_layer(gx,gy,"Bullets",objBullet)){
		if(other.gunplaceangle > 90 && other.gunplaceangle <= 270){
			var byoffset = 10;
		}else{
			var byoffset = 0;
		}
		x = x - lengthdir_x(other.boffset,other.gunangle-other.bangleoffset);
		y = y - byoffset - lengthdir_y(other.boffset,other.gunangle-other.bangleoffset);
		speed = other.bSpeed;
		direction = other.gunangle + random_range(-other.spread,other.spread);
		image_angle = direction;
	}
}
#endregion Fire Gun