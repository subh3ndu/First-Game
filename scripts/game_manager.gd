extends Node

var score = 0

@onready var mobile_controls = $MobileControls

func add_point():
	score += 1
	mobile_controls.get_node("HBoxContainer3").get_node("ScoreText").text = "Score: " + str(score)

func become_host():
	print("Become host pressed")
	%MultiplayerHUD.hide()
	MultiplayerManager.become_host()

func join_as_player_2():
	print("Join as player 2")
	%MultiplayerHUD.hide()
	MultiplayerManager.join_as_player2()
