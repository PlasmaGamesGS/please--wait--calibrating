extends CharacterBody2D

signal player_died

var _speed: float = 100.0
var _jump_speed: float = -300.0
var _alive: bool = true

@export var animation: AnimatedSprite2D
@export var area_2d: Area2D
@export var EnDoorPosition: Node2D

func _ready():
	position = EnDoorPosition.position
	add_to_group("characters")
	area_2d.body_entered.connect(_on_area_2d_body_entered)


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

	#gravedadget
	velocity += get_gravity() * delta
	
	#salto
	if Input.is_action_pressed("saltar") && is_on_floor():
		velocity.y = _jump_speed

	move_and_slide()



#recibir daño y morir
func _on_area_2d_body_entered(_body: Node2D) -> void:
	animation.modulate = Color(0.25, 0.25, 0.25, 1.0)
	_alive = false
	animation.stop()
	await get_tree().create_timer(1).timeout
	player_died.emit()
