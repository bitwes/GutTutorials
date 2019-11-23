extends 'res://addons/gut/test.gd'

var Game = load('res://scenes/Game.tscn')

var _game = null

func before_each():
	_game = Game.instance()
	add_child(_game)
	
func after_each():
	remove_child(_game)
	
func _simulate_p1_score(game):
	game.get_node('P2KillBox').emit_signal('kill_ball')
	
func _simulate_p2_score(game):
	game.get_node('P1KillBox').emit_signal('kill_ball')

func test_can_make_game():
	assert_not_null(Game.instance())
	
func test_get_set_p1_score():
	assert_accessors(_game, 'p1_score', 0, 10)
	
func test_get_set_p2_score():
	assert_accessors(_game, 'p2_score', 0, 10)
	
func test_get_set_max_score():
	assert_accessors(_game, 'max_score', 10, 5)
	
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

func test_when_p1_kill_box_kills_ball_p2_score_increases():
	_simulate_p2_score(_game)
	assert_eq(_game.get_p2_score(), 1)
	
func test_when_p2_kill_box_kills_ball_p1_score_increases():
	_simulate_p1_score(_game)
	assert_eq(_game.get_p1_score(), 1)
	
func test_score_labels_show_score_on_start():
	assert_eq(_game.get_node("P1Score").get_text(), '0', 'p1 initial score')
	assert_eq(_game.get_node("P2Score").get_text(), '0', 'p2 initial score')
	
func test_when_p1_scores_then_score_is_update():
	_simulate_p1_score(_game)
	assert_eq(_game.get_node("P1Score").get_text(), '1')
	
func test_when_p2_scores_then_score_is_update():
	_simulate_p2_score(_game)
	assert_eq(_game.get_node("P2Score").get_text(), '1')

	
func test_when_p1_reaches_max_score_game_over_emitted():
	watch_signals(_game)
	_game.set_max_score(2)
	_simulate_p1_score(_game)
	_simulate_p1_score(_game)
	assert_signal_emitted(_game, 'game_over')
	
func test_when_p2_reaches_max_score_game_over_emitted():
	watch_signals(_game)
	_game.set_max_score(3)
	_simulate_p2_score(_game)
	_simulate_p2_score(_game)
	_simulate_p2_score(_game)
	assert_signal_emitted(_game, 'game_over')

func test_when_game_ends_ball_stops_moving():
	_game.set_max_score(3)
	_simulate_p2_score(_game)
	_simulate_p2_score(_game)
	_simulate_p2_score(_game)
	assert_eq(_game.get_ball().get_speed(), 0)
	
	
	