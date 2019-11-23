extends Node2D

func _ready():
	$Ball.set_speed(300)
	$Ball.set_direction(Vector2(1, 1))
	
	$P1Paddle.set_speed(300)
	$P2Paddle.set_speed(300)
	
func _process(delta):
	if Input.is_action_pressed("p1_up"):
		$P1Paddle.move_up(delta)
	if Input.is_action_pressed("p1_down"):
		$P1Paddle.move_down(delta)
	if Input.is_action_pressed("p2_up"):
		$P2Paddle.move_up(delta)
	if Input.is_action_pressed("p2_down"):
		$P2Paddle.move_down(delta)
