extends 'res://addons/gut/test.gd'

func test_nothing():
    assert_false(true)

func test_something():
    assert_true(true)
