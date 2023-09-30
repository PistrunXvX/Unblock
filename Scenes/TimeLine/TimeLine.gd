extends Node

@onready var timeLine = $ClockTime
const EVENTS = preload("res://GlobalScripts/Events.gd")

var currentTime = 0

signal start_day

func _ready():
	timeLine.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_clock_time_timeout():
	start_day.emit()
	currentTime += 1
	
	if currentTime == 10:
		EVENTS.negative_event()
	
	
	
	
