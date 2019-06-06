func bounce(ball):
	var new_y = rand_range(-.5, .5)
	var new_x = ball.get_direction().x * -1
	ball.set_direction(Vector2(new_x, new_y))