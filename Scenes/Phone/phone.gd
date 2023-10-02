extends Node2D

@onready var spriteInactivePhone = $PhoneIdle
@onready var spriteActivePhone = $PhoneRing
@onready var spriteSpeachPhone = $PhoneHangOutOn
@onready var soundPhoneAccept = $PhoneAccept

func _process(delta):
	if Events.isCall:
		ring_phone_start()
#	if Events.isFinishDialog:
#		defult_state()

func _on_button_phone_pressed():
	spriteActivePhone.hide()
	spriteInactivePhone.hide()
	spriteSpeachPhone.show()
	if Music.soundPhoneRing.is_playing():
		Music.soundPhoneRing.stop()
	soundPhoneAccept.play()
	if Events.isCall:
		Events.phone_call(false)
		Events.isAcceptCall = true
		ring_phone_end()

func ring_phone_start():
	spriteActivePhone.show()
	spriteInactivePhone.hide()
	if !Music.soundPhoneRing.is_playing():
		Music.soundPhoneRing.play()

func ring_phone_end():
	spriteActivePhone.hide()
	spriteInactivePhone.show()
	if Music.soundPhoneRing.is_playing():
		Music.soundPhoneRing.stop()

func accept_phone_start():
	if Music.soundPhoneRing.is_playing():
		Music.soundPhoneRing.stop()
		soundPhoneAccept.play()

func defult_state():
	spriteActivePhone.hide()
	spriteInactivePhone.show()
	spriteSpeachPhone.hide()
