extends Node

var cameraDisplay1
var cameraDisplay2
var cameraDisplay2Paper
var cameraDisplay3
var cameraDisplay4
var cameraDisplay5
var cameraDisplay6

# Called when the node enters the scene tree for the first time.
func _ready():
	cameraDisplay1 = $Display/Display_1/CameraDisplay_1
	cameraDisplay2 = $Display/Display_2/CameraDisplay_2
	cameraDisplay3 = $Display/Display_3/CameraDisplay_3
	cameraDisplay4 = $Display/Display_4/CameraDisplay_4
	cameraDisplay5 = $Display/Display_5/CameraDisplay_5
	cameraDisplay6 = $Display/Display_6/CameraDisplay_6
	cameraDisplay2Paper = $Display/Display_Papers/CameraDisplay_2_papers

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_camera() 

func move_camera():
	#Move WASD Camera
	#Move Camera 1
	if Input.is_action_just_released("camera_move_right") && cameraDisplay1.enabled:
		GlobalCamera.transition_camera(cameraDisplay1, cameraDisplay2)
	if Input.is_action_just_pressed("camera_move_down") && cameraDisplay1.enabled:
		GlobalCamera.transition_camera(cameraDisplay1, cameraDisplay4)
	#Move Camera 2
	if Input.is_action_just_pressed("camera_move_left") && cameraDisplay2.enabled:
		GlobalCamera.transition_camera(cameraDisplay2, cameraDisplay1)
	if Input.is_action_just_pressed("camera_move_down") && cameraDisplay2.enabled:
		GlobalCamera.transition_camera(cameraDisplay2, cameraDisplay5)
	if Input.is_action_just_pressed("camera_move_right") && cameraDisplay2.enabled:
		GlobalCamera.transition_camera(cameraDisplay2, cameraDisplay3)
	#Move Camera 3
	if Input.is_action_just_pressed("camera_move_left") && cameraDisplay3.enabled:
		GlobalCamera.transition_camera(cameraDisplay3, cameraDisplay2)
	if Input.is_action_just_pressed("camera_move_down") && cameraDisplay3.enabled:
		GlobalCamera.transition_camera(cameraDisplay3, cameraDisplay6)
	#Move Camera 4
	if Input.is_action_just_pressed("camera_move_top") && cameraDisplay4.enabled:
		GlobalCamera.transition_camera(cameraDisplay4, cameraDisplay1)
	if Input.is_action_just_released("camera_move_right") && cameraDisplay4.enabled:
		GlobalCamera.transition_camera(cameraDisplay4, cameraDisplay5)
	#Moves Camera 5
	if Input.is_action_just_pressed("camera_move_left") && cameraDisplay5.enabled:
		GlobalCamera.transition_camera(cameraDisplay5, cameraDisplay4)
	if Input.is_action_just_pressed("camera_move_right") && cameraDisplay5.enabled:
		GlobalCamera.transition_camera(cameraDisplay5, cameraDisplay6)
	if Input.is_action_just_pressed("camera_move_top") && cameraDisplay5.enabled:
		GlobalCamera.transition_camera(cameraDisplay5, cameraDisplay2)
	#Moves Camera 6
	if Input.is_action_just_pressed("camera_move_left") && cameraDisplay6.enabled:
		GlobalCamera.transition_camera(cameraDisplay6, cameraDisplay5)
	if Input.is_action_just_pressed("camera_move_top") && cameraDisplay6.enabled:
		GlobalCamera.transition_camera(cameraDisplay6, cameraDisplay3)

# Camera 1 Move
func _on_enter_mouse_fisplay_1_mouse_entered():
	GlobalCamera.transition_camera(cameraDisplay1, cameraDisplay2)
	
func _on_enter_mouse_display_down_1_mouse_entered():
	GlobalCamera.transition_camera(cameraDisplay1, cameraDisplay4)

# Camera 2 Move
func _on_enter_mouse_display_left_2_mouse_entered():
	GlobalCamera.transition_camera(cameraDisplay2, cameraDisplay1)

func _on_enter_mouse_display_down_2_mouse_entered():
	GlobalCamera.transition_camera(cameraDisplay2, cameraDisplay5)

func _on_enter_mouse_display_right_2_mouse_entered():
	GlobalCamera.transition_camera(cameraDisplay2, cameraDisplay3)

#Camera 3 Moves
func _on_enter_mouse_display_left_3_mouse_entered():
	GlobalCamera.transition_camera(cameraDisplay3, cameraDisplay2)

func _on_enter_mouse_display_down_3_mouse_entered():
	GlobalCamera.transition_camera(cameraDisplay3, cameraDisplay6)

#Camera 4 Moves
func _on_enter_mouse_display_top_4_mouse_entered():
	GlobalCamera.transition_camera(cameraDisplay4, cameraDisplay1)

func _on_enter_mouse_display_right_4_mouse_entered():
	GlobalCamera.transition_camera(cameraDisplay4, cameraDisplay5)

#Camera 5 Moves
func _on_enter_mouse_display_left_5_mouse_entered():
	GlobalCamera.transition_camera(cameraDisplay5, cameraDisplay4)

func _on_enter_mouse_display_right_5_mouse_entered():
	GlobalCamera.transition_camera(cameraDisplay5, cameraDisplay6)

func _on_enter_mouse_display_top_5_mouse_entered():
	GlobalCamera.transition_camera(cameraDisplay5, cameraDisplay2)

#Camera 6 Moves
func _on_enter_mouse_display_left_6_mouse_entered():
	GlobalCamera.transition_camera(cameraDisplay6, cameraDisplay5)

func _on_enter_mouse_display_top_6_mouse_entered():
	GlobalCamera.transition_camera(cameraDisplay6, cameraDisplay3)

func _on_button_pressed():
	GlobalCamera.transition_camera(cameraDisplay2, cameraDisplay2Paper)

func _on_enter_mouse_display_papers_mouse_entered():
	GlobalCamera.transition_camera(cameraDisplay2Paper, cameraDisplay2)
