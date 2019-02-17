extends 'res://addons/gut/test.gd'

var Game = load('res://scenes/Game.tscn')
var _game = null

func _p1_score():
	_game.get_node("ScoreBoxRight").emit_signal('score')

func _p2_score():
	_game.get_node("ScoreBoxLeft").emit_signal('score')

func before_each():
	_game = Game.instance()
	add_child(_game)

func after_each():
	remove_child(_game)

func test_can_get_p1_score():
	assert_eq(_game.get_p1_score(), 0)

func test_can_get_p2_score():
	assert_eq(_game.get_p2_score(), 0)

func test_when_left_side_scores_p1_score_increased():
	_p1_score()
	assert_eq(_game.get_p1_score(), 1)

func test_when_right_side_scores_p2_score_increased():
	_p2_score()
	assert_eq(_game.get_p2_score(), 1)

func test_p2_cannot_score_more_than_5():
	for i in range(6):
		_p2_score()
	assert_eq(_game.get_p2_score(), 5)

func test_p1_cannot_score_more_than_5():
	for i in range(10):
		_p1_score()
	assert_eq(_game.get_p1_score(), 5)
	
func test_p1_score_displayed():
	var label = _game.get_node('P1Score')
	assert_eq(label.get_text(), '0', 'starts at 0')
	_p1_score()
	assert_eq(label.get_text(), '1')

func test_p2_score_displayed():
	var label = _game.get_node('P2Score')
	assert_eq(label.get_text(), '0', 'starts at 0')
	_p2_score()
	assert_eq(label.get_text(), '1')
	
	
	
	
	
	