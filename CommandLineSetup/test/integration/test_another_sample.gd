extends 'res://addons/gut/test.gd'


class TestSomethingAndNothing:
	extends 'res://addons/gut/test.gd'

	func test_nothing():
		assert_false(true)

	func test_something():
		assert_true(true)

class TestOtherThings:
	extends 'res://addons/gut/test.gd'

	func test_other():
		assert_eq(1, 'one')
