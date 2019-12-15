extends Area2D

var _speed = 10
var _bounce_speed = 0

func bounce(ball):
	var multiplier = 1
	var low = 0
	var  high = .3
	if(ball.get_position().y <= get_position().y):
		low  = -.3
		high = 0

	var new_y = rand_range(low,  high)
	var new_x = ball.get_direction().x * -1
	ball.set_direction(Vector2(new_x, new_y))
	var speed  = ball.get_speed() + _bounce_speed
	ball.set_speed(speed)

	ball.set_last_paddle_hit(self)

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

func get_bounce_speed():
	return _bounce_speed

func set_bounce_speed(bounce_speed):
	_bounce_speed = bounce_speed

func set_size(height):
	$Shape.shape.extents.y = height
	update()

func get_size():
	return $Shape.shape.extents.y
