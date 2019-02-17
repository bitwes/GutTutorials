extends Area2D

signal score

func _on_ScoreBox_area_entered(area):
	emit_signal('score')
