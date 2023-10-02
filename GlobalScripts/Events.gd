extends Node

var isCall = false
var isAcceptCall = false
var isStartDialog = false
var isFinishDialog = false
var isStartDay = false
var currentDialog = 0

func phone_call(call):
	isCall = call
	return isCall

func start_dialog(isStart, idDialog):
	isStartDialog = true
	currentDialog = idDialog
	
