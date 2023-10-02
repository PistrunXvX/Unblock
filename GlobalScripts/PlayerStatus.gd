extends Node

var stamina = 0
var health = 100
var time = 0
var hours = 0
var minuts = 0
var isRadioNoise = false
var isRadioStation = false
var stateMistake = 0

func radio_noise(isOn):
	isRadioNoise = isOn

func radio_station(isOn):
	isRadioStation = isOn
