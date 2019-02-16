extends Area2D

var _direction = Vector2(-1, 0)
var _speed = 100

func get_speed():
	return _speed
	
func set_speed(speed):
	_speed = speed
	
func _process(delta):
	set_position(get_position() + (_direction * _speed * delta))
	
func get_direction():
	return _direction

func set_direction(new_dir):
	_direction = new_dir