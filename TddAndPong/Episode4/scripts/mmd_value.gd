var _min = 0
var _max = 0
var _value = 0
var _default =  0

func _init(low=0, high=0, default=0):
	_min  =  low
	_max = high
	set_default(default)
	set_value(default)

func _restrict_value(val):
	return max(min(val, _max), _min)

func get_min():
	return _min

func set_min(val):
	_min = val
	set_value(_value)
	set_default(_default)

func get_max():
	return _max

func set_max(val):
	_max = val
	set_value(_value)
	set_default(_default)

func get_default():
	return _default

func set_default(default):
	_default = _restrict_value(default)

func get_value():
	return _value

func set_value(current):
	_value = _restrict_value(current)

func increment(by):
	set_value(_value + by)

func reset():
	_value = _default

func is_max():
	return  _value == _max

func is_min():
	return _value == _min

func is_default():
	return _value == _default
