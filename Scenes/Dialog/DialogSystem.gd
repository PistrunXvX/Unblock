extends Control

var id = 0
var answer = 0
@onready var txt = $CanvasLayer/dialogWindow/RichTextLabel

@export var pitch_range = 0.1

func playSound():
	while txt.visible_ratio < 1:
		$AudioStreamPlayer.pitch_scale = randf_range(1 - pitch_range, 1 + pitch_range)
		$AudioStreamPlayer.play()
		txt.visible_characters += 1
		await get_tree().create_timer(0.04).timeout

func showDialog(id):
	txt.clear()
	txt.visible_ratio = 0
	match id:
		0:
			txt.add_text("BIMBIMBAMBAM")
		1:
			txt.add_text("Вода жидкая")
#			$AnimationPlayer.play("show_Answers")
#			match answer:
#				1: txt.add_text("Ты прав")
#				2: txt.add_text("Ты не прав")
#				3: txt.add_text("Ты пидор")
#			$AnimationPlayer.play("hide_Answers")
		2:
			txt.add_text("Начальник доложил")
		3:
			txt.add_text("Начальник наложил")
	playSound()

func _on_next_pressed():
	id += 1
	showDialog(id)


func _on_answer_1_pressed():
	pass

func _on_answer_2_pressed():
	pass

func _on_answer_3_pressed():
	pass
