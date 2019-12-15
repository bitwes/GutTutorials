extends Area2D

export var _color = Color(1, 1, 1) setget set_color, get_color
var _bonus = null
var _enabled  = true

signal bonus

func get_color():
	return _color

func set_color(color):
	_color = color

func _draw():
	var e = $Shape.shape.extents
	draw_rect(Rect2(e.x * -1, e.y * -1, e.x * 2, e.y * 2), _color)

func _on_BonusBox_area_entered(area):
	if(_enabled):
		emit_signal('bonus', _bonus)
		_enabled = false
		$AnimationPlayer.play('award')

func get_bonus():
	return _bonus

func set_bonus(bonus):
	_bonus = bonus

func set_enabled(enabled):
	
	if(enabled and !_enabled):
		$AnimationPlayer.play("enable")
		update()
	elif(!enabled  and  _enabled):
		$AnimationPlayer.play("disable")
		update()
	_enabled = enabled
func is_enabled():
	return _enabled