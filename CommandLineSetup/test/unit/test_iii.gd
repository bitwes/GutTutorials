extends 'res://addons/gut/test.gd'

func test_nothing():
    pending('this does not test a thing')

func test_failing():
    assert_false(true)
