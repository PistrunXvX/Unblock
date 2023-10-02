extends Node

@onready var soundRadioStation1 = $RadioSpeach
@onready var soundRadioNoise = $RadioNoise
@onready var soundCarArrive = $CarArrive
@onready var soundCarWait = $CarWait
@onready var soundCarDepart = $CarDepart
@onready var soundCarBeep = $CarBeep
@onready var soundPhoneRing = $RingPhone

func play_sound_radio_station(isPlay):
	if isPlay:
		soundRadioStation1.play()
	else:
		soundRadioStation1.stop()

func play_sound_radio_noise(isPlay):
	if isPlay:
		soundRadioNoise.play()
	else:
		soundRadioNoise.stop()
