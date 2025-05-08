extends Node2D

var CharactorPart = Enums.CharactorPart

@export_group("身体部位")
@export var sprite_body_part_head: RandomAnimatedSprite2D
@export var sprite_body_part_body: RandomAnimatedSprite2D
@export var sprite_body_part_hand_left: RandomAnimatedSprite2D
@export var sprite_body_part_hand_right: RandomAnimatedSprite2D
@export var sprite_body_part_foot_left: RandomAnimatedSprite2D
@export var sprite_body_part_foot_right: RandomAnimatedSprite2D

@onready var anim_player : AnimationPlayer = $AnimationPlayer

# 角色朝向
var charactor_forward : Enums.CharactorForward = Enums.CharactorForward.NONE

# 角色部位
var charactor_body_part : Dictionary = {
	CharactorPart.HEAD: null,
	CharactorPart.BODY: null,
	CharactorPart.HAND_LEFT: null,
	CharactorPart.HAND_RIGHT: null,
	CharactorPart.FOOT_LEFT: null,
	CharactorPart.FOOT_RIGHT: null,
}

# 角色部位
func _ready() -> void:
	var suit_default_entity = Pandora.get_entity(BodyPartEntityIds.BODYPARTSUIT_DEFAULT)
	if suit_default_entity:
		var body_part_resource: BodyPartSuit = suit_default_entity.get_resource("body_part_source") as BodyPartSuit
		if body_part_resource:
			set_body_part_suit(body_part_resource)
	
	# 角色初始朝向
	set_charactor_forward(Enums.CharactorForward.DOWN)

func _process(delta: float) -> void:
	var move_speed = 200
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
		
	if velocity != Vector2.ZERO:
		velocity = velocity.normalized() * move_speed
		position += velocity * delta
#		anim_player.play("run")
	else:
		anim_player.play("idle_down")
		
		
	
# 获取角色部位精灵
func get_body_part_sprite(body_part_type: Enums.CharactorPart) -> RandomAnimatedSprite2D:
	match body_part_type:
		CharactorPart.HEAD:
			return sprite_body_part_head
		CharactorPart.BODY:
			return sprite_body_part_body
		CharactorPart.HAND_LEFT:
			return sprite_body_part_hand_left
		CharactorPart.HAND_RIGHT:
			return sprite_body_part_hand_right
		CharactorPart.FOOT_LEFT:
			return sprite_body_part_foot_left
		CharactorPart.FOOT_RIGHT:
			return sprite_body_part_foot_right
		_:
			print("get_body_part_sprite: invalid body part type")
	return null
	
	
# 设置一个套装
func set_body_part_suit(body_part_suit: BodyPartSuit) -> void:
	var body_part_list: Array[BodyPartSuitSource] = body_part_suit.body_part_list
	for body_part_suit_source: BodyPartSuitSource in body_part_list:
		var body_part_type: Enums.CharactorPart = body_part_suit_source.body_part_type
		set_body_part_source(body_part_type, body_part_suit_source.body_part_source as BodyPartSource)
		
	
# 设置角色部位
func set_body_part_source(body_part_type: Enums.CharactorPart, body_part_source: BodyPartSource) -> void:
	charactor_body_part[body_part_type] = body_part_source


# 设置角色朝向
func set_charactor_forward(_forward : Enums.CharactorForward) -> void:
	if charactor_forward == _forward:
		return
	charactor_forward = _forward
	
	for body_part_type_key in CharactorPart:
		var body_part_type = CharactorPart[body_part_type_key]
		var sprite: RandomAnimatedSprite2D = get_body_part_sprite(body_part_type)
		if sprite == null:
			continue

		var body_part_source: BodyPartSource = charactor_body_part[body_part_type]
		if body_part_source == null:
			continue

		var texture_config: Dictionary = body_part_source.get_config(_forward)
		sprite.texture = texture_config["texture"]
		sprite.hframes = texture_config["hFrames"]
		sprite.vframes = texture_config["vFrames"]
		sprite.flip_h = texture_config["hFlip"]
		sprite.flip_v = texture_config["vFlip"]
