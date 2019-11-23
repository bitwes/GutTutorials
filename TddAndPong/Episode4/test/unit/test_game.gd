extends 'res://addons/gut/test.gd'

var Game = load('res://scenes/Game.tscn')


func test_can_make_game():
	assert_not_null(Game.instance())

func test_get_set_p1_score():
	assert_accessors(Game.instance(), 'p1_score', 0, 10)

func test_get_set_p2_score():
	assert_accessors(Game.instance(), 'p2_score', 0, 10)


func test_when_p1_kill_box_emits_kill_ball_then_ball_is_recentered():
	var game = Game.instance()
	add_child(game)
	var ball =  game.get_node("Ball")
	var p1kb = game.get_node("P1KillBox")
	var orig_pos = ball.get_position()
	ball.set_position(orig_pos + Vector2(100, 100))
	p1kb.emit_signal('kill_ball')

	assert_eq(ball.get_position(), orig_pos)
	remove_child(game)


func test_when_p2_kill_box_emits_kill_ball_then_ball_is_recentered():
	var game = Game.instance()
	add_child(game)
	var ball =  game.get_node("Ball")
	var p2kb = game.get_node("P2KillBox")
	var orig_pos = ball.get_position()
	ball.set_position(orig_pos + Vector2(100, 100))
	p2kb.emit_signal('kill_ball')

	assert_eq(ball.get_position(), orig_pos)
	remove_child(game)
