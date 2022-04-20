extends GutTest

var Player = load("res://src/Actors/Player.tscn")

func test_can_make_one():
	var p = autofree(Player.instance())
	assert_not_null(p)

func test_get_set_max_air_jumps():
	var p = autofree(Player.instance())
	assert_accessors(p, 'max_air_jumps', 1, 10)
