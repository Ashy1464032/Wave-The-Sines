extends Node

var rounds: int = 0
var high_score: int = 0

var config = ConfigFile.new()

func _ready() -> void:
	if (!config.has_section("data")):
		config.set_value("data", "high_score", 0)

func increment_score():
	rounds = clampi(rounds+1, 0, 999)
	if (rounds >= high_score):
		high_score = clamp(rounds, 0, 999)

func reset_score():
	save_game()
	rounds = 0

func save_game():
	config.set_value("data", "high_score", high_score)
	config.save("user://sine.cfg")

func load_game():
	high_score = config.get_value("data", "high_score", 0)
	
