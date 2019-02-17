extends Node2D

var _scores = {
	p1 = 0,
	p2 = 0
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
	_scores[which] += 1
	if(_scores[which] > 5):
		_scores[which] = 5

func get_p1_score():
	return _scores.p1

func get_p2_score():
	return _scores.p2

func _on_ScoreBoxLeft_score():
	_score('p2')
	$P2Score.set_text(str(_scores.p2))
	
func _on_ScoreBoxRight_score():
	_score('p1')
	$P1Score.set_text(str(_scores.p1))
	
