extends 'res://scripts/game.gd'

var Bonuses = load('res://scripts/bonuses.gd')
var _cycle_timer = Timer.new()

func _set_bonus(bonus_box, BonusClass, amount):
	var b = BonusClass.new()
	b.set_amount(amount)
	bonus_box.set_bonus(b)

func  _ready():
	var _paddle_inc = 10

	_set_bonus($BonusSpawn, Bonuses.PaddleSize, _paddle_inc)
	_set_bonus($BonusSpawn2, Bonuses.PaddleSize, _paddle_inc)
	_set_bonus($BonusSpawn3, Bonuses.PaddleSize, _paddle_inc * -1)
	_set_bonus($BonusSpawn4, Bonuses.PaddleSize, _paddle_inc * -1)

	add_child(_cycle_timer)
	_cycle_timer.set_wait_time(10)
	_cycle_timer.set_one_shot(false)
	_cycle_timer.start()
	_cycle_timer.connect('timeout',  self, '_cycle_bonus')
	_cycle_timer.start()

	for i in range(_bonus_spawners.size()):
		_bonus_spawners[i].get_bonus_box().set_enabled(false)

func _cycle_bonus():
	_bonus_spawners[0].get_bonus_box().set_enabled(false)
	var b = _bonus_spawners[0]
	_bonus_spawners.remove(0)
	_bonus_spawners.append(b)
	_bonus_spawners[0].get_bonus_box().set_enabled(true)
