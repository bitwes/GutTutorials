var _game = null

var Bonuses = load('res://scripts/bonuses.gd')

func apply_paddle_size(bonus):
	var paddle = _game.get_ball().get_last_paddle_hit()
	if(paddle != null):
		paddle.set_size(paddle.get_size() + bonus.get_amount())

func handle_bonus(bonus):
	if(bonus is Bonuses.PaddleSize):
		apply_paddle_size(bonus)
	elif(bonus !=  null):
		print('Unknown Bonus:  ', bonus.get_name())

func set_game(game):
	_game = game

func get_game():
	return  _game
