extends Node2D

var _ball_start_pos = null
var _p1_score = 0
var _p2_score = 0

func _ready():
	_ball_start_pos =  $Ball.get_position()
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


func _on_P1KillBox_kill_ball():
	$Ball.set_position(_ball_start_pos)


func _on_P2KillBox_kill_ball():
	$Ball.set_position(_ball_start_pos)


func get_p1_score():
	return _p1_score

func set_p1_score(p1_score):
	_p1_score = p1_score

func get_p2_score():
	return _p2_score

func set_p2_score(p2_score):
	_p2_score = p2_score
