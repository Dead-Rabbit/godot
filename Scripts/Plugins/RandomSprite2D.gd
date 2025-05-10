class_name RandomAnimatedSprite2D
extends Sprite2D

@export var is_environment : bool = false

var max_frame : int = 0
var frame_to_refresh : int = 18
var refresh_frame : int = 0
var pre_anim_frame : int = 0

func _ready() -> void:
	max_frame = hframes * vframes
	pre_anim_frame = frame
	pass

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
		
	# 更新场景的order
	var main_charactor : MainCharactor = GameGlobal.GMainCharactor
	if is_environment and main_charactor:
		if global_position.y > main_charactor.global_position.y:
			z_index = 10
		else:
			z_index = main_charactor.z_index - 1
	else:
		z_index = 1
		