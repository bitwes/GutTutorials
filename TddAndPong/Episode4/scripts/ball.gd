extends Area2D

var Mmdc = load('res://scripts/mmdc_property.gd')

var _speed = Mmdc.new(100, 900, 100)
var _direction = Vector2(0, 0)

var _last_paddle_hit = null

func get_speed_props():
	return _speed

func get_speed():
	return _speed.get_current()

func set_speed(speed):
	_speed.set_current(speed)

func get_direction():
	return _direction

func set_direction(direction):
	if(!direction.is_normalized()):
		_direction = direction.normalized()
	else:
		_direction = direction

func _process(delta):
	var new_pos =  _speed.get_current() * _direction * delta
	set_position(get_position() + new_pos)

func _draw():
	draw_circle(Vector2(0 ,0), $Shape.shape.radius, Color(0, 0, 1))

func get_max_speed():
	return _speed.get_max()

func set_max_speed(max_speed):
	_speed.set_max(max_speed)


func get_last_paddle_hit():
	return _last_paddle_hit

func set_last_paddle_hit(last_paddle_hit):
	_last_paddle_hit = last_paddle_hit
