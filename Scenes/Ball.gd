extends Node2D

var speed: Vector2 = Vector2.ZERO
@onready var ball_image: Sprite2D = $BallImage
@onready var ball_width: float = ball_image.texture.get_width() * ball_image.scale.x
@onready var ball_height: float = ball_image.texture.get_height() * ball_image.scale.y


func start_ball():
	speed = Vector2(200, 200).rotated(randf_range(0, 2 * PI))


func handle_out_of_bounds():
	if (
		position.x - ball_width / 2.0 < 0
		or position.x + ball_height / 2.0 > get_viewport_rect().size.x
	):
		speed.x *= -1
	if (
		position.y - ball_height / 2.0 < 0
		or position.y + ball_height / 2.0 > get_viewport_rect().size.y
	):
		speed.y *= -1


func _process(delta):
	if Input.is_action_just_pressed("start_game"):
		start_ball()
	handle_out_of_bounds()
	position += speed * delta
