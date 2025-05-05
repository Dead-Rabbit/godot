class_name RandomAnimatedSprite2D
extends Sprite2D

@export var frame_to_refresh : int = 15
@export var max_frame : int = 0

var refresh_frame : int = 0
var pre_anim_frame : int = 0

func _ready() -> void:
	pre_anim_frame = frame
	pass

func _process(delta: float) -> void:
	refresh_frame += 1
	if refresh_frame >= frame_to_refresh:
		refresh_frame = 0

		frame = randi() % hframes
		
		if pre_anim_frame == frame:
			frame += 1
			if frame == max_frame:
				frame = 0
			
		pre_anim_frame = frame
