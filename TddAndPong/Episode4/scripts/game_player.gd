extends Node2D

var _game = null

func _goto_scene_instance(inst):
	get_tree().get_root().add_child(inst)
	self.queue_free()
	

func _main_menu():
	var main_menu = load('res://scenes/Main.tscn').instance()
	call_deferred("_goto_scene_instance", main_menu)

func _process(delta):
	$BallSpeed.set_text(str(_game.get_ball().get_speed()))

func _ready():
	$GameOverDisplay.hide()

func get_game():
	return _game

func set_game(game):
	_game = game
	_game.set_max_score(10)
	_game.connect('game_over', self, '_on_game_over')
	add_child(_game)
	_game.set_z_index(-100)

func _on_game_over():
	$GameOverDisplay.show()


func _on_MainMenu_pressed():
	_main_menu()
