extends GutTest

var Player = load("res://src/Actors/Player.tscn")

func test_can_make_one():
	var p = autofree(Player.instance())
	assert_not_null(p)
