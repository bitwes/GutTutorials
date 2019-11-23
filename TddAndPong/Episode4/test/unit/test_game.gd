extends 'res://addons/gut/test.gd'

var Game = load('res://scenes/Game.tscn')

var _game = null

func before_each():
	_game = Game.instance()
	add_child(_game)
	
func after_each():
	remove_child(_game)
	
func test_can_make_game():
	assert_not_null(Game.instance())
	
func test_when_p1_killbox_emits_kill_ball_then_ball_is_recentered():
	var ball = _game.get_ball()
	var orig_pos = ball.get_position()
	var kb  = _game.get_node("P1KillBox")
	
	ball.set_position(Vector2(1, 1))
	kb.emit_signal('kill_ball')
	assert_eq(ball.get_position(), orig_pos)

func test_when_p2_killbox_emits_kill_ball_then_ball_is_recentered():
	var ball = _game.get_ball()
	var orig_pos = ball.get_position()
	var kb  = _game.get_node("P2KillBox")
	
	ball.set_position(Vector2(1, 1))
	kb.emit_signal('kill_ball')
	assert_eq(ball.get_position(), orig_pos)
