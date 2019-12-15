extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Disable_pressed():
	$BonusSpawn.get_bonus_box().set_enabled(false)


func _on_Award_pressed():
	pass # Replace with function body.


func _on_Enable_pressed():
	$BonusSpawn.get_bonus_box().set_enabled(true)
