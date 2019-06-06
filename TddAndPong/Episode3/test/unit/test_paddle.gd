extends 'res://addons/gut/test.gd'

var Paddle = load('res://scripts/paddle.gd')
var Ball = load('res://scripts/ball.gd')

func test_can_make_paddle():
	assert_not_null(Paddle.new())

func test_bounce_inverts_x():
	var ball = double(Ball).new()
	var paddle = Paddle.new()
	
	stub(ball, 'get_direction').to_return(Vector2(1, 1))
	paddle.bounce(ball)
	assert_called(ball, 'set_direction', [Vector2(-1, 1)])	

func test_bounce_inverts_x_other_direction():
	var ball = double(Ball).new()
	var paddle = Paddle.new()
	
	stub(ball, 'get_direction').to_return(Vector2(-1, 1))
	paddle.bounce(ball)
	assert_called(ball, 'set_direction', [Vector2(1, 1)])	

func test_bounce_changes_y_randomly():
	var paddle = Paddle.new()
	var ball = double(Ball).new()
	stub(ball, 'get_direction').to_return(Vector2(1, 1))
	