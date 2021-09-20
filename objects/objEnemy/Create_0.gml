move_options = [0, 90, 180, 270];
move_weights = [10, 20, 30, 40];
current_move = 0;
move_dir = 0;
move_rnd = 0;
dir_change = 1;
dir_wait = 0;
alarm[0] = irandom_range(move_timer - move_timer_rnd, move_timer + move_timer_rnd);