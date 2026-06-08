extends Node

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		get_tree().paused = !get_tree().paused
		

func _physics_process(delta: float) -> void:
	pass
