extends Node2D

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

	
func _process(_delta: float) -> void:
	# This function is called every frame. You can use it to update the aim point's position or other properties.
	# For example, you could make the aim point follow the mouse cursor:
	var mouse_position = get_global_mouse_position()
	position = mouse_position
