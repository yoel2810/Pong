extends Node2D
class_name Paddle

@export var SPEED: int = 400

@onready var paddle_sprite = $PaddleImage
@onready var screen_height = get_viewport_rect().size.y


func move_up(delta):
	var new_position: int = max(
		position.y - SPEED * delta,
		0 + paddle_sprite.texture.get_height() * paddle_sprite.scale.y / 2
	)
	position.y = new_position


func move_down(delta):
	var new_position: int = min(
		position.y + SPEED * delta,
		screen_height - paddle_sprite.texture.get_height() * paddle_sprite.scale.y / 2
	)
	position.y = new_position


func move_paddle(_delta):
	pass


func _process(delta):
	move_paddle(delta)
