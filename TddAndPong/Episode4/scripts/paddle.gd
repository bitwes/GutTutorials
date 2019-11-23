extends Area2D

var _speed = 10

func bounce(ball):
	var new_y = rand_range(-.5, .5)
	var new_x = ball.get_direction().x * -1
	ball.set_direction(Vector2(new_x, new_y))

func _draw():
	var e = $Shape.shape.extents
	draw_rect(Rect2(e.x * -1, e.y * -1, e.x * 2, e.y * 2), Color(1, 1, 1))#_color)

func _on_Paddle_area_entered(area):
	bounce(area)

func get_speed():
	return _speed

func set_speed(speed):
	_speed = speed

func move_up(delta):
	var new_pos =  get_position() - Vector2(0, delta * _speed)
	if(new_pos.y < 0):
		new_pos.y = 0
	set_position(new_pos)

func move_down(delta):
	var new_pos =  get_position() + Vector2(0, delta * _speed)
	var max_y = OS.get_window_size().y - get_height()
	if(new_pos.y > max_y):
		new_pos.y = max_y
	set_position(new_pos)

func get_height():
	# needs to be calculated from extents but is a constant number for
	# now.
	return 110
