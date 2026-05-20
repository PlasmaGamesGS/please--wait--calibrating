extends Node2D

@export var area_2d: Area2D

func _ready() -> void:
	area_2d.body_entered.connect(_exit)


func _exit(_body: Node2D) -> void:
	get_parent().get_parent().next_level()
	
