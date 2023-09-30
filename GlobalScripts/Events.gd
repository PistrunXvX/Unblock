extends Node
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

static func negative_event():
	print('negative')

static func succsess_event():
	print('succsess')

static func empty_event():
	print('empty')
