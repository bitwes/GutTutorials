extends 'res://addons/gut/test.gd'

var WallScene = load('res://scenes/Wall.tscn')
var BallScene = load('res://scenes/Ball.tscn')


func test_ball_bounces_off_wall():
	var wall = WallScene.instance()
	add_child(wall)
	wall.set_position(Vector2(100, 100))
	
	var ball = BallScene.instance()
	add_child(ball)
	ball.set_position(Vector2(120, 200))
	ball.set_speed(100)
	ball.set_direction(Vector2(0, -1))
	
	yield(yield_for(2), YIELD)
	
	assert_gt(ball.get_direction().y, 0)
	
	remove_child(wall)
	remove_child(ball)