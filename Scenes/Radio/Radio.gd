extends Node2D

@onready var numberLabel = $ColorRect/numbers
@onready var signalNumber = $ColorRect/signalNumbers
@onready var noSignal = $ColorRect/NoSignal
@onready var middleSignal = $ColorRect/middleSignal
@onready var enterSignal = $ColorRect/enterSignal

@export var minRadioSignal = 60.0
@export var maxRadioSignal = 130.0

var defaultColor = Color(0.369, 0.369, 0.369)
var redColor = Color(0.702, 0, 0.082)
var yellowColor = Color(0.471, 0.345, 0)
var greenColor = Color(0.051, 0.451, 0)

var onRadio = false
var numerRadio = 90.0
var signalRadio = 101.1 # add random

func _ready():
	numberLabel.text = "{value}Гц".format({"value":numerRadio})
	signalNumber.value = numerRadio
	signalNumber.min_value = minRadioSignal
	signalNumber.max_value = maxRadioSignal

func _process(delta):
	if onRadio:
		switch_signals()

func _on_on_off_button_button_up():
	if onRadio:
		onRadio = false
		noSignal.set_color(defaultColor)
		middleSignal.set_color(defaultColor)
		enterSignal.set_color(defaultColor)
		print('Radio Off')
	else:
		onRadio = true
		signalRadio = randf_range(minRadioSignal, maxRadioSignal)
		print("Current radiostation:", signalRadio)
		print('Radio On')

func _on_signal_numbers_value_changed(value):
	numberLabel.text = "{value}Гц".format({"value":value})
	numerRadio = value

func switch_signals():
	var signalDistance = abs(signalRadio - numerRadio)

	if signalDistance > 2.0:
		noSignal.set_color(redColor)
		middleSignal.set_color(defaultColor)
		enterSignal.set_color(defaultColor)
	elif signalDistance <= 2.0 && signalDistance > 0.5:
		noSignal.set_color(defaultColor)
		middleSignal.set_color(yellowColor)
		enterSignal.set_color(defaultColor)
	elif signalDistance <= 0.3:
		noSignal.set_color(defaultColor)
		middleSignal.set_color(defaultColor)
		enterSignal.set_color(greenColor)
