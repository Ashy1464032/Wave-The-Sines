extends Node2D

var ampMatches = false
var FreqMatches = false
var GameWon = false

@onready var player_wave: player = $PlayerWave
@onready var wave: Wave = $Wave

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func check_amp() -> bool:
	if player_wave.amplitude == wave.amplitude:
		ampMatches = true
		return true
	return false

func check_freq() -> bool:
	if snappedf(player_wave.frequency, 0.01) == snappedf(wave.frequency, 0.01):
		FreqMatches = true
		return true
	return false

func win_game():
	if(check_amp() && check_freq()):
		if(!GameWon):
			print("Won the round!")
			GameWon = true
			get_tree().call_deferred("change_scene_to_file","res://scenes/win_screen.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	win_game()
	if (Input.is_action_just_released("ampUp")):
		player_wave.increaseAmp()
	if (Input.is_action_just_released("ampDown")):
		player_wave.decreaseAmp()
	if (Input.is_action_just_released("FreqUp")):
		player_wave.increaseFreq()
	if (Input.is_action_just_released("FreqDown")):
		player_wave.decreaseFreq()
