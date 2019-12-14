extends Node2D


var  _bonus = null
var _timer = Timer.new()
var _bonus_box = load('res://scenes/BonusBox.tscn').instance()

signal bonus

func _ready():
	add_child(_timer)
	_timer.set_wait_time(20)
	_timer.set_one_shot(true)
	_timer.start()
	_timer.connect('timeout', self, '_on_timer_timeout')
	
	_bonus_box.connect('bonus', self, 'on_bonus_hit')
	add_child(_bonus_box)
	
func  _on_timer_timeout():
	_bonus_box.set_visible(true)
	_bonus_box.set_enabled(false)
	
func on_bonus_hit(bonus):
	emit_signal('bonus', _bonus_box.get_bonus())
	_bonus_box.set_enabled(false)
	_bonus_box.set_visible(false)
	_timer.start()
		
func get_bonus():
	return _bonus

func set_bonus(bonus):
	_bonus = bonus
