extends Control
@onready var defeat_text: Label = $Main/DefeatText

func _ready() -> void:
	Game.save_game()
	defeat_text.text = "You lost at round: " + str(Game.rounds)


func _on_next_btn_pressed() -> void:
	get_tree().change_scene_to_file("uid://dux0orkppw1w6")
	Game.reset_score()


func _on_menu_btn_pressed() -> void:
	get_tree().change_scene_to_file("uid://dyfo0mps4eg33")
	Game.reset_score()
