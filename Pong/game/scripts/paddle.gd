extends Area2D

var _speed = 100

func get_speed():
	return _speed

func set_speed(speed):
	_speed = speed
	
func up(delta):
	set_position(get_position() - Vector2(0, _speed * delta))

func down(delta):
	set_position(get_position() + Vector2(0, _speed * delta))
	
func bounce(ball):
	var new_dir = ball.get_direction()
	new_dir.x = new_dir.x * -1
	ball.set_direction(new_dir)