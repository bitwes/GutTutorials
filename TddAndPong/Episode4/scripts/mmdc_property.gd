var _min = 0
var _max = 0
var _current = 0
var _default =  0

func _init(low=0, high=0, default=0):
	_min  =  low
	_max = high
	set_default(default)
	set_current(default)

func _restrict_value(val):
	return max(min(val, _max), _min)

func get_min():
	return _min

func set_min(val):
	_min = val
	set_current(_current)
	set_default(_default)

func get_max():
	return _max

func set_max(val):
	_max = val
	set_current(_current)
	set_default(_default)

func get_default():
	return _default

func set_default(default):
	_default = _restrict_value(default)

func get_current():
	return _current

func set_current(current):
	_current = _restrict_value(current)

func increment(by):
	set_current(_current + by)

func reset():
	_current = _default

func is_max():
	return  _current == _max

func is_min():
	return _current == _min

func is_default():
	return _current == _default
