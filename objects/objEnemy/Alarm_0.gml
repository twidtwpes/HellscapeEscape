move_dir = get_weighted_value(move_weights);
speed = move_speed;
move_rnd = random_range(-45, 45);
current_move = move_ammount;
alarm[0] = irandom_range(move_timer - move_timer_rnd, move_timer + move_timer_rnd);