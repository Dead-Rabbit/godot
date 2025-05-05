extends Node2D

@onready var aim_sprite : Sprite2D = $Sprite2D 

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _process(delta: float) -> void:
	# This function is called every frame. You can use it to update the aim point's position or other properties.
	# For example, you could make the aim point follow the mouse cursor:
	var mouse_position = get_global_mouse_position()
	position = mouse_position

#func _input(event):
#	if event is InputEventMouseButton:
#		if event.is_pressed():
#			# Handle mouse button press (e.g., fire a projectile)
#			print("Fire projectile from aim point at: ", position)