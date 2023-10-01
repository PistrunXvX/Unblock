extends Node2D

@onready var hours = $ColorRect/Hours
@onready var minutes = $ColorRect/Minuts

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	hours.text = "0{hour}".format({"hour":PlayerStatus.hours})
	if PlayerStatus.minuts <= 0 || PlayerStatus.minuts >= 60:
		minutes.text = "00"
	else:
		minutes.text = str(PlayerStatus.minuts)
