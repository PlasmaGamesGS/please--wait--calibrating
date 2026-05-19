extends CharacterBody2D

var _speed: float = 100.0
var _jump_speed: float = -300.0

@export var Sprite: AnimatedSprite2D

func _physics_process(delta):
	#movimiento horizontal
	if Input.is_action_pressed("derecha"):
		Sprite.flip_h = false
		velocity.x = _speed

	elif Input.is_action_pressed("izquierda"):
		Sprite.flip_h = true
		velocity.x = -_speed
	else:
		velocity.x = 0

	#gravedad
	velocity += get_gravity() * delta
	
	#salto
	if Input.is_action_just_pressed("saltar") && is_on_floor():
		velocity.y = _jump_speed

	move_and_slide()
