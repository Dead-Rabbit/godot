extends Resource
class_name BodyPartSource

@export_group("上")
@export var texture_up : Texture
@export var hFrames_up : int = 1
@export var vFrames_up : int = 1
@export var scale_up : Vector2 = Vector2(1, 1)

@export_group("下")
@export var texture_down : Texture
@export var hFrames_down : int = 1
@export var vFrames_down : int = 1
@export var scale_down : Vector2 = Vector2(1, 1)

@export_group("右")
@export var texture_right : Texture
@export var hFrames_right : int = 1
@export var vFrames_right : int = 1
@export var scale_right : Vector2 = Vector2(1, 1)

@export_group("左")
@export var texture_left : Texture
@export var hFrames_left : int = 1
@export var vFrames_left : int = 1
@export var scale_left : Vector2 = Vector2(1, 1)
