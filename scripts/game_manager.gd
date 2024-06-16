extends Node

var score = 0

@onready var scored_label = $ScoredLabel

func add_point():
	score += 1
	scored_label.text = "You collected " + str(score) + " coins."
	

