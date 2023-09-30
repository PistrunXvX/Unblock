extends Node

@onready var timeLine = $ClockTime
@onready var stamina = $Stamina/StaminaBar
@onready var timer = $Stamina/StaminaBar/Timer
@onready var hp_bar = $Health/TextureProgressBar
@export var max_stamina = 100
@export var step_stamina = 1
@export var max_hp = 100
@export var step_hp = 5

var local_hour = 0
var local_minut = 0
#@onready var health = $He

signal start_day

func _ready():
	timeLine.start()
	stamina.value = PlayerStatus.stamina
	stamina.max_value = max_stamina
	hp_bar.value = max_hp
	hp_bar.max_value = max_hp

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_clock_time_timeout():
	start_day.emit()
	
	PlayerStatus.time += 1
	local_hour += 1
	local_minut += 1
	
	PlayerStatus.stamina = 1
	
	if PlayerStatus.minuts == 60:
		PlayerStatus.minuts = 0
	
	if local_hour == 75:
		PlayerStatus.hours += 1
		local_hour = 0
	if local_minut == 12:
		PlayerStatus.minuts += 10
		local_minut = 0

func negative_event(check, count):
	if (check):
		PlayerStatus.stamina += count
	else:
		PlayerStatus.stamina -= count

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
	PlayerStatus.stamina += step_stamina
	stamina.value = PlayerStatus.stamina
