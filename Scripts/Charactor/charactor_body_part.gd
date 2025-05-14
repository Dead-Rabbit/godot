@tool

extends Node2D
class_name CharactorBodyPart

@export var sprite: RandomAnimatedSprite2D
@export var sort_order: int = 0

@export var body_part_type: Enums.CharactorPart

# IK 节点
@export var ik_node: Node2D

func _process(delta: float) -> void:
	if ik_node:
		global_position = ik_node.global_position
		pass
		