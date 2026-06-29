extends CharacterBody2D

@export_category("Movement")
@export var speed: float = 500.0

@export_category("Screen")
@export var screen_width: float = 1280.0
@export var screen_height: float = 720.0
@export var margin: float = 32.0

var direction: Vector2 = Vector2.ZERO

func _physics_process(_delta):
	read_input()
	move_player()
	keep_inside_screen()

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

func keep_inside_screen():
	global_position.x = clamp(global_position.x, margin, screen_width - margin)
	global_position.y = clamp(global_position.y, margin, screen_height - margin)
