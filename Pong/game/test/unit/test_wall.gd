extends 'res://addons/gut/test.gd'

var Wall = load('res://scripts/wall.gd')
var Ball = load('res://scripts/ball.gd')

func test_can_make_wall():
	assert_not_null(Wall.new())
	
func test_boucing_down_ball_sets_direction_up():
	var b = double(Ball).new()
	var w = Wall.new()
	stub(b, 'get_direction').to_return(Vector2(0, 1))
	w.bounce(b)
	assert_called(b, 'set_direction', [Vector2(0, -1)])
	
func test_boucing_up_ball_sets_direction_down():
	var b = double(Ball).new()
	var w = Wall.new()
	stub(b, 'get_direction').to_return(Vector2(0, -1))
	w.bounce(b)
	assert_called(b, 'set_direction', [Vector2(0, 1)])	
	
	