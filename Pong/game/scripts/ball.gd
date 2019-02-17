extends Area2D

var _direction = Vector2(-1, 0)
var _start_speed = 200
var _speed = _start_speed
var _max_speed = 700

func get_max_speed():
	return _max_speed

func set_max_speed(speed):
	_max_speed = speed

func get_speed():
	return _speed

func set_speed(speed):
	_speed = speed
	if(_speed > _max_speed):
		_speed = _max_speed

func _process(delta):
	set_position(get_position() + (_direction * _speed * delta))

func get_direction():
	return _direction

func set_direction(new_dir):
	_direction = new_dir

func increment_speed(how_much):
	set_speed(_speed + how_much)

func reset():
	set_speed(_start_speed)
	set_direction(Vector2(-1, 0))

func get_start_speed():
	return _start_speed
