extends Node

var camera2D
var tween
var transitioning: bool = false
@export var duration = 1.0

func _ready():
	camera2D = $Camera2D

func static_transition_camera(from: Camera2D, to: Camera2D):
	if transitioning: return
	tween = get_tree().create_tween()
	camera2D.zoom = from.zoom
	camera2D.offset = from.offset
	camera2D.light_mask = from.light_mask
	camera2D.set_anchor_mode(1)
	
	camera2D.global_transform = from.global_transform
	
	camera2D.enabled = true
	
	transitioning = true
#
	tween.stop()
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(camera2D, "global_transform", to.global_transform, 0).from(from.global_transform)
	tween.play()
	
	await tween.finished
	
	to.enabled = true
	from.enabled = false
	transitioning = false
	
	to.enabled = true
	from.enabled = false

func transition_camera(from: Camera2D, to: Camera2D):
	if transitioning: return
	tween = get_tree().create_tween()
	camera2D.zoom = from.zoom
	camera2D.offset = from.offset
	camera2D.light_mask = from.light_mask
	camera2D.set_anchor_mode(1)
	
	camera2D.global_transform = from.global_transform
	
	camera2D.enabled = true
	
	transitioning = true
#
	tween.stop()
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(camera2D, "global_transform", to.global_transform, duration).from(from.global_transform)
	tween.play()
	
	await tween.finished
	
	to.enabled = true
	from.enabled = false
	transitioning = false
#
func switch_camera(from, to) -> void:
	from.enabled = false
	to.enabled = true
