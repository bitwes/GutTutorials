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
	set_position(get_position() + Vector2(0, delta * _speed * -1))

func move_down(delta):
	set_position(get_position() + Vector2(0, delta * _speed))