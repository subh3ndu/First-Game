extends Node

var score = 0

@onready var mobile_controls = $MobileControls

func add_point():
	score += 1
	mobile_controls.get_node("HBoxContainer3").get_node("ScoreText").text = "Score: " + str(score)
