extends Node2D

func _ready():
	$Ball.set_speed(300)
	$Ball.set_direction(Vector2(1, 1))

	$P1Paddle.set_speed(300)
	$P2Paddle.set_speed(300)

func _process(delta):
	if Input.is_action_pressed("P1_Up"):
		$P1Paddle.move_up(delta)
	if Input.is_action_pressed("P1_Down"):
		$P1Paddle.move_down(delta)
	if Input.is_action_pressed("P2_Up"):
		$P2Paddle.move_up(delta)
	if Input.is_action_pressed("P2_Down"):
		$P2Paddle.move_down(delta)
