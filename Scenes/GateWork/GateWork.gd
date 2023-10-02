extends Node2D

@onready var car_color = $Car
@onready var gate_color = $Gate
@onready var guard_color = $Guard
@onready var lampSignal = $LampSignal

@onready var car_spawn = $Car/CarSpawn
@onready var car_enters = $Car/CarEnters
@onready var car_wait = $Car/CarWaiting
@onready var car_left = $Car/CarLeft
@onready var beep_time = $Car/BeepTime
@onready var beeep = $Car/BeepTime/Beeep

@onready var gate_op = $Gate/GateOpens
@onready var gate_cl = $Gate/GateCloses

@onready var guard_ent = $Guard/GuardEnters
@onready var guard_left = $Guard/GuardLeft

@onready var carNumber = $Car/CurNumber
@onready var carMark = $Car/CarMark

var is_car_here = false
var is_gate_opened = false
var offsetCardOnBlock = Vector2(512, 648)
var offsetCarOutside = Vector2(-872, 1288)
var spawnPositionCar = Vector2(2500, 200)

var enters_time = false
var wait_time = false
var guard = true
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if is_car_here == true and is_gate_opened == true:
		if wait_time == true:
			car_wait.stop()
			beep_time.stop()
			wait_time = false
			car_enters.start()
	
	if Events.carSpaw:
		spawn_timeout()
		Events.carSpaw = false



func spawn_timeout():
	match Events.currentCar:
		0:
			carNumber.text = CarList.carListSmall.car_4.carNumber
			carMark.text = CarList.carListSmall.car_4.carBrand
		1:
			carNumber.text = CarList.carListSmall.car_2.carNumber
			carMark.text = CarList.carListSmall.car_2.carBrand
		2:
			carNumber.text = CarList.carListSmall.car_1_not.carNumber
			carMark.text = CarList.carListSmall.car_1_not.carBrand
		3:
			carNumber.text = CarList.carListSmall.car_3.carNumber
			carMark.text = CarList.carListSmall.car_3.carBrand
		4:
			carNumber.text = CarList.carListSmall.car_5.carNumber
			carMark.text = CarList.carListSmall.car_5.carBrand
		5:
			carNumber.text = CarList.carListSmall.car_2_not.carNumber
			carMark.text = CarList.carListSmall.car_2_not.carBrand
		6:
			carNumber.text = CarList.carListSmall.car_3_not.carNumber
			carMark.text = CarList.carListSmall.car_3_not.carBrand
		7:
			carNumber.text = CarList.carListSmall.car_1.carNumber
			carMark.text = CarList.carListSmall.car_1.carBrand

	var tween = get_tree().create_tween()
	car_spawn.stop()
	is_car_here = true
	car_color.show()
	car_color.set_position(spawnPositionCar)
	
	if !Music.soundCarArrive.is_playing():
		Music.soundCarArrive.play()
	
	tween.stop()
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(car_color, "position", offsetCardOnBlock, 6.0).from(spawnPositionCar)
	tween.play()
	
	await tween.finished
	
	if !Music.soundCarWait.is_playing():
		Music.soundCarWait.play()
	
	car_wait.start()
	beep_time.start()
	wait_time = true
	print("Car Here")


func _on_open_pressed():
	$"../../Display_4/GREEN".frame = 1
	$buttonPress.play()
	await get_tree().create_timer(0.5).timeout
	$"../../Display_4/GREEN".frame = 0
	$buttonRelease.play()
	
	var tween = get_tree().create_tween()
	gate_op.start()
	
	tween.stop()
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(gate_color, "rotation_degrees", 35, 2.0).from(0)
	tween.play()
	
	await tween.finished
	
	print("Gate Opens")


func _on_gate_opens_timeout():
	lampSignal.show()
	is_gate_opened = true
	print("Gate Opened")


func _on_close_pressed():
	$"../../Display_4/RED".frame = 1
	$buttonPress.play()
	await get_tree().create_timer(0.5).timeout
	$"../../Display_4/RED".frame = 0
	$buttonRelease.play()
	
	var tween = get_tree().create_tween()
	gate_cl.start()
	
	tween.stop()
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(gate_color, "rotation_degrees", 0, 1.0).from(35)
	tween.play()
	
	await tween.finished
	
	print("Gate Closes")


func _on_gate_closes_timeout():
	lampSignal.hide()
	is_gate_opened = false
	print("Gate Closed")


func _on_car_enters_timeout():
	match Events.currentCar:
		2:
			PlayerStatus.stateMistake += 1
		4:
			PlayerStatus.stateMistake += 1
		5:
			PlayerStatus.stateMistake += 1
		6:
			PlayerStatus.stateMistake += 1
	var tween = get_tree().create_tween()
	
	if Music.soundCarWait.is_playing():
		Music.soundCarWait.stop()
	
	if !Music.soundCarDepart.is_playing():
		Music.soundCarDepart.play()
	
	tween.stop()
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(car_color, "position", offsetCarOutside, 3.0).from(offsetCardOnBlock)
	tween.play()
	
	await tween.finished
	
	car_color.hide()
	car_spawn.start()
	print("hehehe")


func _on_car_waiting_timeout():		
	car_left.start()


func _on_car_left_timeout():
	match Events.currentCar:
		0:
			PlayerStatus.stateMistake += 1
		1:
			PlayerStatus.stateMistake += 1
		3:
			PlayerStatus.stateMistake += 1
		7:
			PlayerStatus.stateMistake += 1
	print("Car left")
	if Music.soundCarWait.is_playing():
		Music.soundCarWait.stop()
	
	if !Music.soundCarDepart.is_playing():
		Music.soundCarDepart.play()
	is_car_here = false
	car_color.hide()
	car_spawn.start()


func _on_beep_time_timeout():
	print("prepare")
	beeep.start()

func _on_beeep_timeout():
	if !Music.soundCarBeep.is_playing():
		Music.soundCarBeep.play()
	print("beep")


func _on_guard_button_pressed():
	$"../../Display_4/BLUE".frame = 1
	$buttonPress.play()
	await get_tree().create_timer(0.5).timeout
	$"../../Display_4/BLUE".frame = 0
	$buttonRelease.play()
	
	if is_car_here == false and guard == true:
		print("Nope.")
	elif is_car_here == true and guard == true:
		guard_ent.start()
		guard_color.color = Color.WHITE
		wait_time = false
		car_wait.stop()
		beep_time.stop()
		beeep.stop()
		guard = false
	elif is_car_here == true and guard == false:
		print("No, im on car")
	

func _on_guard_left_timeout():
	guard_color.color = Color.BLACK
	guard = true
	print("guard left")


func _on_guard_enters_timeout():
	car_left.start()
	guard_left.start()
	print("Guard Enters")
