extends Node2D

var switch = false
var top = true
var filled = false

var sugar = false
var water = false
var coffee = false
		
func checkIfFilled():
	print(filled)
	if coffee and sugar and water:
		filled = true
	else:
		filled = false
	print(filled)

func machineWork():
	$work.play()
	await get_tree().create_timer(2).timeout
	$work.stop()
	$fill.play()
	await get_tree().create_timer(6).timeout
	$workSuccess.play()
	$"../Grafin/Grafin".frame = 1
	sugar = false
	$SUGAR.color = 111111
	water = false
	$WATER.color = 111111
	coffee = false
	$COFFEE.color = 111111
	switch = false
	$Button.frame = 0

func _on_switch_button_toggled(button_pressed):
	checkIfFilled()
	switch = true
	if switch and filled:
		switch = true
		$Button.frame = 1
		$clickSuccess.play()
		await get_tree().create_timer(0.5).timeout
		machineWork()
		
	elif switch and !filled:
		$clickError.play()
		switch = false

func _on_top_button_toggled(button_pressed):
	if top == false:
		top = true
		$Top.show()
	else:
		top = false
		$Top.hide()


func _on_coffee_pressed():
	coffee = true
	$COFFEE.color = 000000

func _on_sugar_pressed():
	sugar = true
	$SUGAR.color = 000000

func _on_water_pressed():
	water = true
	$WATER.color = 000000
