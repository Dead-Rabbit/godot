extends Node

# 角色部位
enum CharactorPart {
	NONE 		= 0,
	HEAD 		= 1,
	BODY 		= 2,
	HAND_LEFT 	= 3,
	HAND_RIGHT 	= 4,
	FOOT_LEFT	= 5,
	FOOT_RIGHT	= 6
}

# 角色朝向
enum CharactorForward {
	LEFT,
	RIGHT,
	UP,
	DOWN
}