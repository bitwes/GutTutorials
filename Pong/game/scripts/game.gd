extends Node2D

onready var _orig_position = $Ball.get_position()
onready var _p1_default_pos = $LeftPaddle.get_position()
onready var _p2_default_pos = $RightPaddle.get_position()

onready var _players = {
	p1 = {value = 0, label = $P1Score, paddle = $LeftPaddle},
	p2 = {value = 0, label = $P2Score, paddle = $RightPaddle}
}

func _ready():
	_players.p1.paddle.set_min_y(60)
	_players.p1.paddle.set_max_y(540)
	_players.p1.paddle.set_speed(250)

	_players.p2.paddle.set_min_y(60)
	_players.p2.paddle.set_max_y(540)
	_players.p2.paddle.set_speed(250)


func _process(delta):
	if(Input.is_action_pressed("left_down")):
		$LeftPaddle.down(delta)
	if(Input.is_action_pressed("left_up")):
		$LeftPaddle.up(delta)

	if(Input.is_action_pressed("right_down")):
		$RightPaddle.down(delta)
	if(Input.is_action_pressed("right_up")):
		$RightPaddle.up(delta)

func _reset_positions():
	$Ball.set_position(_orig_position)
	$Ball.reset()
	_players.p2.paddle.set_position(_p2_default_pos)
	_players.p1.paddle.set_position(_p1_default_pos)


func _score(player):
	player.value += 1
	if(player.value > 5):
		player.value = 5
	player.label.set_text(str(player.value))
	_reset_positions()
	if(player == _players.p2):
		$Ball.set_direction(Vector2(1, 0))

func get_p1_score():
	return _players.p1.value

func get_p2_score():
	return _players.p2.value

func _on_ScoreBoxLeft_score():
	_score(_players.p2)

func _on_ScoreBoxRight_score():
	_score(_players.p1)

func get_ball():
	return $Ball

func get_p1_paddle():
	return _players.p1.paddle

func get_p2_paddle():
	return _players.p2.paddle
