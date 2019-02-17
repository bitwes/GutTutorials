extends Area2D

func bounce(ball):
	var new_dir = ball.get_direction()
	new_dir.y = new_dir.y * -1
	ball.set_direction(new_dir)

func _on_Wall_area_entered(area):
	bounce(area)
