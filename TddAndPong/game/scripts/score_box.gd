extends Area2D

var Ball = load('res://scripts/ball.gd')

signal score

func _on_ScoreBox_area_entered(area):
	if(area is Ball):
		emit_signal('score')
