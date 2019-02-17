extends Node2D


onready var _orig_position = $Ball.get_position()
onready var _p1_default_pos = $LeftPaddle.get_position()
onready var _p2_default_pos = $RightPaddle.get_position()

onready var _scores = {
	p1 = {value = 0, label = $P1Score},
	p2 = {value = 0, label = $P2Score}
}

func _process(delta):
	if(Input.is_action_pressed("left_down")):
		$LeftPaddle.down(delta)
	if(Input.is_action_pressed("left_up")):
		$LeftPaddle.up(delta)

	if(Input.is_action_pressed("right_down")):
		$RightPaddle.down(delta)
	if(Input.is_action_pressed("right_up")):
		$RightPaddle.up(delta)

func _score(which):
	_scores[which].value += 1
	if(_scores[which].value > 5):
		_scores[which].value = 5
	_scores[which].label.set_text(str(_scores[which].value))
	$Ball.set_position(_orig_position)
	$Ball.reset()
	if(which == 'p2'):
		$Ball.set_direction(Vector2(1, 0))
	$RightPaddle.set_position(_p2_default_pos)
	$LeftPaddle.set_position(_p1_default_pos)

func get_p1_score():
	return _scores.p1.value

func get_p2_score():
	return _scores.p2.value

func _on_ScoreBoxLeft_score():
	_score('p2')
	
func _on_ScoreBoxRight_score():
	_score('p1')
	
func get_ball():
	return $Ball
	
func get_p1_paddle():
	return $LeftPaddle

func get_p2_paddle():
	return $RightPaddle