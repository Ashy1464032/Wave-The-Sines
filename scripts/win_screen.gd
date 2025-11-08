extends Control
@onready var victory_text: Label = $Main/VictoryText

func _ready() -> void:
	Game.save_game()
	victory_text.text = "You Won Round: " + str(Game.rounds)


func _on_next_btn_pressed() -> void:
	get_tree().change_scene_to_file("uid://dux0orkppw1w6")


func _on_menu_btn_pressed() -> void:
	get_tree().change_scene_to_file("uid://dyfo0mps4eg33")
	Game.reset_score()
