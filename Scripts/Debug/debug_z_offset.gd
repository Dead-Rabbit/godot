@tool

extends Node2D
class_name DebugZOffset

@export var debug_target: Node2D
@export var debug_label_scene: PackedScene
@export var debug_append_name: String = ""

var label : Label = null

func _ready() -> void:
	# 在图片位置上添加一个标签，并显示当前的 z_index
	if not label:
		label = debug_label_scene.instantiate()
		
		var debug_z_index: int = z_index
		if debug_target:
			debug_z_index = debug_target.z_index
			
		label.z_index = 10
		label.text = str(debug_z_index)
		add_child(label)
		label.show()

		
func _process(_delta: float) -> void:
	if label:
		var debug_z_index: int = z_index
		if debug_target:
			debug_z_index = debug_target.z_index
			
		label.text = str(debug_z_index)
