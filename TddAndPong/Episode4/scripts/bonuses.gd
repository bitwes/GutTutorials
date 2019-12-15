class BaseBonus:
	var _amount = 0
	var _name = 'empty'

	func get_amount():
		return _amount

	func set_amount(amount):
		_amount = amount

	func get_name():
		return _name

	func set_name(name):
		_name = name

class PaddleSize:
	extends BaseBonus

	func  _init():
		_name  = 'paddle size'


class  BallSize:
	extends BaseBonus

	func _init():
		_name  = 'ball size'
