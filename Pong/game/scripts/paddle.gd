extends Area2D
var Ball = load('res://scripts/ball.gd')
var _speed = 100
var _increment_speed = 10

func get_increment_speed():
	return _increment_speed

func set_increment_speed(increment_speed):
	_increment_speed = increment_speed


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
	ball.increment_speed(_increment_speed)

func _on_Paddle_area_entered(area):
	if(area is Ball):
		bounce(area)
