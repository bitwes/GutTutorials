extends 'res://addons/gut/test.gd'

var Ball = load('res://scripts/ball.gd')

func test_can_create_ball():
	var b = Ball.new()
	assert_not_null(b)

func test_get_set_speed():
	var b = Ball.new()
	assert_accessors(b, 'speed', 0, 100)

func test_get_set_max_speed():
	assert_accessors(Ball.new(), 'max_speed', 900, 500)

func test_get_set_direction():
	var b = Ball.new()
	assert_accessors(b, 'direction', Vector2(0, 0), Vector2(1, 1).normalized())

func test_ball_moves_on_process():
	var b = Ball.new()
	b.set_speed(10)
	b.set_direction(Vector2(1, 0))
	simulate(b, 1, 1)
	assert_eq(b.get_position(), Vector2(10, 0))

func test_ball_moves_vertically_on_process():
	var b = Ball.new()
	b.set_speed(10)
	b.set_direction(Vector2(0, 1))
	simulate(b, 1, .5)
	assert_eq(b.get_position(), Vector2(0, 5))

func test_set_direction_normalizes_vector():
	var b = Ball.new()
	var dir = Vector2(500, 500)
	b.set_direction(dir)
	assert_eq(b.get_direction(), dir.normalized())

func test_cannot_set_speed_above_max():
	var b = Ball.new()
	b.set_max_speed(700)
	b.set_speed(900)
	assert_eq(b.get_speed(),  700)
