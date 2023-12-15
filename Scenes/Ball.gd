extends Node2D

var speed: Vector2 = Vector2.ZERO

@onready var ball_image: Sprite2D = $BallImage
@onready var ball_width: float = ball_image.texture.get_width() * ball_image.scale.x
@onready var ball_height: float = ball_image.texture.get_height() * ball_image.scale.y
@onready var audio_ball_collision = $AudioStreamPaddleCollision
@onready var audio_ball_y_collision = $AudioStreamUpDownCollision
@onready var audio_score = $AudioStreamScore


func start_ball():
	Globals.game_state = "playing"
	speed = Vector2(200, 200).rotated(randf_range(0, 2 * PI))


func handle_out_of_bounds():
	if position.x - ball_width / 2.0 < 0:
		Globals.right_player_score += 1
		reset_ball()
		audio_score.play()

	if position.x + ball_height / 2.0 > get_viewport_rect().size.x:
		Globals.left_player_score += 1
		reset_ball()
		audio_score.play()

	if (
		position.y - ball_height / 2.0 < 0
		or position.y + ball_height / 2.0 > get_viewport_rect().size.y
	):
		audio_ball_y_collision.play()
		speed.y *= -1


func _process(delta):
	if Globals.game_state == "idle" and Input.is_action_just_pressed("start_game"):
		if Globals.left_player_score == 10 or Globals.right_player_score == 10:
			Globals.left_player_score = 0
			Globals.right_player_score = 0
		start_ball()
	handle_out_of_bounds()
	position += speed * delta


func _on_area_2d_area_entered(_area: Area2D):
	speed.x *= -1
	speed *= 1.05
	audio_ball_collision.play()
	if speed.x > 0:
		speed = speed.rotated(randf_range(-PI / 2, PI / 2))
		speed.x = abs(speed.x)
	else:
		speed = speed.rotated(randf_range(-PI / 2, PI / 2))
		speed.x = -abs(speed.x)

	if abs(abs(int(speed.angle() * 180 / PI) % 90) - 90) <= 15:
		var positive_speed = speed.x > 0
		speed = speed.rotated(PI / 4)
		if positive_speed:
			speed.x = abs(speed.x)
		else:
			speed.x = -abs(speed.x)


func reset_ball():
	position = Vector2(get_viewport_rect().size.x / 2, get_viewport_rect().size.y / 2)
	speed = Vector2.ZERO
	Globals.game_state = "idle"
