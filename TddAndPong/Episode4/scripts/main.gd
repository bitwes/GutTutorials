extends Node2D

var GamePlayer = load('res://scenes/GamePlayer.tscn')
var StandardGame = load('res://scenes/Game.tscn')
var ChannelGame  = load('res://scenes/GAme2.tscn')

func _goto_scene_instance(inst):
	get_tree().get_root().add_child(inst)
	self.queue_free()
	

func _goto_game(game):
	var gp = GamePlayer.instance()
	gp.set_game(game)
	call_deferred("_goto_scene_instance", gp)
	

func _on_StandardCourt_pressed():
	_goto_game(StandardGame.instance())


func _on_ChannelCourt_pressed():
	_goto_game(ChannelGame.instance())
