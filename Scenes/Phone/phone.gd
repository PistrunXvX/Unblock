extends Node2D

@onready var soundPhoneAccept = $PhoneAccept

func _process(delta):
	if Events.isCall:
		ring_phone_start()
	if !Events.isCall:
		ring_phone_end()
#	if Events.isFinishDialog:
#		defult_state()

func _on_button_phone_pressed():
	$sprite.frame = 1
	if Music.soundPhoneRing.is_playing():
		Music.soundPhoneRing.stop()
	soundPhoneAccept.play()
	if Events.isCall:
		Events.phone_call(false)
		Events.isAcceptCall = true
		ring_phone_end()

func ring_phone_start():
	$sprite.frame = 5
	if !Music.soundPhoneRing.is_playing():
		Music.soundPhoneRing.play()

func ring_phone_end():
	$sprite.frame = 2
	if Music.soundPhoneRing.is_playing():
		Music.soundPhoneRing.stop()

func accept_phone_start():
	if Music.soundPhoneRing.is_playing():
		Music.soundPhoneRing.stop()
		soundPhoneAccept.play()

func defult_state():
	$sprite.frame = 2
