extends Control

var count = 0

func _on_button_pressed():
	count += 1
	$Label.text = count
