extends Control

@onready var hp_bar = $TextureProgressBar
@export var max_hp = 100
@export var step_hp = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	
	#number of lives
	hp_bar.value = max_hp
	hp_bar.max_value = max_hp

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
		
func die():
	print("died")

