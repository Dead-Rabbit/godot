@tool

class_name CharactorBodyPartController
extends Node2D

@export_group("身体部位")
@export var body_part_head: CharactorBodyPart
@export var body_part_body: CharactorBodyPart
@export var body_part_hand_left: CharactorBodyPart
@export var body_part_hand_right: CharactorBodyPart
@export var body_part_foot_left: CharactorBodyPart
@export var body_part_foot_right: CharactorBodyPart
var body_part_dic: Dictionary = {
	Enums.CharactorPart.HEAD: null,
	Enums.CharactorPart.BODY: null,
	Enums.CharactorPart.HAND_LEFT: null,
	Enums.CharactorPart.HAND_RIGHT: null,
	Enums.CharactorPart.FOOT_LEFT: null,
	Enums.CharactorPart.FOOT_RIGHT: null
}

# 角色部位
var body_part_source_map: Dictionary = {
   Enums.CharactorPart.HEAD: null,
   Enums.CharactorPart.BODY: null,
   Enums.CharactorPart.HAND_LEFT: null,
   Enums.CharactorPart.HAND_RIGHT: null,
   Enums.CharactorPart.FOOT_LEFT: null,
   Enums.CharactorPart.FOOT_RIGHT: null,
}

@export_group("Debug")
@export var debug_body_part_suit: BodyPartSuit:
	set(new_suit):
		debug_body_part_suit = new_suit
		if Engine.is_editor_hint():
			set_body_part_suit(debug_body_part_suit)


func _ready() -> void:
	set_body_part_dic_cache(Enums.CharactorPart.HEAD, body_part_head)
	set_body_part_dic_cache(Enums.CharactorPart.BODY, body_part_body)
	set_body_part_dic_cache(Enums.CharactorPart.HAND_LEFT, body_part_hand_left)
	set_body_part_dic_cache(Enums.CharactorPart.HAND_RIGHT, body_part_hand_right)
	set_body_part_dic_cache(Enums.CharactorPart.FOOT_LEFT, body_part_foot_left)
	set_body_part_dic_cache(Enums.CharactorPart.FOOT_RIGHT, body_part_foot_right)


func set_body_part_dic_cache(part_type: Enums.CharactorPart, part: CharactorBodyPart) -> void:
	body_part_dic[part_type] = part
	part.body_part_type = part_type
	

# 获取角色部位精灵
func get_body_part_sprite(body_part_type: Enums.CharactorPart) -> RandomAnimatedSprite2D:
	return body_part_dic[body_part_type].sprite


# 设置一个套装
func set_body_part_suit(body_part_suit: BodyPartSuit) -> void:
	var body_part_list: Array[BodyPartSuitSource] = body_part_suit.body_part_list
	for body_part_suit_source: BodyPartSuitSource in body_part_list:
		var body_part_type: Enums.CharactorPart = body_part_suit_source.body_part_type
		set_body_part_source(body_part_type, body_part_suit_source.body_part_source as BodyPartSource)


# 设置角色部位
func set_body_part_source(body_part_type: Enums.CharactorPart, body_part_source: BodyPartSource) -> void:
	body_part_source_map[body_part_type] = body_part_source


# 设置角色朝向
func set_charactor_forward(_forward: Enums.CharactorForward) -> void:
	for body_part_type_key in Enums.CharactorPart:
		var body_part_type = Enums.CharactorPart[body_part_type_key]
		var sprite: RandomAnimatedSprite2D = get_body_part_sprite(body_part_type)
		if sprite == null:
			continue

		var body_part_source: BodyPartSource = body_part_source_map[body_part_type]
		if body_part_source == null:
			continue

		var texture_config: Dictionary = body_part_source.get_config(_forward)
		sprite.texture = texture_config["texture"]
		sprite.hframes = texture_config["hFrames"]
		sprite.vframes = texture_config["vFrames"]
		sprite.flip_h = texture_config["hFlip"]
		sprite.flip_v = texture_config["vFlip"]

		
	
func _process(_delta: float) -> void:
	if Engine.is_editor_hint():
		pass
		
	update_sort_order()
	

#region Sort Order
	
# 设置角色部位的排序
func update_sort_order() -> void:
	var children: Array[Node] = get_children()
	
	var body_part_list: Array[CharactorBodyPart] = []
	for child in children:
		if child is CharactorBodyPart:
			body_part_list.append(child)
	
	for i in range(body_part_list.size() - 1):
		var child: CharactorBodyPart = body_part_list[i] as CharactorBodyPart
		var child_index: int = child.get_index()
		var target_index: int = child_index
		for j in range(i + 1, body_part_list.size()):
			var next_child: CharactorBodyPart = body_part_list[j] as CharactorBodyPart
			if child.sort_order > next_child.sort_order:
				var next_child_index: int = next_child.get_index()
				target_index = next_child_index
		
		if target_index > child_index:
			move_child(child, target_index)
		
	
#endregion Sort Order