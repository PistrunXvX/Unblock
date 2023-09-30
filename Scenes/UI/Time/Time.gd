extends Control

@onready var progress = get_node("TimeProgressBar")
@onready var timer = get_node("TimeProgressBar/Timer")

# Called when the node enters the scene tree for the first time.
func _ready():
	
	#максимальное значения прогресс бара ко времени таймера
	progress.max_value = timer.wait_time
	
	#начальное значение прогресс бара ко времени таймера
	timer.wait_time = progress.value


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	#значение прогресс бара к оставшемуся времени таймера
	progress.value = timer.time_left
