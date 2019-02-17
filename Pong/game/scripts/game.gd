extends Node2D


func _ready():
	pass

func _process(delta):
	if(Input.is_action_pressed("left_down")):
		$LeftPaddle.down(delta)
	if(Input.is_action_pressed("left_up")):
		$LeftPaddle.up(delta)
	
	if(Input.is_action_pressed("right_down")):
		$RightPaddle.down(delta)
	if(Input.is_action_pressed("right_up")):
		$RightPaddle.up(delta)