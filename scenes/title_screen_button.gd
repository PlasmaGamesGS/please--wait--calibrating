extends Button

@export var title_screen: PackedScene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(_replay)


func _replay():
	title_screen.can_instantiate()
	title_screen.instantiate()
	get_tree().change_scene_to_packed(title_screen)
