class BaseBonus:
	var amount = 0
	var name = 'empty'

class PaddleSize:
	extends BaseBonus

	func  _init():
		name  = 'paddle size'

class  BallSize:
	extends BaseBonus

	func _init():
		name  = 'ball size'
