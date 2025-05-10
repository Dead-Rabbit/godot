@tool

class_name RandomAnimatedSprite2D
extends Sprite2D

var max_frame : int = 0
var frame_to_refresh : int = 18
var refresh_frame : int = 0
var pre_anim_frame : int = 0


func _ready() -> void:
	max_frame = hframes * vframes
	pre_anim_frame = frame

	
func _process(_delta: float) -> void:
	# 更新动画帧
	refresh_frame += 1
	if refresh_frame >= frame_to_refresh:
		refresh_frame = 0

		var next_frame : int = randi() % hframes
		if pre_anim_frame == next_frame:
			next_frame += 1
			if next_frame == max_frame:
				next_frame = 0
			
		frame = next_frame
		pre_anim_frame = frame
	