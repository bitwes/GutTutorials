extends Node2D

var BonusSpawner = load('res://scripts/bonus_spawn.gd')

var _ball_start_pos = null
var _ball_start_speed = 300
var _ball_start_direction = Vector2(1, 0)
var _paddle_start_speed = 300
var _bonus_handler = load('res://scripts/bonus_handler.gd').new()
var _bonus_spawners = []

var _p1_score = 0
var _p2_score = 0
var _max_score = 10

signal game_over
signal score
signal p1_score
signal p2_score

func _populate_spawners():
	var kids = get_children()
	for i in range(kids.size()):
		if(kids[i] is BonusSpawner):
			_bonus_spawners.append(kids[i])

func _ready():
	_populate_spawners()

	_ball_start_pos = $Ball.get_position()
	$Ball.get_speed_props().set_default(_ball_start_speed)
	_reset_ball(-1)

	$P1Paddle.set_speed(_paddle_start_speed)
	$P1Paddle.set_bounce_speed(20)
	$P2Paddle.set_speed(_paddle_start_speed)
	$P2Paddle.set_bounce_speed(20)

	_bonus_handler.set_game(self)

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

func _game_over():
	emit_signal('game_over')
	$Ball.set_speed(0)

func _p1_scores():
	_p1_score += 1
	emit_signal('p1_score')
	_reset_ball(-1)
	_score()

func _p2_scores():
	_p2_score += 1
	emit_signal('p2_score')
	_reset_ball(1)
	_score()

func _score():
	_update_display()
	emit_signal('score')
	if(_p1_score == _max_score):
		_game_over()
	if(_p2_score == _max_score):
		_game_over()
	reset_court()

func _reset_paddle(paddle, y_pos):
	paddle.set_position(Vector2(paddle.get_position().x, y_pos))
	paddle.set_speed(_paddle_start_speed)
	paddle.reset()

func reset_court():
	var view_size = OS.get_real_window_size()
	$Ball.set_position(_ball_start_pos)
	$Ball.set_speed(_ball_start_speed)

	_reset_ball(1)
	_reset_paddle($P1Paddle, view_size.y / 2)
	_reset_paddle($P2Paddle, view_size.y / 2)


func _reset_ball(new_x):
	$Ball.set_position(_ball_start_pos)
	$Ball.set_speed(_ball_start_speed)
	$Ball.set_direction(Vector2(new_x,  0))
	$Ball.get_speed_props().reset()

func _on_P2KillBox_kill_ball():
	_p1_scores()

func _on_P1KillBox_kill_ball():
	_p2_scores()


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

func get_max_score():
	return _max_score

func set_max_score(max_score):
	_max_score = max_score

func _on_BonusSpawn_bonus(bonus):
	print('got bonus  ', bonus)
	_bonus_handler.handle_bonus(bonus)

func get_p1_paddle():
	return $P1Paddle

func get_p2_paddle():
	return $P2Paddle
