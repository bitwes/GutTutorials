extends Area2D
var Ball = load('res://scripts/ball.gd')
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
	new_dir.y = randf() * 2 - 1
	ball.set_direction(new_dir.normalized())

func _on_Paddle_area_entered(area):
	if(area is Ball):
		bounce(area)
