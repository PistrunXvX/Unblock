extends Node2D

@onready var car_color = $Car
@onready var gate_color = $Gate
@onready var guard_color = $Guard

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

var is_car_here = false
var is_gate_opened = false

var enters_time = false
var wait_time = false
var guard = true
# Called when the node enters the scene tree for the first time.
func _ready():
	car_spawn.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if is_car_here == true and is_gate_opened == true:
		if wait_time == true:
			car_wait.stop()
			beep_time.stop()
			wait_time = false
			car_enters.start()



func _on_car_spawn_timeout():
	car_spawn.stop()
	is_car_here = true
	car_color.show()
	car_wait.start()
	beep_time.start()
	wait_time = true
	print("Car Here")


func _on_open_pressed():
	gate_op.start()
	print("Gate Opens")
	


func _on_gate_opens_timeout():
	gate_color.color = Color.GREEN
	is_gate_opened = true
	print("Gate Opened")


func _on_close_pressed():
	gate_cl.start()
	print("Gate Closes")


func _on_gate_closes_timeout():
	gate_color.color = Color.RED
	is_gate_opened = false
	print("Gate Closed")


func _on_car_enters_timeout():
	car_color.hide()
	car_spawn.start()
	print("hehehe")


func _on_car_waiting_timeout():
	car_left.start()


func _on_car_left_timeout():
	print("Car left")
	is_car_here = false
	car_color.hide()
	car_spawn.start()


func _on_beep_time_timeout():
	print("prepare")
	beeep.start()

func _on_beeep_timeout():
	print("beep")


func _on_guard_button_pressed():
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
