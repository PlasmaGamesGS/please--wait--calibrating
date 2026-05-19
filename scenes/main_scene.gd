extends Node2D


@export var levels: Array[PackedScene]

var _current_level: int = 0
var _instantiated_level: Node


func _ready() -> void:
	_create_level(_current_level)


func _create_level(level_number: int):
	_instantiated_level = levels[level_number].instantiate()
	add_child(_instantiated_level)
	
	var childs := _instantiated_level.get_children()
	for i in childs.size():
		if childs[i].is_in_group("characters"):
			childs[i].player_died.connect(_restart_level)
			break


func _delete_level():
	_instantiated_level.queue_free()
	
	
func _restart_level():
	_delete_level()
	_create_level.call_deferred(_current_level)
