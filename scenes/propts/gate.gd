extends StaticBody2D

var opened: bool

@export var collision: CollisionShape2D
@export var animation: AnimationPlayer

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("secret"):
		if !opened:
			animation.play("open")
			opened = true
		else:
			animation.play("close")
			opened = false
