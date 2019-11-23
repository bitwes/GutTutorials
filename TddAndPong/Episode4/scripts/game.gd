extends Node2D

var _ball_start_pos = null
var _p1_score = 0
var _p2_score = 0
var _max_score = 10

signal game_over

func _update_display():
	$P1Score.set_text(str(_p1_score))
	$P2Score.set_text(str(_p2_score))

func _ready():
	_ball_start_pos =  $Ball.get_position()
	$Ball.set_speed(300)
	$Ball.set_direction(Vector2(1, 0))

	$P1Paddle.set_speed(300)
	$P2Paddle.set_speed(300)

	_update_display()

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
	p2_scores()

func _on_P2KillBox_kill_ball():
	p1_scores()

func _game_over():
	$Ball.set_speed(0)
	emit_signal('game_over')


func p1_scores():
	$Ball.set_position(_ball_start_pos)
	_p1_score += 1
	$Ball.set_direction(Vector2(1, 0))
	_update_display()
	if(_p1_score == _max_score):
		_game_over()

func p2_scores():
	$Ball.set_position(_ball_start_pos)
	_p2_score += 1
	$Ball.set_direction(Vector2(-1, 0))
	_update_display()
	if(_p2_score  == _max_score):
		_game_over()

func get_p1_score():
	return _p1_score

func set_p1_score(p1_score):
	_p1_score = p1_score

func get_p2_score():
	return _p2_score

func set_p2_score(p2_score):
	_p2_score = p2_score

func get_ball():
	return $Ball

func get_max_score():
	return _max_score

func set_max_score(max_score):
	_max_score = max_score
