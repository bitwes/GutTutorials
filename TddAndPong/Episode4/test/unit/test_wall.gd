extends 'res://addons/gut/test.gd'

var Wall = load('res://scripts/wall.gd')
var Ball = load('res://scripts/ball.gd')

func test_can_make_wall():
	assert_not_null(Wall.new())
	

func test_bounce_inverts_ball_y_diredtion():
	var wall = Wall.new()
	var ball = double(Ball).new()
	var dir = Vector2(1, 1).normalized()
	stub(ball, 'get_direction').to_return(dir)
	
	wall.bounce(ball)
	assert_called(ball, 'set_direction', [dir * Vector2(1, -1)])
	
func test_get_set_color():
	assert_accessors(Wall.new(), 'color', Color(1, 1, 1), Color(0, 0, 0))
	
	