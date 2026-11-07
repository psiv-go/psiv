extends Node2D

@onready var gun: Node2D = $gun

signal im_fired

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		if gun:
			gun.look_at(get_global_mouse_position())
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		print("BAHH")
		im_fired.emit()
