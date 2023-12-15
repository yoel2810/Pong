extends Paddle

@export var controlled_by_arrows = false


func move_paddle(delta):
	# If I want to support resizing the window, I need to update the screen_height
	# screen_height = get_viewport_rect().size.y

	var up: bool = Input.is_action_pressed("up2" if controlled_by_arrows else "up")
	var down: bool = Input.is_action_pressed("down2" if controlled_by_arrows else "down")

	if up:
		move_up(delta)
	if down:
		move_down(delta)
