extends 'res://addons/gut/test.gd'

var Paddle = load('res://scripts/paddle.gd')
var Ball = load('res://scripts/ball.gd')

func test_can_make_paddle():
	assert_not_null(Paddle.new())

func test_can_get_set_speed():
	assert_accessors(Paddle.new(), 'speed', 10, 100)

func test_bounce_inverts_x():
	var ball = double(Ball).new()
	var paddle = Paddle.new()
	
	stub(ball, 'get_direction').to_return(Vector2(1, 1))
	paddle.bounce(ball)
	var new_x =  get_call_parameters(ball, 'set_direction')[0].x
	assert_eq(new_x, -1.0)


func test_bounce_inverts_x_other_direction():
	var ball = double(Ball).new()
	var paddle = Paddle.new()
	
	stub(ball, 'get_direction').to_return(Vector2(-1, 1))
	paddle.bounce(ball)
	var new_x =  get_call_parameters(ball, 'set_direction')[0].x
	assert_eq(new_x, 1.0)

func test_bounce_changes_y_randomly():
	var paddle = Paddle.new()
	var ball = double(Ball).new()
	stub(ball, 'get_direction').to_return(Vector2(1, 1))
	stub(ball, 'set_direction').to_do_nothing()
	
	for i in range(1000):
		paddle.bounce(ball)
		
	var last_y = get_call_parameters(ball, 'set_direction', 0)[0].y
	var current_y = 0
	var num_equal = 0
	var min_y = 3
	var max_y = -3
	for i in range(1, 1000):
		current_y = get_call_parameters(ball, 'set_direction', i)[0].y
		if(current_y == last_y):
			num_equal += 1
		last_y = current_y
		
		max_y = max(max_y, current_y)
		min_y = min(min_y, current_y)
		
	assert_eq(num_equal, 0)
	
	assert_between(min_y, -.5, -.3)
	assert_between(max_y, .3, .5)

func test_move_up_moves_by_speed_times_delta():
	var paddle = Paddle.new()
	paddle.set_position(Vector2(0, 300))
	var orig_pos = paddle.get_position()
	paddle.set_speed(20)
	paddle.move_up(.5)
	assert_eq(paddle.get_position().y, orig_pos.y - 10, 'moves up by .5 * 20')
	
	
func test_move_down_moves_by_speed_times_delta():
	var paddle = Paddle.new()
	paddle.set_position(Vector2(0, 300))
	var orig_pos = paddle.get_position()
	paddle.set_speed(30)
	paddle.move_down(.5)
	assert_eq(paddle.get_position().y, orig_pos.y + 15, 'moves up by .5 * 30')
	
	
	
	
	
	
	