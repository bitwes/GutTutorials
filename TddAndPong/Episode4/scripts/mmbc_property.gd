var _min = 0
var _max = 0
var _current = 0
var _default =  0

func _init(low=0, high=0, default=0):
	_min  =  low
	_max = high
	_default = default
	_current = default
	
func get_min():
	return _min

func set_min(val):
	_min = val

func get_max():
	return _max

func set_max(val):
	_max = val

func get_default():
	return _default

func set_default(default):
	_default = default

func get_current():
	return _current

func set_current(current):
	_current = max(min(current, _max), _min)

func increment(by):
	set_current(_current + by)

func reset():
	_current = _default
