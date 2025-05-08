extends Node2D

@onready var anim_player : AnimationPlayer = $AnimationPlayer

var CharactorPart = Enums.CharactorPart

# 角色朝向
var charactor_forward : Enums.CharactorForward = Enums.CharactorForward.RIGHT

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
		anim_player.play("idle")
		
	
func set_charactor_forward(_forward : Enums.CharactorForward) -> void:
	# 设置角色朝向
	charactor_forward = _forward

	
func set_body_part_suit(suit_name) -> void:
	
	pass

# 设置角色部位
func set_body_part_source(body_part_type: Enums.CharactorPart, body_part_source: BodyPartSource) -> void:
	
	pass