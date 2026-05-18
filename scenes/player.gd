extends CharacterBody2D


func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		velocity.x = 50
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -50
	else:
		velocity.x = 0
	move_and_slide()
