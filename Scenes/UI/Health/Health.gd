extends Control

@onready var hp_bar = $TextureProgressBar


# Called when the node enters the scene tree for the first time.
func _ready():
	
	#number of lives
	hp_bar.value = 5
	
	#number of max count of lives
	hp_bar.max_value = 5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
		
func die():
	print("died")

