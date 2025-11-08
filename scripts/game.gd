extends Node

var rounds: int = 0
var high_score: int = 0

const SAVE_GAME_PATH = "user://sineGameData.tres"

@export var playerData: PlayerData = preload("uid://dxta4bpx6bprv")

func _ready() -> void:
	load_game()

func increment_score():
	rounds = clampi(rounds+1, 0, 999)
	if (rounds >= high_score):
		high_score = clamp(rounds, 0, 999)

func reset_score():
	save_game()
	rounds = 0

func save_game() -> void:
	playerData.high_score = high_score
	ResourceSaver.save(playerData, SAVE_GAME_PATH)

func load_game():
	if ResourceLoader.exists(SAVE_GAME_PATH):
		playerData = ResourceLoader.load(SAVE_GAME_PATH).duplicate(true)
