@tool

class_name RandomAnimatedSprite2D
extends Sprite2D

var max_frame: int = 0
var time_to_refresh: float = 0.12
var refresh_remain_time: float = 0

var pre_anim_frame: int = 0

func _ready() -> void:
	max_frame = hframes * vframes
	refresh_remain_time = time_to_refresh
	pre_anim_frame = frame

	
func _process(delta: float) -> void:
	# 更新动画帧
	refresh_remain_time -= delta
	if refresh_remain_time <= 0:
		refresh_remain_time = time_to_refresh

		var next_frame : int = randi() % hframes
		if pre_anim_frame == next_frame:
			next_frame += 1
			if next_frame == max_frame:
				next_frame = 0
			
		frame = next_frame
		pre_anim_frame = frame
	