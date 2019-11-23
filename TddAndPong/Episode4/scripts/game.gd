extends Node2D

var _ball_start_pos = null
var _p1_score = 0
var _p2_score = 0

func _ready():
	$Ball.set_speed(300)
	$Ball.set_direction(Vector2(1, 1))
	_ball_start_pos = $Ball.get_position()
	
	$P1Paddle.set_speed(300)
	$P2Paddle.set_speed(300)
	
	_update_display()
	
func _process(delta):
	if Input.is_action_pressed("p1_up"):
		$P1Paddle.move_up(delta)
	if Input.is_action_pressed("p1_down"):
		$P1Paddle.move_down(delta)
	if Input.is_action_pressed("p2_up"):
		$P2Paddle.move_up(delta)
	if Input.is_action_pressed("p2_down"):
		$P2Paddle.move_down(delta)


func _on_P2KillBox_kill_ball():
	$Ball.set_position(_ball_start_pos)
	_p1_score += 1
	_update_display()


func _on_P1KillBox_kill_ball():
	$Ball.set_position(_ball_start_pos)
	_p2_score += 1
	_update_display()

func _update_display():
	$P1Score.set_text(str(_p1_score))
	$P2Score.set_text(str(_p2_score))

func get_ball():
	return $Ball
	
func get_p1_score():
	return _p1_score

func set_p1_score(p1_score):
	_p1_score = p1_score

func get_p2_score():
	return _p2_score

func set_p2_score(p2_score):
	_p2_score = p2_score
	