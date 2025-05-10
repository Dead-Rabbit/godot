extends Node2D
class_name MainCharactor

var CharactorPart = Enums.CharactorPart

@export var charactor_body_part: CharactorBodyPart
@onready var anim_player : AnimationPlayer = $AnimationPlayer

# 移动速度
var velocity: Vector2 = Vector2.ZERO
# 角色朝向
var charactor_forward : Enums.CharactorForward = Enums.CharactorForward.NONE

# 角色部位
func _ready() -> void:
	GameGlobal.GMainCharactor = self
	
	var suit_default_entity = Pandora.get_entity(BodyPartEntityIds.BODYPARTSUIT_DEFAULT)
	if suit_default_entity:
		var body_part_resource: BodyPartSuit = suit_default_entity.get_resource("body_part_source") as BodyPartSuit
		if body_part_resource:
			charactor_body_part.set_body_part_suit(body_part_resource)
	
	# 角色初始朝向
	set_charactor_forward(Enums.CharactorForward.DOWN)
	

func _process(delta: float) -> void:
	var move_speed = 200
	velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
		
	# 修改角色朝向
	if velocity.y > 0:
		set_charactor_forward(Enums.CharactorForward.DOWN)
	elif velocity.y < 0:
		set_charactor_forward(Enums.CharactorForward.UP)
	elif velocity.x > 0:
		set_charactor_forward(Enums.CharactorForward.RIGHT)
	elif velocity.x < 0:
		set_charactor_forward(Enums.CharactorForward.LEFT)
		
	if velocity != Vector2.ZERO:
		velocity = velocity.normalized() * move_speed
		position += velocity * delta
		
	update_animation()


func set_charactor_forward(_forward : Enums.CharactorForward) -> void:
	if charactor_forward == _forward:
		return
		
	charactor_forward = _forward
	charactor_body_part.set_charactor_forward(charactor_forward)
	update_animation()


# TODO 先简单播放动画，后面处理到 Animation Tree 中
func update_animation() -> void:
	var anim_name: String = ""
	var blend_time: float = 0.1
	var anim_speed: float = 1.0
	var pre_animation_name: String = anim_player.current_animation
	if charactor_forward == Enums.CharactorForward.UP or charactor_forward == Enums.CharactorForward.DOWN:
		if velocity.length() > 0:
			anim_name = "move_down"
			anim_speed = 3.6
		else:
			anim_name = "idle_down"
	
		$SpriteRoot.scale.x = (-1 if charactor_forward == Enums.CharactorForward.UP else 1)
	
	elif charactor_forward == Enums.CharactorForward.LEFT \
		or charactor_forward == Enums.CharactorForward.RIGHT:
		if velocity.length() > 0:
			anim_name = "move_right"
			anim_speed = 3.6
		else:
			anim_name = "idle_right"

		$SpriteRoot.scale.x = (-1 if charactor_forward == Enums.CharactorForward.LEFT else 1)

	if pre_animation_name == anim_name:
		return
		
	anim_player.play(anim_name, blend_time, anim_speed, true)
