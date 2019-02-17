extends 'res://addons/gut/test.gd'

var Ball = load('res://scenes/Ball.tscn')
var Wall = load('res://scenes/Wall.tscn')

var _ball = null
var _wall = null

func before_each():
	_ball = Ball.instance()
	_ball.set_position(Vector2(200, 200))
	add_child(_ball)
	
	_wall = Wall.instance()
	add_child(_wall)

func after_each():
	remove_child(_ball)
	remove_child(_wall)

func test_assert_ball_reflected_down():
	_wall.set_position(Vector2(200, 100))

	_ball.set_direction(Vector2(0, -1))
	yield(yield_for(2, 'waiting for bounce'), YIELD)
	assert_eq(_ball.get_direction().y, 1)
	
func test_assert_ball_reflected_up():

	_wall.set_position(Vector2(200, 300))

	_ball.set_direction(Vector2(0, 1))
	yield(yield_for(2, 'waiting for bounce'), YIELD)
	assert_eq(_ball.get_direction().y, -1)
