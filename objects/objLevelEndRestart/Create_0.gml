xx = x;
yy = y;
offset = 2;
start_time = get_timer();

if(objTrackEnemies.enemy_count == 0){
	objLevelEndGameOver.image_xscale = 0;
}else{
	objLevelEndYouWon.image_xscale = 0;
}