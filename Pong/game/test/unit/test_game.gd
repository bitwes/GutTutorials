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
	
func test_on_score_ball_position_is_reset():
	var ball = _game.get_node('Ball')
	var orig_position = ball.get_position()
	ball.set_position(Vector2(0,0))
	_p1_score()
	assert_eq(ball.get_position(), orig_position)

func test_on_score_ball_props_are_reset():
	var dbl_ball = double('res://scripts/ball.gd').new()
	
	_game.remove_child(_game.get_node('Ball'))
	_game.add_child(dbl_ball)
	dbl_ball.set_name('Ball')
	
	_p1_score()
	assert_called(dbl_ball, 'reset')
	
func test_on_p1_score_ball_moves_to_left():
	_p1_score()
	assert_eq(_game.get_ball().get_direction().x, -1)
	
func test_on_p2_score_ball_moves_to_right():
	_p2_score()
	assert_eq(_game.get_ball().get_direction().x, 1)

func test_on_score_paddles_are_reset():
	var orig_p1_pos = _game.get_p1_paddle().get_position()
	var orig_p2_pos = _game.get_p2_paddle().get_position()
	
	_game.get_p1_paddle().up(1)
	_game.get_p2_paddle().down(1)
	
	_p2_score()
	
	assert_eq(_game.get_p1_paddle().get_position(), orig_p1_pos, 'p1 paddle')
	assert_eq(_game.get_p2_paddle().get_position(), orig_p2_pos, 'p2 paddle')
	
	
	
	
	