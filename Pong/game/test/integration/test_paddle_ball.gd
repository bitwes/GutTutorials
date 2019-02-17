extends 'res://addons/gut/test.gd'

var Paddle = load('res://scenes/Paddle.tscn')
var Ball = load('res://scenes/Ball.tscn')

var _paddle = null
var _ball = null

func before_each():
	_paddle = Paddle.instance()
	add_child(_paddle)

	_ball = Ball.instance()
	_ball.set_position(Vector2(500, 500))
	add_child(_ball)
	
func after_each():
	remove_child(_ball)
	remove_child(_paddle)


func test_ball_bounces_from_righ():	
	_paddle.set_position(Vector2(150, 200))
	_ball.set_position(Vector2(200, 200))
	_ball.set_direction(Vector2(-1, 0))

	yield(yield_for(1), YIELD)	
	assert_gt(_ball.get_direction().x, 0)
	
func test_ball_bounces_from_left():
	_ball.set_position(Vector2(200, 200))
	_paddle.set_position(Vector2(250, 200))
	_ball.set_direction(Vector2(1, 0))

	yield(yield_for(1), YIELD)
	assert_lt(_ball.get_direction().x, 0)