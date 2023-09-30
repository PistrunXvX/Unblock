extends Node

@onready var timeLine = $ClockTime
@onready var stamina = $Stamina/StaminaBar
@onready var timer = $Stamina/StaminaBar/Timer
@onready var hp_bar = $Health/TextureProgressBar
@export var max_stamina = 100
@export var step_stamina = 1
@export var max_hp = 100
@export var step_hp = 5

#@onready var health = $He
var currentTime = 0

signal start_day

func _ready():
	timeLine.start()
	stamina.value = 0
	stamina.max_value = max_stamina
	hp_bar.value = max_hp
	hp_bar.max_value = max_hp

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_clock_time_timeout():
	start_day.emit()
	currentTime += 1
	
	if currentTime == 5:
		negative_event(false, 10)
#
func negative_event(check, count):
	if (check):
		stamina.value += count
	else:
		stamina.value -= count

func empty_event(check, count):
	if (check):
		stamina.value += count
	else:
		stamina.value -= count

func succsess_event(check, count):
	if (check):
		stamina.value += count
	else:
		stamina.value -= count

func _on_timer_timeout():
	stamina.value += step_stamina
