extends 'res://addons/gut/test.gd'

var WallScene = load('res://scenes/Wall.tscn')
var PaddleScene = load('res://scenes/Paddle.tscn')

func test_overlaps_of_wall_and_paddle_does_not_caue_error():
	var wall = WallScene.instance()
	var paddle = PaddleScene.instance()

	wall.set_position(Vector2(100, 100))
	paddle.set_position(Vector2(120, 300))

	add_child(wall)
	add_child(paddle)

	paddle.set_speed(20)
	for i in range(10):
		paddle.move_up(1)
		yield(yield_for(.1), YIELD)

	assert_true(true, 'we got here')
