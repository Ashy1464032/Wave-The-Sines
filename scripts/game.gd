extends Node

var rounds: int = 0
var high_score: int = 0

func increment_score():
	rounds = clampi(rounds+1, 0, 999)
	if (rounds >= high_score):
		high_score = clamp(rounds, 0, 999)
