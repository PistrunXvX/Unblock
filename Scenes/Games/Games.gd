extends Node2D

@onready var label = $ClickRect/Counter
var countClick = 0

func _process(delta):
	pass

func _on_button_pressed():
	countClick += 1
	label.text = str(countClick)
	if countClick % 10 == 0:
		PlayerStatus.stamina -= 1.5
