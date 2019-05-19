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
	p.set_position(Vector2(100, 100))
	p.up(.5)
	assert_eq(p.get_position().y, 50)

func test_move_down_moves_by_speed():
	var p = Paddle.new()
	p.down(.75)
	assert_eq(p.get_position().y, 75)

func test_bounce_inverts_x_when_going_left():
	var p = Paddle.new()
	var b = Ball.new()
	b.set_direction(Vector2(-1, 0))
	p.bounce(b)
	assert_gt(b.get_direction().x, 0)

func test_bounce_inverts_x_when_going_right():
	var p = Paddle.new()
	var b = Ball.new()
	b.set_direction(Vector2(1, 0))
	p.bounce(b)
	assert_lt(b.get_direction().x, 0)

func test_chooses_random_angle_on_bounce():
	var p = Paddle.new()
	var b = Ball.new()
	var last_y = -200

	var sum_of_y = 0
	var different = 0
	var normalized = 0

	for i in range(500):
		b.set_direction(Vector2(1, 0))
		p.bounce(b)
		if(last_y != b.get_direction().y):
			different += 1
		last_y = b.get_direction().y
		sum_of_y += b.get_direction().y
		if(b.get_direction().is_normalized()):
			normalized += 1

	assert_between(sum_of_y/500, -.25, .25, 'averaged out, y values should be +\\- .25')
	assert_eq(different, 500, 'they should be different from one bounce to the next')
	assert_eq(normalized, 500, 'The direction should be normalized')


func test_paddle_ignores_things_that_are_not_balls():
	var obj = Node2D.new()
	var p = Paddle.new()
	p._on_Paddle_area_entered(obj)
	assert_true(true, 'if we get here everything is ok')

func test_get_set_increment_speed():
	assert_accessors(Paddle.new(), 'increment_speed', 10, 50)

func test_when_bounced_paddle_increases_ball_speed():
	var p = Paddle.new()
	var b = Ball.new()
	var orig_speed = b.get_speed()
	p.set_increment_speed(13)
	p.bounce(b)
	assert_eq(b.get_speed(), orig_speed + 13)

func test_cannot_move_past_min():
	var p = Paddle.new()
	p.set_min_y(100)
	for i in range(2000):
		p.up(1)
	assert_eq(p.get_position().y, 100)

func test_cannot_move_past_max():
	var p = Paddle.new()
	p.set_max_y(500)
	for i in range(2000):
		p.down(1)
	assert_eq(p.get_position().y, 500)

func test_get_set_min_y():
	assert_accessors(Paddle.new(), 'min_y', 0, 100)

func test_get_set_max_y():
	assert_accessors(Paddle.new(), 'max_y', 600, 500)