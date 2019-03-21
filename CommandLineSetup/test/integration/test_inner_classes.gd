extends 'res://addons/gut/test.gd'

class TestInnerClass:
    extends 'res://addons/gut/test.gd'

    func test_nothing():
        assert_false(true)

class TestAnotherInnerClass:
    extends 'res://addons/gut/test.gd'

    func test_this_one_passes():
        assert_eq('one', 'one')
