extends Node

@onready var soundRadioStation1 = $RadioSpeach
@onready var soundRadioNoise = $RadioNoise

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
