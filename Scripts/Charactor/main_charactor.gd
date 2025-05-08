extends Node2D

@onready var anim_player : AnimationPlayer = $AnimationPlayer

# 角色朝向
enum CharactorForward {
	LEFT,
	RIGHT,
	UP,
	DOWN
}
var charactor_forward : CharactorForward = CharactorForward.RIGHT

func _ready() -> void:
	# 角色初始朝向
	set_charactor_forward(CharactorForward.DOWN)

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
		
	
func set_charactor_forward(_forward : CharactorForward) -> void:
	# 设置角色朝向
	charactor_forward = _forward
	match charactor_forward:
		CharactorForward.LEFT:
			$Sprite.scale.x = -1
		CharactorForward.RIGHT:
			$Sprite.scale.x = 1
		CharactorForward.UP:
			$Sprite.rotation_degrees = 90
		CharactorForward.DOWN:
			$Sprite.rotation_degrees = 0
		
