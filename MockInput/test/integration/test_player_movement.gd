extends GutTest

var Level = load('res://test/resources/TestFlatLevel.tscn')

var _level = null
var _player = null

func before_each():
	_level = add_child_autofree(Level.instance())
	_player = _level.get_node('Player')
	yield(yield_frames(1), YIELD)
	
	
func test_verify_setup():
	assert_not_null(_player, 'player exists')
	assert_true(_player.is_on_floor(), 'on the floor')
