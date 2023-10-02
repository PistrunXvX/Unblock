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

static func set_client(object):
	var client = {
		surnameClient = $Surname,
		nameClient = $Name,
		carBrand = $carBrand,
		carColor = $carColor,
		carNumber = $carNumber,
	}
	
	client.surnameClient.text = "Фамилия: {name}".format({"name":object.name})
	client.nameClient.text = "Имя: {name}".format({"name":object.surname})
	client.carBrand.text = "Марка: {name}".format({"name":object.carBrand})
	client.carColor.text = "Цвет: {name}".format({"name":object.carColor})
	client.carNumber.text = "Номер: {name}".format({"name":object.carNum})


