extends Node2D

@onready var spriteInactivePhone = $PhoneIdle
@onready var spriteActivePhone = $PhoneRing
@onready var spriteSpeachPhone = $PhoneHangOutOn

func _on_button_phone_pressed():
	spriteActivePhone.show()
	spriteInactivePhone.hide()
