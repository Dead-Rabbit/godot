@tool

extends Node2D
class_name CharactorBodyPart

@export var sprite: RandomAnimatedSprite2D
@export var sort_order: int = 0

@export var body_part_type: Enums.CharactorPart

# IK 节点
@export var ik_node: Node2D

func _process(_delta: float) -> void:
	pass


func animation_modifyer() -> void:
	if ik_node:
		print(Enums.CharactorPartDebugStr[body_part_type], global_position)
		global_position = ik_node.global_position
