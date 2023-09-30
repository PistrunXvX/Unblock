extends Control

@onready var stamina = $StaminaBar
@onready var timer = $StaminaBar/Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	
	#initial value of stamina bar
	stamina.value = 0
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_timer_timeout():
	
	#changing value when timer countdown
	stamina.value += 5
