extends StaticBody2D

var dragging = false
var offset = Vector2(0, 0)

func _process(delta):
	if dragging:
		global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)

func _on_button_button_up():
	dragging = false

func _on_button_button_down():
	dragging = true
	offset = get_local_mouse_position() - position
