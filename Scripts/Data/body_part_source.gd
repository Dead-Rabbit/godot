extends Resource
class_name BodyPartSource

@export_group("上")
@export var texture_up : Texture
@export var hFrames_up : int = 1
@export var vFrames_up : int = 1
@export var hFlip_up : bool = false
@export var vFlip_up : bool = false

@export_group("下")
@export var texture_down : Texture
@export var hFrames_down : int = 1
@export var vFrames_down : int = 1
@export var hFlip_down : bool = false
@export var vFlip_down : bool = false

@export_group("右")
@export var texture_right : Texture
@export var hFrames_right : int = 1
@export var vFrames_right : int = 1
@export var hFlip_right : bool = false
@export var vFlip_right : bool = false

@export_group("左")
@export var texture_left : Texture
@export var hFrames_left : int = 1
@export var vFrames_left : int = 1
@export var hFlip_left : bool = false
@export var vFlip_left : bool = false

func get_config(forward_type: Enums.CharactorForward) -> Dictionary:
	var config = {}
	match forward_type:
		Enums.CharactorForward.UP:
			config["texture"] = texture_up
			config["hFrames"] = hFrames_up
			config["vFrames"] = vFrames_up
			config["hFlip"] = hFlip_up
			config["vFlip"] = vFlip_up
		
		Enums.CharactorForward.DOWN:
			config["texture"] = texture_down
			config["hFrames"] = hFrames_down
			config["vFrames"] = vFrames_down
			config["hFlip"] = hFlip_down
			config["vFlip"] = vFlip_down
		
		Enums.CharactorForward.RIGHT:
			config["texture"] = texture_right
			config["hFrames"] = hFrames_right
			config["vFrames"] = vFrames_right
			config["hFlip"] = hFlip_right
			config["vFlip"] = vFlip_right
		
		Enums.CharactorForward.LEFT:
			config["texture"] = texture_left
			config["hFrames"] = hFrames_left
			config["vFrames"] = vFrames_left
			config["hFlip"] = hFlip_left
			config["vFlip"] = vFlip_left
		
		_:
			print_debug("BodyPartSource: get_config: invalid forward_type")

	return config