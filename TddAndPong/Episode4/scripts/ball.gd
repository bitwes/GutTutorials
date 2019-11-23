extends Area2D

var _speed = 0
var _direction = Vector2(0, 0)

func get_speed():
	return _speed
	
func set_speed(speed):
	_speed = speed
	
func get_direction():
	return _direction

func set_direction(direction):
	if(!direction.is_normalized()):
		_direction = direction.normalized()
	else:
		_direction = direction

func _process(delta):
	var new_pos =  _speed * _direction * delta
	set_position(get_position() + new_pos)
	
func _draw():
	draw_circle(Vector2(0 ,0), $Shape.shape.radius, Color(0, 0, 1))