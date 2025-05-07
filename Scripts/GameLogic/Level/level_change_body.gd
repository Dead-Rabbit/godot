extends Node2D

@export var camera : Camera2D
@export var player : Node2D


func _process(_delta: float) -> void:
	camera.position = player.position + Vector2(0, -50)