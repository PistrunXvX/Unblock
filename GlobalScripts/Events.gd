extends Node

var isCall = false
var isAcceptCall = false
var isStartDialog = false
var isFinishDialog = false
var isStartDay = false
var currentDialog = 0
var currentCar = 0
var carSpaw = false
var isFail = false
var isWin = false

func phone_call(call):
	isCall = call
	return isCall

func start_dialog(isStart, idDialog):
	isStartDialog = true
	currentDialog = idDialog
	isCall = false

func car_spawn(isSpanw):
	carSpaw = isSpanw
	return carSpaw
	
