extends 'res://scripts/game.gd'

var Bonuses = load('res://scripts/bonuses.gd')
var _cycle_timer = Timer.new()

func  _ready():
#	._ready()
	var _paddle_inc = 10
	var b1 = Bonuses.PaddleSize.new()
	b1.set_amount(_paddle_inc)
	$BonusSpawn.set_bonus(b1)

	var b2 = Bonuses.PaddleSize.new()
	b2.set_amount(_paddle_inc)
	$BonusSpawn2.set_bonus(b2)

	var b3 = Bonuses.PaddleSize.new()
	b3.set_amount(_paddle_inc * -1)
	$BonusSpawn3.set_bonus(b3)

	var b4 = Bonuses.PaddleSize.new()
	b4.set_amount(_paddle_inc * -1)
	$BonusSpawn4.set_bonus(b4)

	add_child(_cycle_timer)
	_cycle_timer.set_wait_time(10)
	_cycle_timer.set_one_shot(false)
	_cycle_timer.start()
	_cycle_timer.connect('timeout',  self, '_cycle_bonus')
	_cycle_timer.start()
	
	for i in range(_bonus_spawners.size()):
		print(i)
		_bonus_spawners[i].get_bonus_box().set_enabled(false)

func _cycle_bonus():
	_bonus_spawners[0].get_bonus_box().set_enabled(false)
	var b = _bonus_spawners[0]
	_bonus_spawners.remove(0)
	_bonus_spawners.append(b)
	_bonus_spawners[0].get_bonus_box().set_enabled(true)
