extends GutTest

var Level = load('res://test/resources/TestFlatLevel.tscn')

var _level = null
var _player = null
var _sender = InputSender.new(Input)

func before_each():
	_level = add_child_autofree(Level.instance())
	_player = _level.get_node('Player')
	yield(yield_frames(1), YIELD)
	
	
func after_each():
	_sender.release_all()
	_sender.clear()

func test_verify_setup():
	assert_not_null(_player, 'player exists')
	assert_true(_player.is_on_floor(), 'on the floor')

func test_jump_jumps():
	_sender.action_down("jump").hold_for(.1)
	yield(_sender, 'idle')
	assert_lt(_player.get_velocity().y, 0.0)

func test_can_double_jump():
	_sender.action_down("jump").hold_for(.1)\
		.wait(.1)\
		.action_down("jump").hold_for(.1)
	yield(_sender, 'idle')
	assert_lt(_player.get_velocity().y, 0.0)
	
func test_cannot_triple_jump():
	_sender.action_down("jump").hold_for(.1)\
		.wait(.1)\
		.action_down("jump").hold_for(.1)\
		.wait(.1)\
		.action_down("jump").hold_for(.1)
	yield(_sender, 'idle')
	assert_gt(_player.get_velocity().y, 0.0)	
	
func test_can_jump_after_landing_from_double_jump():
	_sender.action_down("jump").hold_for(.1)\
		.wait(.1)\
		.action_down("jump").hold_for(.1)\
		.wait(2)
	yield(_sender, 'idle')
	_sender.action_down("jump").hold_for(.1)\
		.wait(.1)
	yield(_sender, 'idle')
	assert_lt(_player.get_velocity().y, 0.0)
	
func test_cannot_double_jump_on_a_fall():
	_player.position -= Vector2(0, 100)
	yield(yield_frames(2), YIELD)
	
	_sender.action_down("jump").hold_for(.1)\
		.wait(.1)\
		.action_down("jump").hold_for(.1)
	yield(_sender, 'idle')

	assert_gt(_player.get_velocity().y, 0)

func test_can_quad_jump_when_max_air_jumps_set_to_4():
	_player.set_max_air_jumps(4)
	_sender.action_down("jump").hold_for(.1)\
		.wait(.1)\
		.action_down("jump").hold_for(.1)\
		.wait(.1)\
		.action_down("jump").hold_for(.1)\
		.wait(.1)\
		.action_down("jump").hold_for(.1)\
		.wait(.1)
	yield(_sender, 'idle')
	assert_lt(_player.get_velocity().y, 0.0)
