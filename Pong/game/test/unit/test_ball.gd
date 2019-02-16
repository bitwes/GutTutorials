extends 'res://addons/gut/test.gd'

var Ball = load('res://scripts/ball.gd')

func test_can_make_new_ball():
    var b = Ball.new()

func test_get_set_base_spped():
	var b = Ball.new()
	assert_accessors(b, 'speed', 100, 20)
	
func test_ball_moves():
	var b = Ball.new()
	var orig_position = b.get_position()
	simulate(b, 1, .5)
	assert_ne(b.get_position(), orig_position)
	
func test_ball_moves_left_initially():
	var b = Ball.new()
	var orig_position = b.get_position()
	simulate(b, 4, .25)
	assert_eq(b.get_position(), orig_position - Vector2(100, 0))

func test_get_set_direction():
	var b = Ball.new()
	assert_accessors(b, 'direction', Vector2(-1, 0), Vector2(.5, .5))
	
func test_ball_moves_based_on_direction():
	var b = Ball.new()
	b.set_direction(Vector2(0.5, 0.5))
	simulate(b, 1, 1)
	assert_eq(b.get_position(), Vector2(50, 50))