extends CharacterBody2D

signal player_died

var _speed: float = 100.0
var _jump_speed: float = -300.0
var _alive: bool = true
var gravity: Vector2
var _alt_gravity = false

@export var animation: AnimatedSprite2D
@export var area_2d: Area2D
@export var EnDoorPosition: Node2D

func _ready():
	position = EnDoorPosition.position
	add_to_group("characters")
	area_2d.body_entered.connect(_damaged)


func _physics_process(delta):
	if !_alive:
		return
	
	#movimiento horizontal
	if Input.is_action_pressed("derecha"):
		animation.flip_h = false
		velocity.x = _speed

	elif Input.is_action_pressed("izquierda"):
		animation.flip_h = true
		velocity.x = -_speed
	else:
		velocity.x = 0

	#gravedad
	if _alt_gravity:
		gravity = -get_gravity()
	else:
		gravity = get_gravity()
	velocity += gravity * delta
	
	#salto
	if Input.is_action_pressed("saltar"):
		if _alt_gravity == false && is_on_floor():
			velocity.y = _jump_speed
		elif _alt_gravity && is_on_ceiling():
			velocity.y = -_jump_speed

	move_and_slide()



#recibir daño y morir
func _damaged(_body: Node2D) -> void:
	animation.modulate = Color(0.25, 0.25, 0.25, 1.0)
	_alive = false
	animation.stop()
	await get_tree().create_timer(1).timeout
	player_died.emit()



func _mod_gravity():
	for i in 2:
		animation.modulate = Color(1.0, 0.352, 0.0, 1.0)
		await get_tree().create_timer(0.05).timeout
		animation.modulate = self.modulate
		await get_tree().create_timer(0.05).timeout
	_alt_gravity = true
	scale.y = - scale.y
