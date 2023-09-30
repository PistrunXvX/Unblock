extends Node

@onready var label = $ClickRect/Counter
var countClick = 0

func _on_button_pressed():
	countClick += 1
	label.text = str(countClick)
