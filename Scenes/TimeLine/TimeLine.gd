extends Node

@onready var timeLine = $ClockTime
@onready var stamina = $Stamina/StaminaBar
@onready var timer = $Stamina/StaminaBar/Timer
@onready var hp_bar = $Health/TextureProgressBar
@onready var dialogWindow = $DialogSystem
@onready var endDisplay = $EndScreenMistake
@onready var winDisplay = $EndScreen
@export var max_stamina = 100
@export var step_stamina = 1.5
@export var max_hp = 100
@export var step_hp = 5

var local_hour = 0
var local_minut = 0
var local_stamina = 0

signal start_day

func _ready():
	stamina.value = PlayerStatus.stamina
	stamina.max_value = max_stamina
	hp_bar.value = max_hp
	hp_bar.max_value = max_hp
	dialogWindow.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Events.isStartDay == false:
		Events.phone_call(true)
		if Events.isAcceptCall:
			Events.start_dialog(true, 0)
			dialogWindow.show()
			if Events.isFinishDialog:
				timeLine.start()
				dialogWindow.hide()
				Events.isStartDay = true
				Events.isAcceptCall = false
				Events.isFinishDialog = false
				Events.isCall = false
				Events.isStartDialog = false
	if Events.isFail:
		endDisplay.show()
		dialogWindow.hide()
	if Events.isWin:
		winDisplay.show()
		dialogWindow.hide()

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
	
	if PlayerStatus.time == 70:
		Events.phone_call(true)
	if PlayerStatus.time >= 70 && PlayerStatus.time <= 110 && Events.isAcceptCall:
			Events.start_dialog(true, 1)
			dialogWindow.show()
			if Events.isFinishDialog:
				dialogWindow.hide()
				Events.isAcceptCall = false
				Events.isFinishDialog = false
	if PlayerStatus.time == 110 && Events.isAcceptCall == false:
		Events.phone_call(false)
	
	if PlayerStatus.time == 120:
		Events.phone_call(true)
	if PlayerStatus.time >= 120 && PlayerStatus.time <= 200 && Events.isAcceptCall:
			Events.start_dialog(true, 2)
			dialogWindow.show()
			if Events.isFinishDialog:
				dialogWindow.hide()
				Events.isAcceptCall = false
				Events.isFinishDialog = false
	if PlayerStatus.time == 200 && Events.isAcceptCall == false:
		Events.phone_call(false)
	
	if PlayerStatus.time == 260:
		Events.phone_call(true)
	if PlayerStatus.time >= 260 && PlayerStatus.time <= 280 && Events.isAcceptCall:
			Events.start_dialog(true, 3)
			dialogWindow.show()
			if Events.isFinishDialog:
				dialogWindow.hide()
				Events.isAcceptCall = false
				Events.isFinishDialog = false
	if PlayerStatus.time == 280 && Events.isAcceptCall == false:
		Events.phone_call(false)
		
	
	if PlayerStatus.time == 330:
		Events.phone_call(true)
	if PlayerStatus.time >= 330 && PlayerStatus.time <= 380 && Events.isAcceptCall:
			Events.start_dialog(true, 4)
			dialogWindow.show()
			if Events.isFinishDialog:
				dialogWindow.hide()
				Events.isAcceptCall = false
				Events.isFinishDialog = false
	if PlayerStatus.time == 380 && Events.isAcceptCall == false:
		Events.phone_call(false)
	
	if PlayerStatus.time == 500:
		Events.phone_call(true)
	if PlayerStatus.time >= 500 && PlayerStatus.time <= 540 && Events.isAcceptCall:
			Events.start_dialog(true, 5)
			dialogWindow.show()
			if Events.isFinishDialog:
				dialogWindow.hide()
				Events.isAcceptCall = false
				Events.isFinishDialog = false
	if PlayerStatus.time == 540 && Events.isAcceptCall == false:
		Events.phone_call(false)
		
	if PlayerStatus.time == 40:
		Events.car_spawn(true)
		Events.currentCar = 0
	if PlayerStatus.time == 100:
		Events.car_spawn(true)
		Events.currentCar = 1
	if PlayerStatus.time == 130:
		Events.car_spawn(true)
		Events.currentCar = 2
	if PlayerStatus.time == 200:
		Events.car_spawn(true)
		Events.currentCar = 3
	if PlayerStatus.time == 420:
		Events.car_spawn(true)
		Events.currentCar = 4
	if PlayerStatus.time == 490:
		Events.car_spawn(true)
		Events.currentCar = 5
	if PlayerStatus.time == 530:
		Events.car_spawn(true)
		Events.currentCar = 6
	if PlayerStatus.time == 570:
		Events.car_spawn(true)
		Events.currentCar = 7
	
	if PlayerStatus.stateMistake >= 2:
		Events.isFail = true
	
	if PlayerStatus.time == 610:
		Events.isWin = true

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
	if Events.isStartDay:
		var affect_stamina = 0
		
	#	print("Radio Noise: ", PlayerStatus.isRadioNoise)
	#	print("Radio Station : ", PlayerStatus.isRadioStation)
		
		if PlayerStatus.isRadioNoise:
			affect_stamina += 0.25
		if PlayerStatus.isRadioStation:
			affect_stamina -= 0.5
		local_stamina += step_stamina + affect_stamina
		
		stamina.value = local_stamina
		PlayerStatus.stamina = local_stamina
		
		print("Affect stamina", affect_stamina)
		print("Current stamina", PlayerStatus.stamina)
