extends 'res://addons/gut/test.gd'

var ScoreBox = load('res://scenes/ScoreBox.tscn')

func test_can_make_score_box():
	assert_not_null(ScoreBox.instance())
	
