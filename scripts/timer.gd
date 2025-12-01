extends Node2D

@onready var timer: Timer = $Timer
@onready var label: Label = $Label
@export var seconds: int = 60


func _ready() -> void:
	timer.start(seconds)

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/lose_screen.tscn")

func _process(_delta: float) -> void:
	label.text = str(int(ceil(timer.time_left)))
