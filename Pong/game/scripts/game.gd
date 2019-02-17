extends Node2D
var _p1_score = 0
var _p2_score = 0

func _process(delta):
	if(Input.is_action_pressed("left_down")):
		$LeftPaddle.down(delta)
	if(Input.is_action_pressed("left_up")):
		$LeftPaddle.up(delta)

	if(Input.is_action_pressed("right_down")):
		$RightPaddle.down(delta)
	if(Input.is_action_pressed("right_up")):
		$RightPaddle.up(delta)

func get_p1_score():
	return _p1_score

func get_p2_score():
	return _p2_score


func _on_ScoreBoxLeft_score():
	_p2_score += 1


func _on_ScoreBoxRight_score():
	_p1_score += 1
