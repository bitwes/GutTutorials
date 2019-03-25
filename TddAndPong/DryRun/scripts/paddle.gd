extends Area2D
var Ball = load('res://scripts/ball.gd')
var _speed = 100
var _increment_speed = 10
var _min_y = 0
var _max_y = 600

func get_increment_speed():
	return _increment_speed

func set_increment_speed(increment_speed):
	_increment_speed = increment_speed

func get_min_y():
	return _min_y

func set_min_y(min_y):
	_min_y = min_y

func get_max_y():
	return _max_y

func set_max_y(max_y):
	_max_y = max_y

func get_speed():
	return _speed

func set_speed(speed):
	_speed = speed

func up(delta):
	set_position(get_position() - Vector2(0, _speed * delta))
	if(get_position().y < _min_y):
		set_position(Vector2(get_position().x, _min_y))

func down(delta):
	set_position(get_position() + Vector2(0, _speed * delta))
	if(get_position().y > _max_y):
		position.y = _max_y

func bounce(ball):
	var new_dir = ball.get_direction()
	new_dir.x = new_dir.x * -1
	new_dir.y = randf() * 2 - 1
	ball.set_direction(new_dir.normalized())
	ball.increment_speed(_increment_speed)

func _on_Paddle_area_entered(area):
	if(area is Ball):
		bounce(area)
