extends 'res://addons/gut/test.gd'

var Game = load('res://scenes/Game.tscn')
var _game = null

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
    _game.get_node("ScoreBoxRight").emit_signal('score')
    assert_eq(_game.get_p1_score(), 1)

func test_when_right_side_scores_p2_score_increased():
    _game.get_node("ScoreBoxLeft").emit_signal('score')
    assert_eq(_game.get_p2_score(), 1)
