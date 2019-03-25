extends Area2D

var Ball = load('res://scripts/ball.gd')

func bounce(ball):
	var new_dir = ball.get_direction()
	new_dir.y = new_dir.y * -1
	ball.set_direction(new_dir)

func _on_Wall_area_entered(area):
	if(area is Ball):
		bounce(area)
