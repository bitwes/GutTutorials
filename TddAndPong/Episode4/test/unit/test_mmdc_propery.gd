extends 'res://addons/gut/test.gd'
var Mmdc = load('res://scripts/mmdc_property.gd')

func test_can_make_one_with_no_props():
	assert_not_null(Mmdc.new())

func test_constructor_sets_values():
	var mmdc =  Mmdc.new(1, 3, 2)
	assert_eq(mmdc.get_min(), 1, 'min')
	assert_eq(mmdc.get_max(), 3, 'max')
	assert_eq(mmdc.get_default(), 2, 'default')
	assert_eq(mmdc.get_current(), 2, 'current')

func test_constructor_restricts_default_and_current_to_max():
	var m = Mmdc.new(0, 10, 100)
	assert_eq(m.get_default(), 10, 'default')
	assert_eq(m.get_current(), 10, 'current')

func test_get_set_max():
	assert_accessors(Mmdc.new(), 'max', 0, 10)

func test_get_set_min():
	assert_accessors(Mmdc.new(), 'min', 0, 10)

func test_get_set_default():
	assert_accessors(Mmdc.new(0, 100, 0), 'default', 0, 20)

func test_get_set_current():
	assert_accessors(Mmdc.new(0, 20), 'current', 0,  10)

func test_cannot_set_default_outside_of_range():
	var m = Mmdc.new(0, 10, 5)
	m.set_default(-5)
	assert_eq(m.get_default(), 0, 'min')
	m.set_default(20)
	assert_eq(m.get_default(),  10, 'max')

func test_cannot_set_current_past_max():
	var m = Mmdc.new(0, 10)
	m.set_current(20)
	assert_eq(m.get_current(), 10)

func test_cannot_set_current_lower_than_min():
	var m =  Mmdc.new(0, 10)
	m.set_current(-1)
	assert_eq(m.get_current(), 0)

func test_increment_changes_value_relatively():
	var  m =  Mmdc.new(0, 30, 15)
	m.increment(5)
	assert_eq(m.get_current(), 20)

func test_cannot_increment_past_max():
	var m =  Mmdc.new(10, 20, 15)
	m.increment(100)
	assert_eq(m.get_current(), 20)

func test_cannot_increment_below_min():
	var m =  Mmdc.new(10, 20, 15)
	m.increment(-100)
	assert_eq(m.get_current(), 10)

func test_changing_min_will_keep_current_valid():
	var m =  Mmdc.new(0, 10, 0)
	m.set_min(1)
	assert_eq(m.get_current(), 1)

func test_setting_max_will_keep_current_valid():
	var m =   Mmdc.new(0, 10, 10)
	m.set_max(9)
	assert_eq(m.get_current(), 9)

func test_setting_min_keeps_default_valid():
	var m =  Mmdc.new(0, 10, 0)
	m.set_min(1)
	assert_eq(m.get_default(), 1)

func test_setting_max_will_keep_default_valid():
	var m =   Mmdc.new(0, 10, 10)
	m.set_max(9)
	assert_eq(m.get_default(), 9)

func test_is_max_returns_correct_value():
	var m = Mmdc.new(0, 10, 10)
	assert_true(m.is_max(), 'at max, should be true')
	m.set_current(5)
	assert_false(m.is_max(), 'not a max, should be false')

func test_is_min_returns_correct_value():
	var m = Mmdc.new(0, 10, 0)
	assert_true(m.is_min(), 'at min, should be true')
	m.set_current(5)
	assert_false(m.is_min(), 'not a min, should be false')

func test_is_default_returns_correct_value():
	var m = Mmdc.new(0, 10, 2)
	assert_true(m.is_default(), 'at default, should be true')
	m.set_current(5)
	assert_false(m.is_default(), 'not a default, should be false')

func test_reset_sets_value_to_default():
	var m = Mmdc.new(0, 10, 5)
	m.set_current(2)
	m.reset()
	assert_eq(m.get_current(), 5)
