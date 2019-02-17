extends 'res://addons/gut/test.gd'

var Paddle = load('res://scripts/paddle.gd')
var Ball = load('res://scripts/ball.gd')

func test_can_make_paddle():
	assert_not_null(Paddle.new())
	
func test_get_set_speed():
	var p = Paddle.new()
	assert_accessors(p, 'speed', 100, 20)
	
func test_move_up_moves_by_speed():
	var p = Paddle.new()
	p.up(.5)
	assert_eq(p.get_position().y, -50)
	
func test_move_down_moves_by_speed():
	var p = Paddle.new()
	p.down(.75)
	assert_eq(p.get_position().y, 75)
	
func test_bounce_inverts_x_when_going_left():
	var p = Paddle.new()
	var b = double(Ball).new()
	stub(b, 'get_direction').to_return(Vector2(-1, 0))
	p.bounce(b)
	assert_called(b, 'set_direction', [Vector2(1, 0)])
	
func test_bounce_inverts_x_when_going_right():
	var p = Paddle.new()
	var b = double(Ball).new()
	stub(b, 'get_direction').to_return(Vector2(1, 0))
	p.bounce(b)
	assert_called(b, 'set_direction', [Vector2(-1, 0)])
	