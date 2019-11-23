extends 'res://addons/gut/test.gd'

class TestTheBasics:
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

	func test_get_set_p1_score():
		assert_accessors(Game.instance(), 'p1_score', 0, 10)

	func test_get_set_p2_score():
		assert_accessors(Game.instance(), 'p2_score', 0, 10)

	func test_get_set_max_score():
		assert_accessors(_game, 'max_score', 10, 20)

	# Does not use p2_score b/c it verifies the wiring of signal.  keep until
	# wiring tests are broken out.
	func test_when_p1_kill_box_emits_kill_ball_then_ball_is_recentered():
		var ball =  _game.get_node("Ball")
		var p1kb = _game.get_node("P1KillBox")
		var orig_pos = ball.get_position()
		ball.set_position(orig_pos + Vector2(100, 100))
		p1kb.emit_signal('kill_ball')

		assert_eq(ball.get_position(), orig_pos)

	# Does not use p2_score b/c it verifies the wiring of signal.  keep until
	# wiring tests are broken out.
	func test_when_p2_kill_box_emits_kill_ball_then_ball_is_recentered():
		var ball =  _game.get_node("Ball")
		var p2kb = _game.get_node("P2KillBox")
		var orig_pos = ball.get_position()
		ball.set_position(orig_pos + Vector2(100, 100))
		p2kb.emit_signal('kill_ball')

		assert_eq(ball.get_position(), orig_pos)

	func test_whne_p1_kill_box_kill_ball_then_p2_score_incremented():
		var p1kb = _game.get_node("P1KillBox")
		p1kb.emit_signal('kill_ball')
		assert_eq(_game.get_p2_score(), 1)

	func test_when_p2_kill_box_kill_ball_then_p1_score_incremented():
		var p2kb = _game.get_node("P2KillBox")
		p2kb.emit_signal('kill_ball')
		assert_eq(_game.get_p1_score(), 1)

	func test_when_game_starts_ball_moves_towards_p1():
		var ball = _game.get_ball()
		assert_eq(ball.get_direction(), Vector2(1, 0))

	func test_when_p2_scores_ball_moves_towards_p2():
		_game.p2_scores()
		assert_eq(_game.get_ball().get_direction(), Vector2(1, 0))

	func test_when_p1_scores_ball_moves_towards_p1():
		_game.get_ball().set_direction(Vector2(0, 0))
		_game.p1_scores()
		assert_eq(_game.get_ball().get_direction(), Vector2(-1, 0))

	func test_when_p1_reaches_max_score_game_over_signal_emitted():
		watch_signals(_game)
		_game.set_max_score(2)
		_game.p1_scores()
		_game.p1_scores()
		assert_signal_emitted(_game, 'game_over')

	func test_when_p2_reaches_max_score_game_over_signal_emitted():
		watch_signals(_game)
		_game.set_max_score(1)
		_game.p2_scores()
		assert_signal_emitted(_game, 'game_over')

	func test_when_p1_wins_ball_does_not_move():
		_game.set_max_score(1)
		_game.p1_scores()
		assert_eq(_game.get_ball().get_speed(), 0)

	func test_when_p2_wins_ball_does_not_move():
		_game.set_max_score(1)
		_game.p2_scores()
		assert_eq(_game.get_ball().get_speed(), 0)

class TestGUI:
	extends 'res://addons/gut/test.gd'

	var Game = load('res://scenes/Game.tscn')

	var _game = null

	func before_each():
		_game = Game.instance()
		add_child(_game)

	func after_each():
		remove_child(_game)

	func test_when_game_starts_score_display_zero():
		assert_eq(_game.get_node('P1Score').get_text(), '0', 'p1 score')
		assert_eq(_game.get_node('P2Score').get_text(), '0', 'p2 score')

	func test_when_p1_scores_score_is_updated():
		_game.p1_scores()
		assert_eq(_game.get_node('P1Score').get_text(), '1', 'p1 score')
		assert_eq(_game.get_node('P2Score').get_text(), '0', 'p2 score')

	func test_when_p2_scores_score_is_updated():
		_game.p2_scores()
		assert_eq(_game.get_node('P1Score').get_text(), '0', 'p1 score')
		assert_eq(_game.get_node('P2Score').get_text(), '1', 'p2 score')
