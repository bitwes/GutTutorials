extends Area2D

export var _color = Color(1, 1, 1) setget set_color, get_color

func get_color():
	return _color

func set_color(color):
	_color = color


func _draw():
	var e = $Shape.shape.extents
	draw_rect(Rect2(e.x * -1, e.y * -1, e.x * 2, e.y * 2), _color)

func bounce(ball):
	ball.set_direction(ball.get_direction() * Vector2(1, -1))

func _on_Wall_area_entered(area):
	bounce(area)
