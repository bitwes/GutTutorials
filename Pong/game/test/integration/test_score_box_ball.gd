extends 'res://addons/gut/test.gd'

var ScoreBox = load('res://scenes/ScoreBox.tscn')
var Ball = load('res://scenes/Ball.tscn')

var _score_box = null
var _ball = null

func before_each():
	_score_box = ScoreBox.instance()
	add_child(_score_box)
	
	_ball = Ball.instance()
	_ball.set_position(Vector2(500, 500))
	add_child(_ball)
	
func after_each():
	remove_child(_score_box)
	remove_child(_ball)

func test_when_ball_hits_box_score_signal_emitted():
	watch_signals(_score_box)
	_ball.set_position(Vector2(200, 200))
	_score_box.set_position(Vector2(150, 200))
	yield(yield_to(_score_box, 'score', 5), YIELD)
	assert_signal_emitted(_score_box, 'score')
	
func test_ignores_other_objects():
	watch_signals(_score_box)
	var obj = Node2D.new()
	_score_box._on_ScoreBox_area_entered(obj)
	assert_signal_not_emitted(_score_box, 'score')
		
	
	
	
	