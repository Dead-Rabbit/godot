extends Node

# 角色部位
enum CharactorPart {
	HEAD 		= 1,
	BODY 		= 2,
	HAND_LEFT 	= 3,
	HAND_RIGHT 	= 4,
	FOOT_LEFT	= 5,
	FOOT_RIGHT	= 6
}
# 角色部位调试字符串
var CharactorPartDebugStr = {
	CharactorPart.HEAD: "头部",
	CharactorPart.BODY: "身体",
	CharactorPart.HAND_LEFT: "左手",
	CharactorPart.HAND_RIGHT: "右手",
	CharactorPart.FOOT_LEFT: "左脚",
	CharactorPart.FOOT_RIGHT: "右脚"
}

# 角色朝向
enum CharactorForward {
	NONE,
	LEFT,
	RIGHT,
	UP,
	DOWN
}