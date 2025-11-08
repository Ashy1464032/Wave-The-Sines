extends Control

@onready var high_score: Label = $Background/HighScore
@onready var version: Label = $Background/Version

func _ready() -> void:
	Game.load_game()
	high_score.text = "High Score: " + str(Game.playerData.high_score)
	version.text = str(ProjectSettings.get_setting("application/config/version"))

func _on_play_btn_pressed() -> void:
	
	get_tree().change_scene_to_file("uid://dux0orkppw1w6")

func _on_quit_btn_pressed() -> void:
	Game.save_game()
	get_tree().quit()
