extends CharacterBody2D

@export var speed: float = 500.0
@export var bullet_scene: PackedScene

@onready var gun: Marker2D = $Gun

var direction: Vector2 = Vector2.ZERO

func _physics_process(delta):
	read_input()
	move_player()

	if Input.is_action_just_pressed("shoot"):
		print("Disparo detectado")  # Verifica se está sendo chamado
		shoot()

func read_input():
	direction = Input.get_vector(
		"move_left",
		"move_right",
		"move_up",
        "move_down"
	)

func move_player():
	velocity = direction * speed
	move_and_slide()

func shoot():
	if bullet_scene == null or gun == null:
		return

	var bullet = bullet_scene.instantiate()
	get_tree().current_scene.add_child(bullet)
	bullet.global_position = gun.global_position
