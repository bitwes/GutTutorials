extends 'res://addons/gut/test.gd'

var Ball = load('res://scripts/ball.gd')

func test_can_make_new_ball():
	var b = Ball.new()

func test_get_set_speed():
	var b = Ball.new()
	assert_accessors(b, 'speed', b.get_start_speed(), 20)

func test_ball_moves():
	var b = Ball.new()
	var orig_position = b.get_position()
	simulate(b, 1, .5)
	assert_ne(b.get_position(), orig_position)

func test_ball_moves_left_initially():
	var b = Ball.new()
	var orig_position = b.get_position()
	simulate(b, 4, .25)
	assert_lt(b.get_position().x, orig_position.x)

func test_get_set_direction():
	var b = Ball.new()
	assert_accessors(b, 'direction', Vector2(-1, 0), Vector2(.5, .5))

func test_ball_moves_based_on_direction():
	var b = Ball.new()
	b.set_direction(Vector2(0.5, 0.5))
	b.set_speed(100)
	simulate(b, 1, 1)
	assert_eq(b.get_position(), Vector2(50, 50))

func test_can_increment_ball_speed():
	var b = Ball.new()
	var orig_speed = b.get_speed()
	b.increment_speed(10)
	assert_eq(b.get_speed(), orig_speed + 10)

func test_get_set_max_speed():
	assert_accessors(Ball.new(), 'max_speed', 700, 400)

func test_cannot_increment_speed_past_max_speed():
	var b = Ball.new()
	b.increment_speed(1000)
	assert_eq(b.get_speed(), b.get_max_speed())

func test_cannot_set_speed_higher_than_max_speed():
	var b = Ball.new()
	b.set_speed(1000)
	assert_eq(b.get_speed(), b.get_max_speed())

func test_reset_resets_speed():
	var b = Ball.new()
	var orig_speed = b.get_speed()
	b.increment_speed(10)
	b.reset()
	assert_eq(b.get_speed(), orig_speed)

func test_reset_resets_direction():
	var b = Ball.new()
	var orig_dir = b.get_direction()
	b.set_direction(Vector2(50, 50))
	b.reset()
	assert_eq(b.get_direction(), orig_dir)

func test_ball_starts_with_start_speed():
	var b = Ball.new()
	assert_eq(b.get_speed(), b.get_start_speed())
