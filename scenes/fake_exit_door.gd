extends Node2D

@export var area_2d: Area2D
var childs

func _ready() -> void:
	area_2d.body_entered.connect(_fake_exit)

#IDFK DUDE
func _fake_exit(_body: Node2D) -> void:
	#visible = false
	#get_parent().get_parent().get_parent().childs := _instantiated_level.get_children()
	for i in childs.size():
		if childs[i].is_in_group("characters"):
			#childs[i].player_died.connect(_restart_level)
			break
