extends Node2D

@onready var numberLabel = $ColorRect/numbers
@onready var signalNumber = $ColorRect/signalNumbers
@onready var noSignal = $ColorRect/NoSignal
@onready var middleSignal = $ColorRect/middleSignal
@onready var enterSignal = $ColorRect/enterSignal

@onready var spriteRadioOn = $ColorRect/SwitchOn
@onready var spriteRadioOff = $ColorRect/SwitchOff
@onready var spriteLampaRadioOn = $ColorRect/LampaOn
@onready var spriteLampaRadioOff = $ColorRect/LampaOff

@onready var spriteRedOn = $ColorRect/RedLightOn
@onready var spriteRedOff = $ColorRect/RedLightOff
@onready var spriteOrangeOn = $ColorRect/OrangeLightOn
@onready var spriteOrangeOff = $ColorRect/OrangeLightOff
@onready var spriteGreenOn = $ColorRect/GreenLightOn
@onready var spriteGreenOff = $ColorRect/GreenLightOff
@onready var spriteSpeen = $ColorRect/Krutilka

@onready var hzmetr = $ColorRect/RadioScreenVvniz/LineSignal/HzPalkaMetr2
@onready var sizeLine = $ColorRect/RadioScreenVvniz/LineSignal

@onready var soundRadioOn = $ButtonOn
@onready var soundRadioOff = $ButtonOff
@onready var soundRadioNoise = $RadioNoise
@onready var soundRadioStation1 = $RadioSpeach
@onready var soundRadioSpeen = $RadioSpeen

@export var minRadioSignal = 60.0
@export var maxRadioSignal = 130.0

var onRadio = false
var numerRadio = 90.0
var signalRadio = 101.1 # add random
var sizeLineStep = 0
var currentStep = 0

func _ready():
	numberLabel.text = "{value}Гц".format({"value":numerRadio})
	signalNumber.value = numerRadio
	signalNumber.min_value = minRadioSignal
	signalNumber.max_value = maxRadioSignal
	sizeLineStep = sizeLine.get_size().x / 140

func _process(delta):
	if onRadio:
		switch_signals()

func _on_on_off_button_button_up():
	var currentHzmetrPosition = hzmetr.position
	if onRadio:
		onRadio = false
		spriteRadioOff.show()
		spriteLampaRadioOff.show()
		spriteRadioOn.hide()
		spriteLampaRadioOn.hide()
		# off lamps
		spriteGreenOff.show()
		spriteOrangeOff.show()
		spriteRedOff.show()
		spriteGreenOn.hide()
		spriteOrangeOn.hide()
		spriteRedOn.hide()
		
		numerRadio = 90
		signalNumber.value = 90
		hzmetr.position = Vector2(5, currentHzmetrPosition.y)
		
		if !soundRadioOff.is_playing():
			soundRadioOff.play()
		
		if Music.soundRadioNoise.is_playing():
			Music.play_sound_radio_noise(false)
			soundRadioNoise.stop()
		
		if soundRadioStation1.is_playing():
			soundRadioStation1.stop()
		
		if Music.soundRadioStation1.is_playing():
			Music.play_sound_radio_station(false)

		if soundRadioNoise.is_playing():
			soundRadioNoise.stop()
	
		print('Radio Off')
	else:
		onRadio = true
		spriteRadioOff.hide()
		spriteLampaRadioOff.hide()
		spriteRadioOn.show()
		spriteLampaRadioOn.show()
		
		signalRadio = randf_range(minRadioSignal, maxRadioSignal)
		numerRadio = 90
		signalNumber.value = 90
		hzmetr.position = Vector2(5, currentHzmetrPosition.y)
		
		if !soundRadioOn.is_playing():
			soundRadioOn.play()
		
		print("Current radiostation:", signalRadio)
		print('Radio On')

func _on_signal_numbers_value_changed(value):
	var currentHzmetrPosition = hzmetr.position
	
	if !soundRadioSpeen.is_playing():
		soundRadioSpeen.play()
	
	numberLabel.text = "{value}Гц".format({"value":value})
	if (numerRadio < value):
		hzmetr.position = Vector2(currentHzmetrPosition.x + sizeLineStep, currentHzmetrPosition.y)
	else:
		hzmetr.position = Vector2(currentHzmetrPosition.x - sizeLineStep, currentHzmetrPosition.y)
	numerRadio = value


func switch_signals():
	var signalDistance = abs(signalRadio - numerRadio)

	if signalDistance > 2.0:
		spriteRedOn.show()
		spriteRedOff.hide()
		
		spriteGreenOff.show()
		spriteGreenOn.hide()
		
		spriteOrangeOff.show()
		spriteOrangeOn.hide()
		
		if !Music.soundRadioNoise.is_playing():
			Music.play_sound_radio_noise(true)
		
		if !soundRadioNoise.is_playing():
			soundRadioNoise.play()

		if Music.soundRadioStation1.is_playing():
			Music.play_sound_radio_station(false)
		
		if soundRadioStation1.is_playing():
			soundRadioStation1.stop()
		
	elif signalDistance <= 2.0 && signalDistance > 0.5:
		spriteRedOn.hide()
		spriteRedOff.show()
		
		spriteGreenOff.show()
		spriteGreenOn.hide()
		
		spriteOrangeOff.hide()
		spriteOrangeOn.show()
		
		if Music.soundRadioStation1.is_playing():
			Music.play_sound_radio_station(false)
		
		if soundRadioStation1.is_playing():
			soundRadioStation1.stop()
		
		if !Music.soundRadioNoise.is_playing():
			Music.play_sound_radio_noise(true)
			
		if !soundRadioNoise.is_playing():
			soundRadioNoise.play()
		
	elif signalDistance <= 0.3:
		spriteRedOn.hide()
		spriteRedOff.show()
		
		spriteGreenOff.hide()
		spriteGreenOn.show()
		
		spriteOrangeOff.show()
		spriteOrangeOn.hide()
		
		if !Music.soundRadioNoise.is_playing() && !Music.soundRadioStation1.is_playing():
			Music.play_sound_radio_station(true)
		elif Music.soundRadioNoise.is_playing():
			Music.play_sound_radio_noise(false)
			Music.play_sound_radio_station(true)
		
		if !soundRadioNoise.is_playing() && !soundRadioStation1.is_playing():
			soundRadioStation1.play()
		elif soundRadioNoise.is_playing():
			soundRadioNoise.stop()
			soundRadioStation1.play()
