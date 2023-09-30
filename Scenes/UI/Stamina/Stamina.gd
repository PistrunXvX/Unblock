extends Control

@onready var stamina = $StaminaBar
@onready var timer = $StaminaBar/Timer
@onready var hp_bar = $Hea
@export var max_stamina = 100
@export var step_stamina = 1
@export var max_hp = 100
@export var step_hp = 5

signal change_stumina(check, count)
# Called when the node enters the scene tree for the first time.
func _ready():
	
	#initial value of stamina bar
	stamina.value = 0
	stamina.max_value = max_stamina
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass 

func _on_timer_timeout():
	#changing value when timer countdown
	stamina.value += step_stamina





