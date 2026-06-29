extends Node2D

@export var speed: float = 300.0

@onready var bg1: Sprite2D = $BG1
@onready var bg2: Sprite2D = $BG2

var width: float

func _ready():
	width = bg1.get_rect().size.x * bg1.scale.x

	bg1.position = Vector2(0, 0)
	bg2.position = Vector2(width, 0)

func _process(delta):
	bg1.position.x -= speed * delta
	bg2.position.x -= speed * delta

	if bg1.position.x + width < 0:
		bg1.position.x = bg2.position.x + width

	if bg2.position.x + width < 0:
		bg2.position.x = bg1.position.x + width
